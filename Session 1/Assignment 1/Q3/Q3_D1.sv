//specs: write a property: 3 to 8 decoder output Y
//		 at each +ve edge of clock, Y must have only on bit high 

module Q3_D_1 ();

	sequence Seq1;
		$onehot(Y);
	endsequence

	property pr1;
		@(posedge clk) |-> Seq1;
	endproperty

	assert property (pr1) $display("%t: Pass",$time); else $display("%t: Fail",$time); 
	

endmodule
