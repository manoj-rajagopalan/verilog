module TestBench;

  // Test Procedural implementation
  reg a, b, c;
  wire c_out;

  initial begin
    a = 0;
    b = 0;
    #1 b = 1;
    #1 a = 1;
    #1 b = 0;
    #1 ;
  end

  NAND_using_mux_2_1_p dut_p(a, b, c_out);
  always @(c_out)
    c = c_out;

  // Test Behavioral implementation
  reg x, y, z;
  wire z_out;

  initial begin
    x = 0;
    y = 0;
    #1 y = 1;
    #1 x = 1;
    #1 y = 0;
    #1 ;
  end

  NAND_using_mux_2_1_b dut_b(x, y, z_out);
  always @(z_out)
    z = z_out;

  // Monitor all signals
  initial
    $monitor("a = %d, b = %d, c = %d\nx = %d, y = %d, z = %d",
             a, b, c, x, y, z);


endmodule
