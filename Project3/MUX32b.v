module MUX32b(
	input [31:0]data0,
	input [31:0]data1,
	input select,
	output reg [31:0]data_o);

initial data_o=0;

always @(data0,data1,select)begin
case(select)
	1'b0:data_o=data0;
	1'b1:data_o=data1;
endcase
end

endmodule 
