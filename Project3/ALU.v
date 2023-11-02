module ALU(
	input[31:0] Source1,
	input[31:0] Source2,
	input[5:0]operation,
	input[4:0]shamt,
	output reg[31:0]result,
	output zero,
	output reg carry
	);

initial begin

result=0;
carry=0;

end

assign zero=(result==0)?1:0;

always @(Source1,Source2,operation,shamt)begin

case(operation)
	6'd27:begin
		{carry,result}=Source1+Source2;
	end
	6'd28:begin
		{carry,result}=Source1-Source2;
	end
	6'd29:begin
		result=Source1>>shamt;
	end
	6'd30:begin
		result=Source1<<shamt;
	end
	6'd31:begin
		result=Source1^Source2;
	end
	6'd32:begin
		result=Source1&Source2;
	end

endcase
end



endmodule 