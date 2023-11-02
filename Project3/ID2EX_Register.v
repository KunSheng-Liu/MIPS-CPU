module ID2EX_Register(
	input clk,
	input [1:0]WB, //{RegWrite,MemToReg}
	input [2:0]M,  //{Branch,MemRead,MemWrite}
	input [3:0]EX, //{RegDst,ALUSrc,ALUOP[1:0]}
	input [4:0]RD1,RD2,RS_addr,RT_addr,
	input [31:0]RS,RT,Immediately,
	output reg [1:0]WB_o,
	output reg [2:0]M_o,
	output reg [3:0]EX_o,
	output reg [4:0]RD1_o,RD2_o,RS_addr_o,RT_addr_o,
	output reg [31:0]RS_o,RT_o,Immediately_o);

initial begin
WB_o=0;
M_o=0;
EX_o=0;
RS_o=0;
RT_o=0;
Immediately_o=0;
RD1_o=0;
RD2_o=0;
RS_addr_o=0;
RT_addr_o=0;
end

always @(posedge clk)begin

WB_o<=WB;
M_o<=M;
EX_o<=EX;
RS_o<=RS;
RT_o<=RT;
Immediately_o<=Immediately;
RD1_o<=RD1;
RD2_o<=RD2;
RS_addr_o<=RS_addr;
RT_addr_o<=RT_addr;

end
endmodule 