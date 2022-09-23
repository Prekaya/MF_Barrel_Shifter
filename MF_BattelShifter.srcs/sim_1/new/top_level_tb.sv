module top_level_tb();
  	logic [7:0] eq;
  	logic clk;
  	logic [15:0] a;
	
	initial begin
		clk = 0;
    	a = {1'b1,3'b010,4'b0000,8'b0100_0000};
  	end
    
    // clk has 50% duty cycle, 10ns period
    //always #5 clk = ~clk;
    top_level mf_barrel_shifter (.sw(a), .led(eq));
  
//  	always @(posedge clk) begin
//    	a <= a + 1;
//  	end
endmodule