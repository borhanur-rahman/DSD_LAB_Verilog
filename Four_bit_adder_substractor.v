module half_adder(s,cout,a,b);
input a,b;
output s,cout;
xor(s,a,b);
and(cout,a,b);
endmodule
module full_adder(s,cout,a,b,cin);
input a,b,cin;
output s,cout;
wire s1,cout1,cout2;
half_adder h1(s1,cout1,a,b);
half_adder h2(s,cout2,s1,cin);
or(cout,cout1,cout2);
endmodule
module Four_bit_full_adder(s,cout,a,b,cin);
input [3:0]a,b;
input cin;
output [3:0]s;
output cout;
wire [2:0]c;
full_adder f0(s[0],c[0],a[0],b[0],cin);
full_adder f1(s[1],c[1],a[1],b[1],c[0]);
full_adder f2(s[2],c[2],a[2],b[2],c[1]);
full_adder f3(s[3],cout,a[3],b[3],c[2]);
endmodule
module Four_bit_adder_substractor(s,cout,a,b,cin);
input [3:0]a,b;
input cin;
output [3:0]s;
output cout;
wire [3:0]w;


xor(w[0],b[0],cin);
xor(w[1],b[1],cin);
xor(w[2],b[2],cin);
xor(w[3],b[3],cin);
Four_bit_full_adder fbfa(s,cout,w,b,cin);
endmodule

module Four_bit_adder_substractor_tb;
reg [3:0]a,b;
reg cin;
wire [3:0]s;
wire cout;
Four_bit_adder_substractor fbfa(s,cout,a,b,cin);
initial begin
a=4'b0001; b=4'b0010; cin=1'b0; #50;
a=4'b0011; b=4'b0100; cin=1'b0; #50;
a=4'b0100; b=4'b0101; cin=1'b0; #50;
a=4'b0101; b=4'b0110; cin=1'b0; #50;

a=4'b1000; b=4'b0001; cin=1'b1; #50;
a=4'b0100; b=4'b0010; cin=1'b1; #50;
a=4'b1010; b=4'b0110; cin=1'b1; #50;
a=4'b0010; b=4'b1000; cin=1'b1; #50;
end endmodule





