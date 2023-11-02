module RF(
	input [4:0] Address1, //Source 1 address
	input [4:0] Address2, //Source 2 address
	output [31:0] Source1, //Source 1 value
	output [31:0] Source2); //Source 2 value
FindData Src1(.Address(Address1),.Data(Source1));
FindData Src2(.Address(Address2),.Data(Source2));
endmodule

module FindData(
	input [4:0]Address,
	output reg [31:0]Data);
always @(Address)begin
	case(Address)
		5'd0:Data=21;	5'd1:Data=444;
		5'd2:Data=178;	5'd3:Data=365;
		5'd4:Data=33;	5'd5:Data=89;
		5'd6:Data=49;	5'd7:Data=11;
		5'd8:Data=347;	5'd9:Data=44;
		5'd10:Data=1000;5'd11:Data=2000;
		5'd12:Data=71;	5'd13:Data=38;
		5'd14:Data=19;	5'd15:Data=51;
		5'd16:Data=663;	5'd17:Data=1871;
		5'd18:Data=364;	5'd19:Data=1110;
		5'd20:Data=197;	5'd21:Data=180;
		5'd22:Data=1;	5'd23:Data=619;
		5'd24:Data=42;	5'd25:Data=43;
		5'd26:Data=831;	5'd27:Data=39;
		5'd28:Data=734;	5'd29:Data=92;
		5'd30:Data=3456;5'd31:Data=1234;
	endcase
end
endmodule 
