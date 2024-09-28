module segment_driver(
    input [6:0] data_in,
    output reg [6:0] data_out1,
	 output reg [6:0] data_out2,
	 output reg [6:0] data_out3,
	 output reg [6:0] data_out4
);

wire [3:0] units;
	wire [3:0] tens;
	wire [3:0] hundreds ;
	wire [3:0] thousands;
	integer temp;

always @(*) begin

	temp=data_in;
	
	units=temp%10;
	temp=temp/10;
	
	tens=temp%10;
	temp=temp/10;
	
	hundreds =temp%10;
	temp=temp/10;
	
	thousands =temp%10;
	temp=temp/10;


    case (units)
        4'h0: data_out1[6:0] = ~7'b0111111;
        4'h1: data_out1[6:0] = ~7'b0000110;
        4'h2: data_out1[6:0] = ~7'b1011011;
        4'h3: data_out1[6:0] = ~7'b1001111;
        4'h4: data_out1[6:0] = ~7'b1100110;
        4'h5: data_out1[6:0] = ~7'b1101101;
        4'h6: data_out1[6:0] = ~7'b1111101;
        4'h7: data_out1[6:0] = ~7'b0000111;
        4'h8: data_out1[6:0] = ~7'b1111111;
        4'h9: data_out1[6:0] = ~7'b1101111;
		  default: data_out1[6:0] = ~7'b0101010; 
    endcase
	 
	 case (tens)
        4'h0: data_out2[6:0] = ~7'b0111111;
        4'h1: data_out2[6:0] = ~7'b0000110;
        4'h2: data_out2[6:0] = ~7'b1011011;
        4'h3: data_out2[6:0] = ~7'b1001111;
        4'h4: data_out2[6:0] = ~7'b1100110;
        4'h5: data_out2[6:0] = ~7'b1101101;
        4'h6: data_out2[6:0] = ~7'b1111101;
        4'h7: data_out2[6:0] = ~7'b0000111;
        4'h8: data_out2[6:0] = ~7'b1111111;
        4'h9: data_out2[6:0] = ~7'b1101111;
		  default: data_out1[6:0] = ~7'b0101010; 
    endcase
	 
	 case (hundreds)
        4'h0: data_out3[6:0] = ~7'b0111111;
        4'h1: data_out3[6:0] = ~7'b0000110;
        4'h2: data_out3[6:0] = ~7'b1011011;
        4'h3: data_out3[6:0] = ~7'b1001111;
        4'h4: data_out3[6:0] = ~7'b1100110;
        4'h5: data_out3[6:0] = ~7'b1101101;
        4'h6: data_out3[6:0] = ~7'b1111101;
        4'h7: data_out3[6:0] = ~7'b0000111;
        4'h8: data_out3[6:0] = ~7'b1111111;
        4'h9: data_out3[6:0] = ~7'b1101111;
		  default: data_out3[6:0] = ~7'b0101010; 
    endcase
	 
	 
	 
	 
	 case (thousands)
        4'h0: data_out4[6:0] = ~7'b0111111;
        4'h1: data_out4[6:0] = ~7'b0000110;
        4'h2: data_out4[6:0] = ~7'b1011011;
        4'h3: data_out4[6:0] = ~7'b1001111;
        4'h4: data_out4[6:0] = ~7'b1100110;
        4'h5: data_out4[6:0] = ~7'b1101101;
        4'h6: data_out4[6:0] = ~7'b1111101;
        4'h7: data_out4[6:0] = ~7'b0000111;
        4'h8: data_out4[6:0] = ~7'b1111111;
        4'h9: data_out4[6:0] = ~7'b1101111;
		  default: data_out4[6:0] = ~7'b0101010; 
    endcase
	 
end

endmodule