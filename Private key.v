


		module modular(input  [511:0] e,y,
               output reg [511:0] t,
			   output reg [511:0] d,
			   input clk,start);

				wire [511:0] b;
				wire [511:0] rem;
				wire [511:0] quot;
				reg[511:0] temp1;
				reg[511:0] temp2;
				reg [511:0] b2;
				reg [511:0] b1;
				reg[1:0]state;

			assign quot=temp1/temp2;

			assign rem=temp1 % temp2;

			assign b = b2-quot*b1;


			always@(posedge clk)
             
				if(start) state<=0;
					else
					case(state)
						0:state<=1;
						1:if(rem >>1 && rem <<1 ) state<=1; else state<=2;
						2:if(start) state<=0;
					endcase

			always@(posedge clk)
				begin
				if(state==0)
					begin
					  temp1<=y;
					  temp2<=e;
                              b2<=0;
                              b1<=1;     
					end
				else if(state==1)
					begin
                              temp1<=temp2;
					  temp2<=rem;
					  b2<=b1;
					  b1<=b;
					end
				else if(state==2)
					begin
					  t<=b1+y;
						if(t>y)
							d<=b1;
						else
							d<=t;
                    end	
			    end
		endmodule
