module Excess3_to_BCD(b,e);

input [3:0]e;
output [3:0]b;

wire not0,not1,not2,not3,w0,w1,w2,w3,w4;
 

not(not0,e[0]);
not(not1,e[1]);
not(not2,e[2]);
not(not3,e[3]);

buf(b[0],not0);
xor(b[1],e[0],e[1]);
and(w0,e[0],e[1],e[2]);
and(w1,not1,not2);
and(w2,not0,not2);
or(b[2],w0,w1,w2);
and(w3,e[0],e[1],e[3]);
and(w4,e[2],e[3]);
or(b[3],w3,w4);


endmodule

module Excess3_to_BCD_tb;
reg [3:0]e;
wire [3:0]b;

Excess3_to_BCD e3_to_bcd(b,e);
initial begin
e=4'b0011; #50;
e=4'b0100; #50;
e=4'b0101; #50;
e=4'b0110; #50;
e=4'b0111; #50;
e=4'b1000; #50;
e=4'b1001; #50;
end endmodule