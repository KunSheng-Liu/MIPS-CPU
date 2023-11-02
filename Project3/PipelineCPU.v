module PipelineCPU(
	input [31:0] Addr_in,
 	input clk,
 	output [31:0] Addr_o
 	);

reg [31:0]WB_REG=0;
reg wr_reg=0;
reg [4:0]RD_REG=0;

wire ALUSrc,RegWrite,RegDst,MemRead,MemWrite,MemtoReg,Jump,Branch,DoBranch;
wire zero_EX,zero_MEM,stall;
wire [1:0]ALUOp;
wire [1:0]WB_EX,WB_MEM,WB_WB; //{RegWrite,MemtoReg}
wire [2:0]M_EX,M_MEM;  //{Branch,MemRead,MemWrite}
wire [3:0]EX_EX; //{RegDst,ALUSrc,ALUOP[1:0]}
wire [5:0]operation;

wire [1:0]Forward_RS,Forward_RT;
wire [4:0]RD_EX,RD_MEM,RD_WB;
wire [4:0]EX_RD1,EX_RD2;
wire [4:0]RS_addr,RT_addr;
wire [31:0]PC_IF,PC_add4;
wire [31:0]RS_ID,RS_EX,RS_MUX;
wire [31:0]RT_ID,RT_EX,RT_MUX;
wire [31:0]Instruction_IF,Instrucion_ID;
wire [31:0]Immediately_ID,Immediately_EX;
wire [31:0]Result_EX,Result_MEM,Result_WB,WriteData_MEM;
wire [31:0]DMdata_MEM,DMdata_WB;
wire [31:0]MUX32b2ALU,MUX32b2RDwr;


//-------------------------------------     IF      ---------------------------------------------------//

Adder PC_Adder(.data1(Addr_in),.data2(32'd4),.data_o(PC_add4));//PC+4

assign PC_IF=stall?Addr_in:PC_add4;

assign Addr_o=stall?PC_IF-4:PC_IF;
//.clk(clk),.stall(stall),
IM my_IM(.Addr_in(Addr_in),.Instruction(Instruction_IF));//Fatch Instrucion

IF2ID_Register my_IF2ID(.clk(clk),.instruction(Instruction_IF),.instruction_o(Instrucion_ID)); //IF/ID

//-------------------------------------     ID      ---------------------------------------------------//

Hazard_Detection myDetection(.MemRead(M_EX[1]),.RS_addr(Instrucion_ID[25:21]),.RT_addr(Instrucion_ID[20:16]),.RT_ID(RT_addr),.stall(stall));

Control my_Ctrl(.Op(Instrucion_ID[31:26]),.ALUOp(ALUOp),.RegWrite(RegWrite),.RegDst(RegDst),.ALUSrc(ALUSrc),
	.MemWrite(MemWrite),.MemRead(MemRead),.MemtoReg(MemtoReg),.Branch(Branch),.Jump(Jump));

RF my_RF(.RegWrite(WB_WB[1]),.RS_Address(Instrucion_ID[25:21]),.RT_Address(Instrucion_ID[20:16]),
	.RD_Address(RD_WB),.RSdata(RS_ID),.RTdata(RT_ID),.RDdata(MUX32b2RDwr),.clk(clk));

SE my_SE(.data_i(Instrucion_ID[15:0]),.data_o(Immediately_ID));

ID2EX_Register my_ID2EX(.clk(clk),.WB({RegWrite,MemtoReg}),.M({Branch,MemRead,MemWrite}),.EX({RegDst,ALUSrc,ALUOp}),
			.RS(RS_ID),.RT(RT_ID),.Immediately(Immediately_ID),.RD1(Instrucion_ID[15:11]),.RD2(Instrucion_ID[20:16]),
			.RS_addr(Instrucion_ID[25:21]),.RT_addr(Instrucion_ID[20:16]),
			.WB_o(WB_EX),.M_o(M_EX),.EX_o(EX_EX),.RS_o(RS_EX),.RT_o(RT_EX),.Immediately_o(Immediately_EX),
			.RD1_o(EX_RD1),.RD2_o(EX_RD2),.RS_addr_o(RS_addr),.RT_addr_o(RT_addr));

//-------------------------------------     EX      ---------------------------------------------------//

MUX5b RD_MUX(.data0(EX_RD1),.data1(EX_RD2),.select(RegDst),.data_o(RD_EX));

ALUcrtl my_ALUcrtl(.funct(Immediately_EX[5:0]),.ALUOp(EX_EX[1:0]),.operation(operation));

Forwarding_unit myForwarding_unit(.wr_MEM(WB_MEM[1]),.wr_WB(WB_WB[1]),.wr_REG(wr_reg),.RS_ID(RS_addr),.RT_ID(RT_addr),.RD_MEM(RD_MEM),.RD_WB(RD_WB),.RD_REG(RD_REG),.ForwardA(Forward_RS),.ForwardB(Forward_RT));

MUX32b_3X1 RS_hazard(.select(Forward_RS),.ID(RS_EX),.MEM(Result_MEM),.WB(MUX32b2RDwr),.REG(WB_REG),.out(RS_MUX));

MUX32b_3X1 RT_hazard(.select(Forward_RT),.ID(RT_EX),.MEM(Result_MEM),.WB(MUX32b2RDwr),.REG(WB_REG),.out(RT_MUX));

MUX32b ALU_MUX(.data0(RT_MUX),.data1(Immediately_EX),.select(EX_EX[2]),.data_o(MUX32b2ALU));

ALU my_ALU(.Source1(RS_MUX),.Source2(MUX32b2ALU),.operation(operation),.shamt(Immediately_EX[10:6]),.result(Result_EX),.zero(zero_EX));

EX2MEM_Register my_EX2MEM(.clk(clk),.WB(WB_EX),.M(M_EX),.ALU_result(Result_EX),.WriteData(RT_MUX),.zero(zero_EX),.RD(RD_EX),
	.WB_o(WB_MEM),.M_o(M_MEM),.ALU_result_o(Result_MEM),.WriteData_o(WriteData_MEM),.zero_o(zero_MEM),.RD_o(RD_MEM));

//-------------------------------------     MEM      ---------------------------------------------------//

and a1(DoBranch,zero_MEM,M_MEM[2]);

DM my_DM(.clk(clk),.Address(Result_MEM),.data(WriteData_MEM),.MemRead(M_MEM[1]),.MemWrite(M_MEM[0]),.DM_data(DMdata_MEM));

MEM2WB_Register myMEM2WB(.clk(clk),.WB(WB_MEM),.MemData(DMdata_MEM),.ALU_result(Result_MEM),.RD(RD_MEM),.WB_o(WB_WB),.MemData_o(DMdata_WB),
			.ALU_result_o(Result_WB),.RD_o(RD_WB));

//-------------------------------------     WB      ---------------------------------------------------//

MUX32b RDwr_MUX(.data0(Result_WB),.data1(DMdata_WB),.select(WB_WB[0]),.data_o(MUX32b2RDwr));

	
//-------------------------------------     WB      ---------------------------------------------------//

always @(posedge clk)begin
WB_REG<=MUX32b2RDwr;
wr_reg<=WB_WB[1];
RD_REG<=RD_WB;
end


endmodule
