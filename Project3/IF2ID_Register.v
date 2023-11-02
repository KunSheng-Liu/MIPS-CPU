module IF2ID_Register(
	input clk,stall,
	input [31:0]instruction,
	output reg [31:0]instruction_o);

initial begin 

instruction_o=0;

end


always @(posedge clk,posedge stall)begin

instruction_o<=instruction;


end
endmodule 
