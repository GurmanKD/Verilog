Experiment 8 (Decoder)  
To design and verify a 2:4 decoder.   
Code :
module decoder_2_to_4 (
  input A, B,         // Inputs
  output Y0, Y1, Y2, Y3  // Outputs
);

  // Implement the 2:4 Decoder logic
  assign Y0 = ~A & ~B;
  assign Y1 = ~A & B;
  assign Y2 = A & ~B;
  assign Y3 = A & B;

endmodule
Test Bench Code :
module decoder_2_to_4_tb;

  reg A, B;          // Inputs
  wire Y0, Y1, Y2, Y3;  // Outputs

  // Instantiate the 2:4 Decoder
  decoder_2_to_4 uut (
    .A(A),
    .B(B),
    .Y0(Y0),
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3)
  );

  // Test all combinations
  initial begin
    $display("A B | Y0 Y1 Y2 Y3");
    $display("-----------------");

    A = 0; B = 0; #10 $display("%b %b | %b  %b  %b  %b", A, B, Y0, Y1, Y2, Y3);
    A = 0; B = 1; #10 $display("%b %b | %b  %b  %b  %b", A, B, Y0, Y1, Y2, Y3);
    A = 1; B = 0; #10 $display("%b %b | %b  %b  %b  %b", A, B, Y0, Y1, Y2, Y3);
    A = 1; B = 1; #10 $display("%b %b | %b  %b  %b  %b", A, B, Y0, Y1, Y2, Y3);

    $finish;
  end

endmodule
