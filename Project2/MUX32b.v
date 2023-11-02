module MUX32b(
	input [31:0]data0,
	input [31:0]data1,
	input select,
	output [31:0]data_o);

assign data_o=select?data1:data0;

endmodule 
