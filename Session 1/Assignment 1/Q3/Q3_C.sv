//specs: write a seuence s11b, after 2 +ve clock edges, signal b shold be low

module Q3_C ();

	sequence s11b;
		##[2] (b==0);
	endsequence

	/*property pr1;
		@(posedge clk) |-> s11b;
	endproperty

	assert property (pr1) $display("%t: Pass",$time); else $display("%t: Fail",$time); 
	*/

endmodule
