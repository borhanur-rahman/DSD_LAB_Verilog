module Mode_10_Counter(q,clk);
input clk;
output [3:0]q;
reg j=1'b1, k=1'b1;
wire [3:0]qb;
wire clr;
nand(clr,q[1],q[3]);
JK_flipflop jkff0(q[0],qb[0],j,k,clk,clr);
JK_flipflop jkff1(q[1],qb[1],j,k,q[0],clr);
JK_flipflop jkff2(q[2],qb[2],j,k,q[1],clr);
JK_flipflop jkff3(q[3],qb[3],j,k,q[2],clr);
endmodule