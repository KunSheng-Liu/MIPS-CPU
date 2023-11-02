module Hazard_Detection(
	input MemRead,
	input [4:0]RS_addr,RT_addr,RT_ID,
	output reg stall);

initial stall=0;


always @(RS_addr,RT_addr,MemRead)begin
stall=0;
if(MemRead==1)begin
	if(RS_addr==RT_ID  || RT_addr==RT_ID)begin
		stall=1;
	end
end

end
endmodule
