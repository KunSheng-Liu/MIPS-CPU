module CompALU(
	input [31:0] Instruction, //Instruction input
	output [31:0] result, //Arithmetic result
	output zero, //Zero flag
	output carry //Carry flag
	);

wire [31:0]Src1,Src2;

RF mRF(.Address1(Instruction[25:21]),.Address2(Instruction[20:16]),.Source1(Src1),.Source2(Src2));
ALU mALU(.Source1(Src1),.Source2(Src2),.funct(Instruction[5:0]),.shamt(Instruction[10:6]),.result(result),.zero(zero),.carry(carry));


endmodule 