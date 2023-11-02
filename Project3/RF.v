module RF(
	input clk,
 	input RegWrite,
 	input [4:0] RS_Address,
 	input [4:0] RT_Address,
	input [4:0] RD_Address,
	input [31:0] RDdata,
	output reg [31:0] RSdata,
 	output reg [31:0] RTdata
 	);
reg [31:0] Register[31:0];

initial begin
RSdata=0;
RTdata=0;

Register[0]=32'd0;
Register[1]=32'd11;
Register[2]=32'd370;
Register[3]=32'd183;
Register[4]=32'd91;
Register[5]=32'd234;
Register[6]=32'd53;
Register[7]=32'd124;
Register[8]=32'd317;
Register[9]=32'd179;
Register[10]=32'd101;
Register[11]=32'd161;
Register[12]=32'd77;
Register[13]=32'd320;
Register[14]=32'd152;
Register[15]=32'd10;
Register[16]=32'd100;
Register[17]=32'd100;
Register[18]=32'd245;
Register[19]=32'd19;
Register[20]=32'd2;
Register[21]=32'd13;
Register[22]=32'd262;
Register[23]=32'd185;
Register[24]=32'd180;
Register[25]=32'd180;
Register[26]=32'd198;
Register[27]=32'd178;
Register[28]=32'd235;
Register[29]=32'd22;
Register[30]=32'd1000;
Register[31]=32'd75;


end

always @(posedge clk)begin
if(RegWrite)Register[RD_Address]=RDdata;

end

always @(negedge clk)begin
RSdata=Register[RS_Address];
RTdata=Register[RT_Address];
end

endmodule 