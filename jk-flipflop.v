module jk_flip_flop (
  input J,
  input K,
  input CLK,
  output reg Q,
  output Qn
);

  assign Qn = ~Q;
  always @(posedge CLK) begin
    if (J == 0 && K == 0)
      Q <= Q;        // No change
    else if (J == 0 && K == 1)
      Q <= 0;        // Reset
    else if (J == 1 && K == 0)
      Q <= 1;        // Set
    else
      Q <= ~Q;       // Toggle
  end

endmodule

module jk_flip_flop_tb;

  // Testbench signals
  reg td_J;
  reg td_K;
  reg td_CLK;
  wire td_Q, td_Qn;
  // Instantiate JK Flip-Flop
  jk_flip_flop uut (
    .J(td_J),
    .K(td_K),
    .CLK(td_CLK),
    .Q(td_Q),
    .Qn(td_Qn)
  );

  // Clock generation
  initial begin
    td_CLK = 0;
    forever #5 td_CLK = ~td_CLK;
  end

  // Header and monitor
  initial begin
    $display("Time | J | K | CLK | Q | Qn");
    $monitor("%4d | %b | %b |  %b  | %b | %b",
              $time, td_J, td_K, td_CLK, td_Q, td_Qn);
  end

  // Stimulus
  initial begin
    td_J = 0; td_K = 0; #10;
    td_J = 0; td_K = 1; #10;
    td_J = 1; td_K = 0; #10;
    td_J = 1; td_K = 1; #10;
    td_J = 0; td_K = 0; #10;
    td_J = 1; td_K = 1; #10;

    $finish;
  end

endmodule
