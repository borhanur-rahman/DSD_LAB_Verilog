module BCD_Adder(s,cout,a,b,cin);


input [3:0]a,b;
input cin;
output [3:0]s;
output cout;

reg cin2=1'b0;

wire [3:0]s1,b2;
wire and1,and2,carry1,carry2;

Four_bit_full_adder f1(s1,carry1,a,b,cin);

and(and1,s1[3],s1[2]);
and(and2,s1[3],s1[1]);

or(cout,carry1,and1,and2);

buf(b2[1],cout);
buf(b2[2],cout);
buf(b2[0],1'b0);
buf(b2[3],1'b0);

Four_bit_full_adder f2(s,carry2,b2,s1,cin2);
endmodule
module BCD_Adder_tb;
reg [3:0]a,b;
reg cin;
wire [3:0]s;
wire  cout;
BCD_Adder ba(s,cout,a,b,cin);
initial begin
a=4'b0100; b=4'b0010; cin=1'b0; #50;
a=4'b1000; b=4'b0001; cin=1'b0; #50;
a=4'b1000; b=4'b0100; cin=1'b0; #50;
a=4'b1010; b=4'b1001; cin=1'b0; #50;

a=4'b0100; b=4'b0010; cin=1'b1; #50;
a=4'b1000; b=4'b0001; cin=1'b1; #50;
a=4'b1000; b=4'b0100; cin=1'b1; #50;
a=4'b0010; b=4'b1001; cin=1'b1; #50;
end endmodule
