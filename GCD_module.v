    module top(input [31:0] p,q,
           output reg [31:0]gcd,y,
           input clk,start);

              reg [31:0] a,b;
              wire [31:0] result;
              reg [31:0]temp1;
              reg [31:0]temp2;
              reg[1:0] state; 
               assign result = temp1%temp2;                                
                                          
             always@(posedge clk)
              begin
                                                
            a <= p-1;
            b <=q-1;
                                                 
             end
            
                                           
            
            always@(posedge clk)
                                           
            if(start) state<=0;
            else
            case(state)
            0: state<=1;
            1:if(result) state<=1; else state<=2;
            2:if(start) state<=0;
            endcase
                                           
           always@(posedge clk)
            begin
            if(state==0)
              begin
                temp1<=a;
                temp2<=b;
              
			
              end
            else if(state==1)
              begin
                temp1<=temp2;
                temp2<=result;
             
			

              end
              else if(state==2)
                   begin
                   gcd<=temp1;
                   
                   end 
                   end
          always@(posedge clk)
               begin
              y<=a*b/gcd;
              end                                       
           
      endmodule
   