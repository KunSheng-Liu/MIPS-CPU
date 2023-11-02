module CompMul(
	input [31:0] Multiplicand_input, //Multiplicand input
	input [31:0] Multiplier_input, //Multiplier input
	input run, //Start signal
	input rst, //Reset all the control signals
	input clk, //Clock signal
	output ready, //Result ready
	output [63:0] Product_output //Arithmetic result
	);

wire strctrl,wrctrl,zero,carry;
wire [5:0]addctrl;
wire [31:0]Multiplicand;
wire  [31:0]result;
wire temp;

Control mControl(.run(run),.rst(rst),.clk(clk),.lsb(Product_output[0])
		,.ready(ready),.strctrl(strctrl),.wrctrl(wrctrl),.addctrl(addctrl));

Multiplicand mMultiplicand(.Multiplicand_input(Multiplicand_input),.rst(rst),.wrctrl(wrctrl),.Multiplicand_output(Multiplicand));

ALU mALU(.Source1(Product_output[63:32]),.Source2(Multiplicand)
		,.funct(addctrl),.shamt(5'b00000),.result(result),.zero(zero),.carry(carry));

Product mProduct(.Product_input({carry,result[31:1],temp,Multiplier_input[30:0]}),.wrctrl(wrctrl),.strctrl(strctrl)
	,.ready(ready),.rst(rst),.clk(clk),.Product_output(Product_output));


assign temp=(Multiplicand==0)?Multiplier_input[31]:result[0];

endmodule
