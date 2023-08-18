module Gray_to_Binary(b,g);
input [3:0]g;
output [3:0]b;
buf(b[3],g[3]);
xor(b[2],b[3],g[2]);
xor(b[1],b[2],g[1]);
xor(b[0],b[1],g[0]);
endmodule

module Gray_to_Binary_tb;
reg [3:0]g;
wire [3:0]b;
Gray_to_Binary g_to_b(b,g);
initial begin 
g=4'b0000; #50;
g=4'b0001; #50;
g=4'b0010; #50;
g=4'b0011; #50;
g=4'b0100; #50;
g=4'b0101; #50;
g=4'b0110; #50;
g=4'b0111; #50;
g=4'b1000; #50;
g=4'b1001; #50;
g=4'b1010; #50;
g=4'b1011; #50;
g=4'b1100; #50;
g=4'b1101; #50;
g=4'b1110; #50;
g=4'b1111; #50;
end endmodule
