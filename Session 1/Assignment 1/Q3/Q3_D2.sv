//specs: write a property: 4 to 2 priority encoder output valid
//		 at each +ve edge of clock, if D bits are low then after one cycle output valid must be low 

module Q3_D_2 ();

	sequence Seq1;
		##1 (valid == 0);
	endsequence

	property pr1;
		@(posedge clk) (D = 4'b0000) |-> Seq1;
	endproperty

	assert property (pr1) $display("%t: Pass",$time); else $display("%t: Fail",$time); 
	
endmodule
