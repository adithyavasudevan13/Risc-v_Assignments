module sequencedetector(input clk, x, reset, output reg y);

parameter s1=3'b000, s2=3'b001, s3=3'b010, s4=3'b011, s5=3'b100, s6=3'b101, s7=3'b110, s8=3'b111;
reg [2:0] state, nextstate;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= s1;
        y <= 0;
    end else begin
        state <= nextstate;

        if(nextstate==s5 || state==s5)y<=1;
		  else y<=0;
		  

    end
end

always @(*) begin
    case(state)
        s1: begin
            nextstate= x? s2:s1;
             
        end
        s2: begin
            nextstate= x? s3:s1;
           
        end
        s3: begin
            nextstate= x? s3:s4;
             
        end
        s4: begin
            if(x) begin
                nextstate = s5;
                
            end
            else begin
                nextstate = s1;
                
            end
        end
        s5: begin
            nextstate= x? s3:s1;
             
        end
		  default: begin
            nextstate = s1;
            
        end
    endcase
end
endmodule