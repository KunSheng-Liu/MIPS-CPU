module SE(
	input [15:0]data_i,
	output reg [31:0]data_o
	);
initial data_o=0;

always @(data_i)data_o=data_i[15]?{16'hFFFF,data_i}:{16'h0000,data_i};

endmodule
