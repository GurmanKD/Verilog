module bcd_to_excess3 (
  input A, B, C, D,   // BCD input
  output W, X, Y, Z   // Excess-3 output
);

  // Implement the Excess-3 outputs using the derived Boolean expressions
  assign W = A | (B & (C | D));      // W = A + B(C + D)
  assign X = (~B & D) | (~B & C) | (B & ~D);  // X = B'D + B'C + BD'
  assign Y = C ^ D;                  // Y = C XOR D
  assign Z = ~D;                     // Z = D'

endmodule

module bcd_to_excess3_tb;

  // Testbench input signals
  reg td_A, td_B, td_C, td_D;

  // Testbench output observation wires
  wire td_W, td_X, td_Y, td_Z;

  // Instantiate the converter module (Device Under Test)
  bcd_to_excess3 uut (
    .A(td_A),
    .B(td_B),
    .C(td_C),
    .D(td_D),
    .W(td_W),
    .X(td_X),
    .Y(td_Y),
    .Z(td_Z)
  );

  // Test sequence
  initial begin
    $display(" A  B  C  D | W  X  Y  Z ");
    $display("--------------------------");

    td_A = 0; td_B = 0; td_C = 0; td_D = 0; #10 display_values();  // 0
    td_A = 0; td_B = 0; td_C = 0; td_D = 1; #10 display_values();  // 1
    td_A = 0; td_B = 0; td_C = 1; td_D = 0; #10 display_values();  // 2
    td_A = 0; td_B = 0; td_C = 1; td_D = 1; #10 display_values();  // 3
    td_A = 0; td_B = 1; td_C = 0; td_D = 0; #10 display_values();  // 4
    td_A = 0; td_B = 1; td_C = 0; td_D = 1; #10 display_values();  // 5
    td_A = 0; td_B = 1; td_C = 1; td_D = 0; #10 display_values();  // 6
    td_A = 0; td_B = 1; td_C = 1; td_D = 1; #10 display_values();  // 7
    td_A = 1; td_B = 0; td_C = 0; td_D = 0; #10 display_values();  // 8
    td_A = 1; td_B = 0; td_C = 0; td_D = 1; #10 display_values();  // 9

    $finish;
  end

  // Task to print values
  task display_values;
    begin
      $display(" %b  %b  %b  %b | %b  %b  %b  %b",
                td_A, td_B, td_C, td_D,
                td_W, td_X, td_Y, td_Z);
    end
  endtask

endmodule
