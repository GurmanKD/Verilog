module t_flip_flop (
  input T,            // Toggle input
  input clk,          // Clock signal
  output reg q        // Output storage
);
  initial q = 1'b0;  // start from 0
  always @(posedge clk) begin
    if (T)
      q <= ~q;        // Toggle when enabled
  end
endmodule

// asyncronous counter
module async_counter (
  input clk,              // System clock
  output [3:0] count      // 4-bit counter output
);

  // Individual flip-flop outputs
  wire q0, q1, q2, q3;

  // T flip-flops
  t_flip_flop ff0 (.T(1'b1), .clk(clk),  .q(q0)); // LSB toggles on main clock
  t_flip_flop ff1 (.T(1'b1), .clk(q0),   .q(q1)); // Toggles when previous bit changes
  t_flip_flop ff2 (.T(1'b1), .clk(q1),   .q(q2));
  t_flip_flop ff3 (.T(1'b1), .clk(q2),   .q(q3)); // MSB

  // Connect outputs as 4-bit value
  assign count = {q3, q2, q1, q0};

endmodule

// test bench
module async_counter_tb;

  reg tb_clk;             // Testbench clock
  wire [3:0] tb_count;    // Observed output

  // Instantiate DUT
  async_counter uut (
    .clk(tb_clk),
    .count(tb_count)
  );

  // Clock generation
  initial begin
    tb_clk = 0;
    forever #5 tb_clk = ~tb_clk;
  end

  // Display
  initial begin
    $display("Time | clk | count");
    $monitor("%4d |  %b  | %b", $time, tb_clk, tb_count);

    #100;
    $finish;
  end

endmodule
