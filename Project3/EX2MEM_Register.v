module EX2MEM_Register(
	input clk,zero,
	input [1:0]WB, //{RegWrite,MemToReg}
	input [2:0]M,  //{Branch,MemRead,MemWrite}
	input [4:0]RD,
	input [31:0]ALU_result,WriteData,
	output reg zero_o,
	output reg [1:0]WB_o,
	output reg [2:0]M_o,
	output reg [4:0]RD_o,
	output reg [31:0]ALU_result_o,WriteData_o);

initial begin

WB_o=0;
M_o=0;
ALU_result_o=0;
WriteData_o=0;
zero_o=0;
RD_o=0;

end

always @(posedge clk)begin

WB_o<=WB;
M_o<=M;
ALU_result_o<=ALU_result;
WriteData_o<=WriteData;
zero_o<=zero;
RD_o<=RD;

end
endmodule 