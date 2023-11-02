module IM(
	//input clk,
	//input stall,
	input [31:0]Addr_in,
	output[31:0]Instruction
	);
reg [7:0]Instruction_list [83:0];


assign Instruction={Instruction_list[Addr_in],Instruction_list[Addr_in+1],Instruction_list[Addr_in+2],Instruction_list[Addr_in+3]};


initial begin


	//add $t0, $t1, $t1
	{Instruction_list[0],Instruction_list[1],Instruction_list[2],Instruction_list[3]}<={6'd20,5'd9,5'd9,5'd8,5'd0,6'd21};
	//sub $t1, $t2, $t4
	{Instruction_list[4],Instruction_list[5],Instruction_list[6],Instruction_list[7]}<={6'd20,5'd10,5'd12,5'd9,5'd0,6'd22};
	//srl $t4, $t5, 2
	{Instruction_list[8],Instruction_list[9],Instruction_list[10],Instruction_list[11]}<={6'd20,5'd13,5'dz,5'd12,5'd2,6'd23};
	//sll $t6, $t6, 4
	{Instruction_list[12],Instruction_list[13],Instruction_list[14],Instruction_list[15]}<={6'd20,5'd14,5'dz,5'd14,5'd4,6'd24};
	//xor $t3, $t1, $t2
	{Instruction_list[16],Instruction_list[17],Instruction_list[18],Instruction_list[19]}<={6'd20,5'd9,5'd10,5'd11,5'd0,6'd25};
	//and $t5, $t4, $t2
	{Instruction_list[20],Instruction_list[21],Instruction_list[22],Instruction_list[23]}<={6'd20,5'd12,5'd10,5'd13,5'd0,6'd26};
	//sw $t0, 2($t7)
	{Instruction_list[24],Instruction_list[25],Instruction_list[26],Instruction_list[27]}<={6'd43,5'd15,5'd8,16'd2};
	//lw $s3, 2($t7)
	{Instruction_list[28],Instruction_list[29],Instruction_list[30],Instruction_list[31]}<={6'd35,5'd15,5'd19,16'd2};
	//sw $s4, 4($t7)
	{Instruction_list[32],Instruction_list[33],Instruction_list[34],Instruction_list[35]}<={6'd43,5'd15,5'd20,16'd4};
	//sw $t0, 2($t2)
	{Instruction_list[36],Instruction_list[37],Instruction_list[38],Instruction_list[39]}<={6'd43,5'd10,5'd8,16'd2};
	//lw $s4, 3($t2)
	{Instruction_list[40],Instruction_list[41],Instruction_list[42],Instruction_list[43]}<={6'd35,5'd10,5'd20,16'd3};

//---------------------------------------------------------------//


	//add $t6, $t5, $t4
	{Instruction_list[44],Instruction_list[45],Instruction_list[46],Instruction_list[47]}<={6'd20,5'd13,5'd12,5'd14,5'd0,6'd21};
	//sub $t7, $t6, $t5
	{Instruction_list[48],Instruction_list[49],Instruction_list[50],Instruction_list[51]}<={6'd20,5'd14,5'd13,5'd15,5'd0,6'd22};
	//add $t3, $t6, $t7
	{Instruction_list[52],Instruction_list[53],Instruction_list[54],Instruction_list[55]}<={6'd20,5'd14,5'd15,5'd11,5'd0,6'd21};
	//lw $s1, 2($t2)
	{Instruction_list[56],Instruction_list[57],Instruction_list[58],Instruction_list[59]}<={6'd35,5'd10,5'd17,16'd2};
	//sw $s1, 2($t5)
	{Instruction_list[60],Instruction_list[61],Instruction_list[62],Instruction_list[63]}<={6'd43,5'd13,5'd17,16'd2};
	//lw $t1, 2($t5)
	{Instruction_list[64],Instruction_list[65],Instruction_list[66],Instruction_list[67]}<={6'd35,5'd13,5'd9,16'd2};
	//add $t2, $t1, $t1
	{Instruction_list[68],Instruction_list[69],Instruction_list[70],Instruction_list[71]}<={6'd20,5'd9,5'd9,5'd10,5'd0,6'd21};


//---------------------------------------------------------------//*/
end
endmodule 
