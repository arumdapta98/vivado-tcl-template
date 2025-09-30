module top_alu (
  input iCLK,
  input [1:0] iOPCODE,	        // 00: ADD, 01: SUB, 10: LSL, 11:LSR
	input [7:0] iDATAIN1,         // input datain1
	input [7:0] iDATAIN2,         // input datain2
	output reg [7:0] oDATAOUT
  );

	always @ (posedge iCLK)
	begin
    case (iOPCODE)
		  2'b00 : oDATAOUT <= iDATAIN1 + iDATAIN2;
		  2'b01 : oDATAOUT <= iDATAIN1 - iDATAIN2;
			2'b10 : oDATAOUT <= iDATAIN1 << 1;
		  2'b11 : oDATAOUT <= iDATAIN1 >> 1;
      default : oDATAOUT <= 8'h00;
    endcase
		//$strobe  ("opcode=0x%0h datain1=0x%0h datain2=0x%0h outupt=0x%0h", iOPCODE, iDATAIN1, iDATAIN2, oDATAOUT);
	end

endmodule
