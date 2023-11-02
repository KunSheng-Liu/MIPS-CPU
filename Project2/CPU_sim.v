module CPU_sim();
reg clk;
reg [31:0]addr_i;
wire [31:0]addr_o;

SingleCPU my_CPU(.Addr_in(addr_i),.clk(clk),.Addr_o(addr_o));

initial begin
addr_i=0;
clk=1;
end


always begin
#5 clk=!clk;
end

initial begin
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
#10
addr_i<=addr_o;
end

endmodule
