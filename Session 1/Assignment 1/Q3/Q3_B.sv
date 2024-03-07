//specs: if a is high & b is high then signal c should be high after 1 to 3 clock cycles later

module Q3_B ();

	sequence sr1;
		##[1:3] c;
	endsequence

	property pr1;
		@(posedge clk) (a & b) |-> sr1;
	endproperty

	assert property (pr1) $display("%t: Pass",$time); else $display("%t: Fail",$time); 



endmodule
