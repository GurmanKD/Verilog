module encoder_4_to_2 (
  input I0, I1, I2, I3,  // Inputs
  output Y0, Y1          // Outputs
);

  // Implement the 4:2 Encoder logic
  assign Y0 = I1 | I3;
  assign Y1 = I2 | I3;

endmodule


// Test Bench Code :
module encoder_4_to_2_tb;

  // Testbench inputs
  reg td_I0, td_I1, td_I2, td_I3;

  // Observed outputs
  wire td_Y0, td_Y1;

  // Instantiate the Encoder (Unit Under Test)
  encoder_4_to_2 uut (
    .I0(td_I0),
    .I1(td_I1),
    .I2(td_I2),
    .I3(td_I3),
    .Y0(td_Y0),
    .Y1(td_Y1)
  );

  // Apply test cases
  initial begin
    $display("I3 I2 I1 I0 | Y1 Y0");
    $display("-------------------");

    td_I0 = 1; td_I1 = 0; td_I2 = 0; td_I3 = 0; #10 display_values();
    td_I0 = 0; td_I1 = 1; td_I2 = 0; td_I3 = 0; #10 display_values();
    td_I0 = 0; td_I1 = 0; td_I2 = 1; td_I3 = 0; #10 display_values();
    td_I0 = 0; td_I1 = 0; td_I2 = 0; td_I3 = 1; #10 display_values();

    $finish;
  end

  // Display Task
  task display_values;
    begin
      $display("%b  %b  %b  %b  | %b  %b",
                td_I3, td_I2, td_I1, td_I0,
                td_Y1, td_Y0);
    end
  endtask

endmodule