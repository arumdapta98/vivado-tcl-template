module top_dec7seg(
  input  [3:0] sw,
  output [6:0] seg,
  output [3:0] an
  );

  assign an = 4'b0000;

  dec7seg u1 (
    .iBCD(sw),
    .oHEX({seg[0],seg[1],seg[2],seg[3],seg[4],seg[5],seg[6]})
  );
  
endmodule

module dec7seg(
  input [3:0] iBCD,
  output reg [6:0] oHEX
  );

  always @(*) begin
  case(iBCD)
    4'b0000 : oHEX = 7'b0000001; /* 0 */
    4'b0001 : oHEX = 7'b1001111; /* 1 */
    4'b0010 : oHEX = 7'b0010010; /* 2 */
    4'b0011 : oHEX = 7'b0000110; /* 3 */
    4'b0100 : oHEX = 7'b1001100; /* 4 */
    4'b0101 : oHEX = 7'b0100100; /* 5 */
    4'b0110 : oHEX = 7'b0100000; /* 6 */
    4'b0111 : oHEX = 7'b0001111; /* 7 */
    4'b1000 : oHEX = 7'b0000000; /* 8 */
    4'b1001 : oHEX = 7'b0000100; /* 9 */
    default : oHEX = 7'b0000001; /* 0 */
  endcase
  end
endmodule
