module MEM2WB_Register(
	input clk,
	input [1:0]WB, //{RegWrite,MemToReg}
	input [4:0]RD,
	input [31:0]MemData,ALU_result,
	output reg [1:0]WB_o,
	output reg [4:0]RD_o,
	output reg [31:0]MemData_o,ALU_result_o);

initial begin
WB_o=0;
MemData_o=0;
ALU_result_o=0;
RD_o=0;
end

always @(posedge clk)begin

WB_o<=WB;
MemData_o<=MemData;
ALU_result_o<=ALU_result;
RD_o<=RD;

end
endmodule 
