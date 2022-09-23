module reverse_byte(
	input logic [7:0] x,
	output logic [7:0] y
    );
    
    assign y = x[0:7];
    
endmodule