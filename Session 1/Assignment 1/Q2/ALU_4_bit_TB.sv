module ALU_4_bit_TB ();
    reg  clk, reset;
    reg  [1:0] Opcode;	      // The opcode
    reg  signed [3:0] A, B;	// Input data B in 2's complement

    wire signed [4:0] C;       // ALU output in 2's complement

		 
   ALU_4_bit DUT_ALU (
                     .clk(clk),
                     .reset(reset),
                     .Opcode(Opcode), 
                     .A(A),
                     .B(B),
                     .C(C));

   localparam Add	           = 2'b00; // A + B
   localparam Sub	           = 2'b01; // A - B
   localparam Not_A	        = 2'b10; // ~A
   localparam ReductionOR_B  = 2'b11; // |B

   integer error_count, correct_count;
   
   initial begin
      clk = 0;
      forever
         #1 clk = ~clk;
   end

   initial begin
      error_count = 0;
      correct_count = 0;
      A = 0;
      B = 0;
      Opcode = 0;
      check_reset;

      A = 5;
      B = 2;
      Opcode = 0;
      check_result(7);

      check_reset;

      A = 4;
      B = 5;
      Opcode = 0;
      check_result(9);

      A = 11;
      B = 5;
      Opcode = 0;
      check_result(0);

      A = 5;
      B = 1;
      Opcode = 0;
      check_result(6);

      A = 4;
      B = 2;
      Opcode = 1;
      check_result(2);

      A = 2;
      B = 4;
      Opcode = 1;
      check_result(-2);

      A = 2;
      B = 4;
      Opcode = 2;
      check_result(-3);

      A = 2;
      B = 7;
      Opcode = 2;
      check_result(-3);

      A = 4;
      B = 3;
      Opcode = 3;
      check_result(1);

      A = 9;
      B = 4;
      Opcode = 3;
      check_result(1);

      A = 9;
      B = 0;
      Opcode = 3;
      check_result(0);

      $display("%t: At the END of the test the error count = %d and the correct count = %d", $time, error_count, correct_count);
      $stop;
   end

   task check_reset();
      reset = 1;
      @(negedge clk);

      if( C !== 0)
      begin
         error_count++;
         $display("%t: Error in reset.", $time);
      end

      else
         correct_count++;

      reset = 0;
   endtask

   task check_result (input [4:0]expected_output);
      @(negedge clk);

      if( C !== expected_output)
      begin
         error_count++;
         $display("%t: Error in the output %d, and the expected is = %d.", $time, C, expected_output);
      end

      else
         correct_count++;
   endtask
endmodule