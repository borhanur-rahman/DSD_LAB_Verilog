module JK_flipflop(Q,Qbar,J,K,clk,clr);
input J,K,clk,clr;
output Q,Qbar;

wire n1,n2,n3,n4,clkn;
wire [1:0]q;

nand(n1,Qbar,J,clk,clr);
nand(n2,clk,K,Q);
nand(q[0],n1,q[1]);
nand(q[1],q[0],n2,clr);

not(clkn,clk);

nand(n3,q[0],clkn);
nand(n4,q[1],clkn);
nand(Q,n3,Qbar);
nand(Qbar,n4,Q,clr);

endmodule


/*module JK_flipflop_tb;
reg J,K,clk,clr;
wire Q,Qbar;
JK_flipflop jkff(Q,Qbar,J,K,clk,clr);
initial begin

J=1'b1; K=1'b1; clk=1'b1; clr=1'b0; #50;
J=1'b1; K=1'b1; clk=0'b1; clr=1'b0; #50;
J=1'b1; K=1'b1; clk=1'b1; clr=1'b0; #50;
J=1'b1; K=1'b1; clk=0'b1; clr=1'b0; #50;
J=1'b1; K=1'b1; clk=1'b1; clr=1'b0; #50;
J=1'b1; K=1'b1; clk=0'b1; clr=1'b0; #50;
J=1'b1; K=1'b1; clk=1'b1; clr=1'b0; #50;
J=1'b1; K=1'b1; clk=0'b1; clr=1'b0; #50;
end endmodule
*/