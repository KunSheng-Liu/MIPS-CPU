module MUX5b(
	input [4:0]data0,
	input [4:0]data1,
	input select,
	output [4:0]data_o);

assign data_o=select?data1:data0;

endmodule 