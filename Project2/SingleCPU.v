module SingleCPU(
	input [31:0] Addr_in,
 	input clk,
 	output [31:0] Addr_o
 	);
wire [31:0]Instruction,RSdata,RTdata,Result,MUX32b2ALU,Immediately,DM_data,MUX32b2RDwr,NextPC,PC_Branch,Branch2Jump;
wire [5:0]operation;
wire [4:0]MUX5b2RD;
wire [1:0]ALUOp;
wire ALUSrc,RegWrite,RegDst,MemRead,MemWrite,MemtoReg,Jump,Branch,zero,carry,DoBranch;

IM my_IM(.Addr_in(Addr_in),.Instruction(Instruction));

Adder PC_Adder(.data1(Addr_in),.data2(32'd4),.data_o(NextPC));

MUX5b RD_MUX(.data0(Instruction[15:11]),.data1(Instruction[20:16]),.select(RegDst),.data_o(MUX5b2RD));

RF my_RF(.RegWrite(RegWrite),.RS_Address(Instruction[25:21]),.RT_Address(Instruction[20:16]),
	.RD_Address(MUX5b2RD),.RSdata(RSdata),.RTdata(RTdata),.RDdata(MUX32b2RDwr),.clk(clk));

SE my_SE(.data_i(Instruction[15:0]),.data_o(Immediately));

MUX32b ALU_MUX(.data0(RTdata),.data1(Immediately),.select(ALUSrc),.data_o(MUX32b2ALU));

Control my_Ctrl(.Op(Instruction[31:26]),.ALUOp(ALUOp),.RegWrite(RegWrite),.RegDst(RegDst),.ALUSrc(ALUSrc),
	.MemWrite(MemWrite),.MemRead(MemRead),.MemtoReg(MemtoReg),.Branch(Branch),.Jump(Jump));

DM my_DM(.clk(clk),.Address(Result),.data(RTdata),.MemRead(MemRead),.MemWrite(MemWrite),.DM_data(DM_data));

MUX32b RDwr_MUX(.data0(Result),.data1(DM_data),.select(MemtoReg),.data_o(MUX32b2RDwr));

ALUcrtl my_ALUcrtl(.funct(Instruction[5:0]),.ALUOp(ALUOp),.operation(operation));

ALU my_ALU(.Source1(RSdata),.Source2(MUX32b2ALU),.operation(operation),.shamt(Instruction[10:6]),.result(Result),.zero(zero),.carry(carry));

and a1(DoBranch,zero,Branch);

ALU addr_ALU(.Source1({Immediately<<2}),.Source2(NextPC),.operation(6'd27),.result(PC_Branch));

MUX32b Branch_MUX(.data0(NextPC),.data1(PC_Branch),.select(DoBranch),.data_o(Branch2Jump));

MUX32b Jump_MUX(.data0(Branch2Jump),.data1({NextPC[31:28],Instruction[25:0],2'b00}),.select(Jump),.data_o(Addr_o));
	
endmodule
