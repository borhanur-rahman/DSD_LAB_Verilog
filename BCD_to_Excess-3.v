module BCD_to_Excess3(e,b);
input [3:0]b;
output [3:0]e;
wire w0,w1;

not(e[0],b[0]);
xnor(e[1],b[0],b[1]);
or(w0,b[0],b[1]);
xor(e[2],w0,b[2]);
and(w1,w0,b[2]);
or(e[3],w1,b[3]);
endmodule
module BCD_to_Excess3_tb;
reg [3:0]b;
wire [3:0]e;
BCD_to_Excess3 bcd_to_e3(e,b);
initial begin 
b=4'b0000; #50;
b=4'b0001; #50;
b=4'b0010; #50;
b=4'b0011; #50;
b=4'b0100; #50;
b=4'b0101; #50;
b=4'b0110; #50;
b=4'b0111; #50;
b=4'b1000; #50;
b=4'b1001; #50;
end endmodule