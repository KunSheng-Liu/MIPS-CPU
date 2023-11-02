module DM(
	input clk,
 	input [31:0] Address,
 	input [31:0] data,
 	input MemRead,
 	input MemWrite,
 	output reg [31:0] DM_data
 	);

reg [7:0]Mem[127:0];
integer i;

initial begin
	for(i=0;i<128;i=i+1)begin
		Mem[i]=8'd0;
	end
end

always @(negedge clk)begin
if(MemWrite){Mem[Address],Mem[Address+1],Mem[Address+2],Mem[Address+3]}=data;
if(MemRead)DM_data={Mem[Address],Mem[Address+1],Mem[Address+2],Mem[Address+3]};

end

endmodule
