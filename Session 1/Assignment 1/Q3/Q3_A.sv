//specs: if A is high in +ve edge oa aclock then signal B should be high after 2 clock cycles

module Q3_A ();

	sequence sr1;
		##2 b;
	endsequence

	property pr1;
		@(posedge clk) a |-> sr1;
	endproperty

	assert property (pr1) $display("%t: Pass",$time); else $display("%t: Fail",$time); 



endmodule
