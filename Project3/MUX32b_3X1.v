module MUX32b_3X1(
	input [1:0]select,
	input [31:0]ID,MEM,WB,REG,
	output reg [31:0]out);

initial out=0;

always @(ID,MEM,WB,REG,select)begin

case(select)
	2'b00:out=ID;
	2'b10:out=MEM;
	2'b01:out=WB;
	2'b11:out=REG;

endcase


end
endmodule 
