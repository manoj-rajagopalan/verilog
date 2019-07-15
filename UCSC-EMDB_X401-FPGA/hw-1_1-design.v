// procedural
module Mux_2_1_p(a, b, sel, c);
  input a, b, sel;
  output c;

  assign c = (sel == 0 ? a : b);
endmodule

module NAND_using_mux_2_1_p(a, b, c);
  input a, b;
  output c;
  wire a_and_b;

  Mux_2_1_p ab(0, b, a, a_and_b);
  Mux_2_1_p not_ab(1, 0, a_and_b, c);
endmodule

// behavioral
module Mux_2_1_b(a, b, sel, c);
  input a, b, sel;
  output c;
  reg c;

  always @(*) begin
    if (sel == 0)
      c = a;
    else
      c = b;
  end
endmodule

module NAND_using_mux_2_1_b(a, b, c);
  input a, b;
  output c;
  wire a_and_b;

  Mux_2_1_b ab(0, b, a, a_and_b);
  Mux_2_1_b not_ab(1, 0, a_and_b, c);
endmodule
