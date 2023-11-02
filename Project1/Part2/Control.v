module Control(
	input run,
	input rst,
	input clk,
	input lsb,
	output reg ready=0,
	output reg strctrl=0, //Signal for store the ALU result into Product
	output reg wrctrl=0,
	output reg [5:0] addctrl=0//for ALU function
	);

reg [5:0]count=0;

always @(posedge run)begin
	count=0;
	wrctrl=1;
end
always @(posedge clk,posedge rst)begin
	if(rst==1)begin
		count<=0;
		ready<=0;
		strctrl<=0;
		wrctrl<=0;
		addctrl<=0;
	end
	else if(wrctrl==1)begin 
		if(lsb==1)addctrl=27;
		else addctrl=29;
		strctrl=1;
		count=count+1;
	end
	if(count==33)begin
		count=0;		
		wrctrl=0;
		strctrl=0;
		ready=1;
	end
end
endmodule
