module ALU(
	input [31:0] Source1,
	input [31:0] Source2,
	input [5:0] funct,
	input [4:0] shamt,
	output reg [31:0] result,
	output zero,
	output reg carry
	);
nor ZFlag (zero, result[0],result[1],result[2],result[3],result[4],result[5],result[6],result[7]
	,result[8],result[9],result[10],result[11],result[12],result[13],result[14],result[15]
	,result[16],result[17],result[18],result[19],result[20],result[21],result [22],result[23]
	,result[24],result[25],result[26],result[27],result[28],result[29],result[30],result [31]);

always @(Source1, Source2, funct, shamt ) begin
carry=0;
case (funct)
6'd27: {carry, result} = Source1+Source2;
6'd28: {carry, result} = Source1-Source2;
6'd29:result <= Source1>>shamt;
6'd30:result <= Source1<<shamt;
6'd31:result <= Source1^Source2;
6'd32:result <= Source1&Source2;
endcase
end
endmodule
