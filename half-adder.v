module half_adder (
  input x,         // First input
  input y,         // Second input
  output S,        // Sum output
  output C         // Carry output
);

  // Implement the sum and carry using the given equations
  assign S = (x | y) & (~x | ~y);  
  assign C = x & y;                

endmodule

// The Test Bench Code to verify the half asser module: 
module half_adder_tb;

  reg tb_x, tb_y; // Test inputs     
  wire tb_S, tb_C; // Outputs from the half adder
  
    // instantiating the half adder module
  half_adder uut (
    .x(tb_x),
    .y(tb_y),
    .S(tb_S),
    .C(tb_C)
  );

    // Test all possible combinations of x and y
  initial begin
    $display("x y | S C");  
    $display("-------------");

    tb_x = 0; tb_y = 0; #10 display_values();
    tb_x = 0; tb_y = 1; #10 display_values();
    tb_x = 1; tb_y = 0; #10 display_values();
    tb_x = 1; tb_y = 1; #10 display_values();

    $finish;
  end
  
  task display_values;
    $display("%b %b | %b %b", tb_x, tb_y, tb_S, tb_C);
  endtask

endmodule
