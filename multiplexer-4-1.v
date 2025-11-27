module mux_4_to_1 (
  input I0, I1, I2, I3,   // Data inputs
  input S0, S1,           // Selection lines
  output Y                // Output
);

  // Implement the 4:1 MUX logic
  assign Y = (~S1 & ~S0 & I0) | (~S1 & S0 & I1) | (S1 & ~S0 & I2) | (S1 & S0 & I3);

endmodule

//Test-Bench Code 
module mux_4_to_1_tb;

  // Testbench inputs
  reg td_I0, td_I1, td_I2, td_I3;   // Data inputs
  reg td_S0, td_S1;                 // Selection lines

  // Testbench observed output
  wire td_Y;                        // Output from the MUX

  // Instantiate the 4:1 MUX (Unit Under Test)
  mux_4_to_1 uut (
    .I0(td_I0),
    .I1(td_I1),
    .I2(td_I2),
    .I3(td_I3),
    .S0(td_S0),
    .S1(td_S1),
    .Y(td_Y)
  );

  // Test all combinations of select lines
  initial begin
    $display("S1 S0 | I0 I1 I2 I3 | Y ");
    $display("-----------------------");

    // Fix data inputs
    td_I0 = 1; td_I1 = 0; td_I2 = 1; td_I3 = 0;

    td_S1 = 0; td_S0 = 0; #10 display_values();
    td_S1 = 0; td_S0 = 1; #10 display_values();
    td_S1 = 1; td_S0 = 0; #10 display_values();
    td_S1 = 1; td_S0 = 1; #10 display_values();

    $finish;
  end

  // Reusable task to display current values
  task display_values;
    begin
      $display(" %b  %b  |  %b  %b  %b  %b  | %b",
               td_S1, td_S0,
               td_I0, td_I1, td_I2, td_I3,
               td_Y);
    end
  endtask

endmodule

