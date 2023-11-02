module Multiplicand(
	input [31:0] Multiplicand_input, //Multiplicand input
	input rst, //Reset multiplicand
	input wrctrl, //write the multiplicand into register
	output reg [31:0] Multiplicand_output=0 //Multiplicand output
	);
always @(posedge rst,posedge wrctrl)begin
	if(rst==1)Multiplicand_output<=0;
	else if(wrctrl==1)Multiplicand_output<=Multiplicand_input;

end
endmodule
