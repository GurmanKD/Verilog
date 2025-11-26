module half_subtractor (
  input x,       // Minuend
  input y,       // Subtrahend
  output D,      // Difference output
  output B       // Borrow output
);

  // Implement the difference and borrow using the given equations
  assign D = (~x & y) | (x & ~y);  // D = x'y + xy'
  assign B = ~x & y;               // B = x'y

endmodule

// TestBench Code 
module half_subtractor_tb;

  reg tb_x, tb_y;         // Test inputs
  wire tb_D, tb_B;        // Outputs from the half subtractor

  // Instantiate the half subtractor module
  half_subtractor uut (
    .x(tb_x),
    .y(tb_y),
    .D(tb_D),
    .B(tb_B)
  );

  // Test all possible combinations of x and y
  initial begin
    $display("x y | D B");  // Header for the output table
    $display("-------------");

    tb_x = 0; tb_y = 0; #10 display_values();
    tb_x = 0; tb_y = 1; #10 display_values();
    tb_x = 1; tb_y = 0; #10 display_values();
    tb_x = 1; tb_y = 1; #10 display_values();

    $finish;
  end
  
  task display_values;
    $display("%b %b | %b %b", tb_x, tb_y, tb_D, tb_B);
  endtask

endmodule