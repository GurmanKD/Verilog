module demux_1_to_4 (
  input D,          // Data input
  input S0, S1,     // Selection lines
  output Y0, Y1, Y2, Y3  // Outputs
);

  // Implement the 1:4 DEMUX logic
  assign Y0 = ~S1 & ~S0 & D;
  assign Y1 = ~S1 & S0 & D;
  assign Y2 = S1 & ~S0 & D;
  assign Y3 = S1 & S0 & D;

endmodule

// Test Bench Code
module demux_1_to_4_tb;

  // Testbench inputs
  reg td_D;
  reg td_S0, td_S1;

  // Observed outputs
  wire td_Y0, td_Y1, td_Y2, td_Y3;

  // Instantiate the DEMUX (Unit Under Test)
  demux_1_to_4 uut (
    .D(td_D),
    .S0(td_S0),
    .S1(td_S1),
    .Y0(td_Y0),
    .Y1(td_Y1),
    .Y2(td_Y2),
    .Y3(td_Y3)
  );

  // Apply test cases
  initial begin
    $display("S1 S0 | D | Y0 Y1 Y2 Y3");
    $display("-----------------------");

    // Set input
    td_D = 1;

    td_S1 = 0; td_S0 = 0; #10 display_values();
    td_S1 = 0; td_S0 = 1; #10 display_values();
    td_S1 = 1; td_S0 = 0; #10 display_values();
    td_S1 = 1; td_S0 = 1; #10 display_values();

    $finish;
  end

  // Task to display outputs
  task display_values;
    begin
      $display(" %b  %b | %b | %b  %b  %b  %b",
               td_S1, td_S0, td_D,
               td_Y0, td_Y1, td_Y2, td_Y3);
    end
  endtask

endmodule