
    module gcd_upd(input [31:0] lfsr_nu,y,
           output reg [31:0]gcd_out,public_key,
           input clk,start_0);
              
             
              wire [31:0] result_gcd;
              reg [31:0]temp3;
              reg [31:0]temp4;
              reg[1:0] state_0; 
              
          assign result_gcd = temp3%temp4; 
            
          
          always@(posedge clk)
                                           
            if(start_0) state_0<=0;
            else
            case(state_0)
            0: state_0<=1;
            1:if(result_gcd) state_0<=1; else state_0<=2;
            2:if(start_0) state_0<=0;
            endcase
                                           
           always@(posedge clk)
            begin
            if(state_0==0)
              begin
                temp3<=lfsr_nu;
                temp4<=y;
              
			
              end
            else if(state_0==1)
              begin
                temp3<=temp4;
                temp4<=result_gcd;
             
			

              end
              else if(state_0==2)
                   begin
                   
                   gcd_out<=temp3;
               
                    if((1<lfsr_nu<y) && (gcd_out==1)) 
                      begin
                     public_key <= (lfsr_nu**8);
                      end  
                    else if ((lfsr_nu>y) && (gcd_out==!1)) 
                       begin
                         public_key <= 0 ;
                     end
                   end 
                  
                 end
                
                          
                 endmodule
   
