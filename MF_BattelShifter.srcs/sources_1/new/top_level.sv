module top_level(
	input logic [15:0] sw,
	output logic [7:0] led
    );
    
    // signals
    logic lr;
    logic [2:0] amt;
    logic [7:0] x;
    logic [7:0] preshift, postshift;
    logic [7:0] lshifted, rshifted;
    
    //body
    assign lr = sw[15];
    assign amt = sw[14:12];
    assign x = sw[7:0];
    
    
    /*
    barrel_shifter_l lbarrel(.amt(amt),.x(x),.y(lshifted));
    barrel_shifter_r rbarrel(.amt(amt),.x(x),.y(rshifted)); 
    */
    
    
    barrel_shifter_r rbarrel(.amt(amt),.x(x),.y(rshifted));
    assign preshift = {<<{x}};
    barrel_shifter_r lbarrel(.amt(amt),.x(preshift),.y(postshift)); 
    assign lshifted = {<<{postshift}};
    
    assign led = lr? lshifted : rshifted;
endmodule
