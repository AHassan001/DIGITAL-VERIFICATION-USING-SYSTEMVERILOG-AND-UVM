module priority_enc_TB ();

     reg   clk, rst;
     reg   [3:0] D;
     wire  [1:0] Y;  
     wire  valid;

    integer correct_count, error_count;

    priority_enc Encoder_DUT (
              .clk(clk),
              .rst(rst),
              .D(D), 
              .Y(Y),  
              .valid(valid));

    initial begin
        clk =0;
    
        forever 
          #1 clk = ~clk; 
    end

    initial begin
        correct_count = 0;
        error_count = 0;
        D = 0;

        check_reset;

        D = 4'b1111;
        check_result (3,1);

        D = 4'b1000;
        check_result (0,1);

        D = 4'b1100;
        check_result (1,1);

        D = 4'b0000;
        check_result (2'bXX,0);

        D = 4'b1110;
        check_result (2,1);

        $display( "%t: At the END of the test the error count = %d and the correct count = %d", $time, error_count, correct_count);
        $stop;

    end

    task check_result (input [1:0]expected_result_Y, input expected_result_valid);
        @(negedge clk);
        if ( expected_result_Y !== Y )
        begin
            error_count++;
            $display("%t: Error in Y value = %d and the expected Y = %d",$time,Y,expected_result_Y);
        end

        else if (expected_result_valid !== valid) 
        begin
            error_count++;
            $display("%t: Error in valid value = %d and the expected valid = %d",$time,expected_result_valid,valid);
        end

        else
            correct_count++;
    endtask


    task check_reset ();
          rst = 1;
          @(negedge clk);

          if( Y !== 0)  
          begin
            error_count++;
            $display("%t: Error in reset value",$time);
          end

          else
            correct_count++;

          rst = 0;
    endtask

endmodule