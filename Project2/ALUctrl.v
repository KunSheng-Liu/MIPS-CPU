module ALUcrtl(
	input [5:0] funct,
 	input [1:0] ALUOp,
 	output reg[5:0] operation
 	);

always @(ALUOp,funct)begin
if(ALUOp[1]==1)begin
	case(funct)
		6'd21:operation=6'd27;
		6'd22:operation=6'd28;
		6'd23:operation=6'd29;
		6'd24:operation=6'd30;
		6'd25:operation=6'd31;
		6'd26:operation=6'd32;
	endcase
end
else if(ALUOp[0]==0)operation=6'd27;
else if(ALUOp[0]==1)operation=6'd28;

end

endmodule
