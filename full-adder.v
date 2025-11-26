module full_adder (
  input x,       // First input
  input y,       // Second input
  input z,       // Third input (carry-in)
  output S,      // Sum output
  output C       // Carry output
);

  // Implement the sum and carry using the given equations
  assign S = (~x & ~y & z) | (~x & y & ~z) | (x & ~y & ~z) | (x & y & z);
  assign C = (x & y) | (x & z) | (y & z);

endmodule

// Test-Bench Code :
module full_adder_tb;

  reg tb_x, tb_y, tb_z;   // Test inputs
  wire tb_S, tb_C;     // Outputs from the full adder

  // Instantiate the full adder module
  full_adder uut (
    .x(tb_x),
    .y(tb_y),
    .z(tb_z),
    .S(tb_S),
    .C(tb_C)
  );

  // Test all possible combinations of x, y, and z
  initial begin
    $display("x y z | S C");  // Header for the output table
    $display("---------------");

    tb_x = 0; tb_y = 0; tb_z = 0; #10 display_values();
    tb_x = 0; tb_y = 0; tb_z = 1; #10 display_values();
    tb_x = 0; tb_y = 1; tb_z = 0; #10 display_values();
    tb_x = 0; tb_y = 1; tb_z = 1; #10 display_values();
    tb_x = 1; tb_y = 0; tb_z = 0; #10 display_values();
    tb_x = 1; tb_y = 0; tb_z = 1; #10 display_values();
    tb_x = 1; tb_y = 1; tb_z = 0; #10 display_values();
    tb_x = 1; tb_y = 1; tb_z = 1; #10 display_values();

    $finish;
  end
  
  task display_values;
    $display("%b %b %b | %b %b", tb_x, tb_y, tb_z, tb_S, tb_C);
  endtask

endmodule