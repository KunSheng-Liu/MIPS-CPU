module Forwarding_unit(
	input wr_MEM,wr_WB,wr_REG,
	input [4:0]RS_ID,RT_ID,RD_MEM,RD_WB,RD_REG,
	output reg [1:0] ForwardA,ForwardB);

initial begin
ForwardA=2'b00;
ForwardB=2'b00;
end

always @(wr_MEM,wr_WB,RS_ID,RT_ID,RD_MEM,RD_WB)begin

ForwardA=2'b00;
ForwardB=2'b00;
if(RD_WB!=0)begin
	if(wr_REG==1)begin

		if(RS_ID == RD_REG)ForwardA=2'b11;

		if(RT_ID == RD_REG)ForwardB=2'b11;
	end

	if(wr_WB==1)begin

		if(RS_ID == RD_WB)ForwardA=2'b01;

		if(RT_ID == RD_WB)ForwardB=2'b01;
	end

	if(wr_MEM==1)begin
		if(RS_ID == RD_MEM)ForwardA=2'b10;

		if(RT_ID == RD_MEM)ForwardB=2'b10;
	end
end


end
endmodule
