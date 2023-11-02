module Product(
	input [63:0] Product_input, //Product input
	input wrctrl,
	input strctrl,
	input ready,
	input rst,
	input clk,
	output reg [63:0] Product_output //Product output
	);

always @(posedge wrctrl)Product_output={32'd0,Product_input[31:0]};

always @(negedge clk,posedge rst)begin
	if(rst==1)Product_output=0;
	else if(ready!=1)begin 
		if(strctrl==1)Product_output={Product_input[63:31],Product_output[31:1]};
	end
end
endmodule
