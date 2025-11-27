module d_flip_flop (
  input D,       // Data input
  input CLK,     // Clock input
  output reg Q,  // Output
  output Qn      // Complemented output
);

  assign Qn = ~Q; // Complementary output

  always @(posedge CLK) begin
    Q <= D; // Transfer D to Q on clock's rising edge
  end

endmodule

// Test Bench Code 
module d_flip_flop_tb;

  // Testbench signals
  reg td_D;
  reg td_CLK;
  wire td_Q, td_Qn;

  // Instantiate the D Flip-Flop
  d_flip_flop uut (
    .D(td_D),
    .CLK(td_CLK),
    .Q(td_Q),
    .Qn(td_Qn)
  );

  // Clock generation
  initial begin
    td_CLK = 0;
    forever #5 td_CLK = ~td_CLK;
  end

  // Display header (same format)
  initial begin
    $display("Time | D | CLK | Q | Qn");
  end

  // SAME $monitor behavior (live updates)
  initial begin
    $monitor("%4d | %b |  %b  | %b |  %b",
              $time, td_D, td_CLK, td_Q, td_Qn);
  end

  // SAME test sequence
  initial begin
    td_D = 0; #10;
    td_D = 1; #10;
    td_D = 0; #10;
    td_D = 1; #10;

    $finish;
  end

endmodule
