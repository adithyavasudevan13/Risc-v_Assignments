module roundrobin(input clk, reset, input [3:0] req, output reg[3:0] gnt);
    parameter s1=2'b00, s2=2'b01, s3=2'b10, s4=2'b11;
    reg [1:0] state, nextstate;
    

    always @(posedge clk or posedge reset) begin
        if(reset) begin state<= s1;
		  gnt <= 4'b0000;
		  end
        else begin state<= nextstate;
		  case (nextstate)
                s1: gnt <= req[0] ? 4'b0001 : 4'b0000;
                s2: gnt <= req[1] ? 4'b0010 : 4'b0000;
                s3: gnt <= req[2] ? 4'b0100 : 4'b0000;
                s4: gnt <= req[3] ? 4'b1000 : 4'b0000;
                default: gnt <= 4'b0000;
            endcase
		  end
    end



    always @(*) begin
		  
        nextstate = state;
        case(state)
            s1: begin
                if(req[0]) begin
                    
                    nextstate= s2;
                end
                else begin
                    if(req[1]) nextstate= s2;
                    else if(req[2]) nextstate= s3;
                    else if(req[3]) nextstate= s4;
                end
            end
            s2: begin
                if(req[1]) begin
                    
                    nextstate=s3;
                end
                else begin
                    if(req[2]) nextstate=s3;
                    else if(req[3]) nextstate= s4;
                    else if(req[0]) nextstate= s1;
                end
            end
            s3: begin
                if(req[2]) begin
                   
                    nextstate=s4;
                end
                else begin
                    if(req[3]) nextstate=s4;
                    else if(req[0]) nextstate= s1;
                    else if(req[1]) nextstate= s2;
                end
            end
            s4: begin
                if(req[3]) begin
                   
                    nextstate=s1;
                end
                else begin
                    if(req[0]) nextstate=s1;
                    else if(req[1]) nextstate= s2;
                    else if(req[2]) nextstate= s3;
                end
            end
        endcase
    end
endmodule