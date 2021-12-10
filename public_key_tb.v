


module tb_top();
reg [31:0] lfsr_nu,y;
reg start_0,clk;
wire [31:0] gcd_out,public_key;

gcd_upd u1 ( .lfsr_nu(lfsr_nu), .y(y), .gcd_out(gcd_out), .public_key(public_key), .clk(clk), .start_0(start_0));
integer i= 0 ; 
initial
 begin
    clk = 1;
    
    forever #5 clk = ~clk;
    
     
  end

 initial
 begin
 $dumpfile("waveform_1.vpd");
$dumpvars;
 
 end

initial
 begin
//$display("32'h0020 mod 32'h0016=%d",32'h0020 % 32'h0016);
 start_0 =1;
 y = 32'h48B1420;
 lfsr_nu = 32'h02;
repeat(5000)@(posedge clk);
start_0 = 0;
 
$display("what is gcd ", gcd_out);

#1000
if((gcd_out!==1))
   begin
lfsr_nu = lfsr_nu +1;
$display("after 1000 ns gcd is ", gcd_out);
end
else 
   lfsr_nu = lfsr_nu -1;
#1000

repeat(5000)@(posedge clk);
start_0 = 0;
 #100000

//start_0 = 1;
//if(gcd_out!==1)
//lfsr_nu = (lfsr_nu-3);
//else
//lfsr_nu = lfsr_nu;

//$display("lfsr_nu=",lfsr_nu[i]);
$display("y=",y);

//if(gcd_out==32'h0006) $display("Success","   ", "gcd_out=", gcd_out);
//else $display ("Failed", gcd_out);

//$display("y and lfsr_nu are coprime as thier gcd is",gcd_out);

//while((gcd_out!==1) &&(i<10))
//i=i+1;
//lfsr_nu <= lfsr_nu+1;
#10


 if((1<lfsr_nu<y) && (gcd_out==1))  $display("gcd_out is  ", gcd_out  , "  so Public key is  ", public_key) ;
                     //  $display("gcd of y and lfsr_out is", gcd_out);
else if((gcd_out!==1)) $display("Public_Key Not Found as gcd_out is not equal to 1");
    
$display("lfsr_nu ", lfsr_nu);              

 $finish;
end
 endmodule


