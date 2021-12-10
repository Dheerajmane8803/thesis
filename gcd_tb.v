module tb_top();
reg [31:0] p,q;
reg start,clk;
wire [31:0] gcd,y;

top u1 ( .p(p), .q(q), .gcd(gcd), .clk(clk), .start(start), .y(y));
 
initial
 begin
    clk = 1;
    
    forever #5 clk = ~clk;
    
     
  end

 initial
 begin
 $dumpfile("waveform.vpd");
$dumpvars;
 
 end

initial
 begin
$display("32'h0020 mod 32'h0016=%d",32'h0020 % 32'h0016);
 start =1;
 p = 32'h568F;
 q = 32'h50A1;
repeat(2)@(posedge clk);
start = 0;
 #100000


 $finish;
 end
 endmodule


