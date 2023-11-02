module Control(
	input [5:0] Op,
 	output reg [1:0] ALUOp,
 	output reg RegDst,
 	output reg MemRead,
 	output reg MemtoReg,
 	output reg MemWrite,
 	output reg ALUSrc,
 	output reg RegWrite,
 	output reg Jump,
 	output reg Branch
 	);
always @(Op)begin
case(Op)
	6'd20:begin
		ALUOp<=2'b10;
		RegDst<=0;
		MemRead<=0;
		MemWrite<=0;
		MemtoReg<=0;
		ALUSrc<=0;
		RegWrite<=1;
		Jump<=0;
		Branch<=0;
	end
	6'd43:begin
		ALUOp<=2'b00;
		RegDst<=1;
		MemRead<=0;
		MemWrite<=1;
		MemtoReg<=0;
		ALUSrc<=1;
		RegWrite<=0;
		Jump<=0;
		Branch<=0;
	end
	6'd35:begin
		ALUOp<=2'b00;
		RegDst<=1;
		MemRead<=1;
		MemWrite<=0;
		MemtoReg<=1;
		ALUSrc<=1;
		RegWrite<=1;
		Jump<=0;
		Branch<=0;
	end
	6'd8:begin
		ALUOp<=2'b00;
		RegDst<=1;
		MemRead<=0;
		MemWrite<=0;
		MemtoReg<=0;
		ALUSrc<=1;
		RegWrite<=1;
		Jump<=0;
		Branch<=0;
	end
	6'd9:begin
		ALUOp<=2'b01;
		RegDst<=1;
		MemRead<=0;
		MemtoReg<=0;
		MemWrite<=0;
		ALUSrc<=1;
		RegWrite<=1;
		Jump<=0;
		Branch<=0;
	end
	6'd4:begin
		ALUOp<=2'b01;
		RegDst<=0;
		MemRead<=0;
		MemWrite<=0;
		MemtoReg<=0;
		ALUSrc<=0;
		RegWrite<=0;
		Jump<=0;
		Branch<=1;
	end
	6'd2:begin
		ALUOp<=2'b01;
		RegDst<=0;
		MemRead<=0;
		MemWrite<=0;
		MemtoReg<=0;
		ALUSrc<=0;
		RegWrite<=0;
		Jump<=1;
		Branch<=0;
	end
endcase

end
endmodule 
