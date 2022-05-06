module CLA_Adder #(
  parameter DATA_WIDTH = 32
)(
  input  logic [DATA_WIDTH-1:0] i_data_one, i_data_two,
  
  output logic [DATA_WIDTH-1:0] o_data,
  output logic                  o_carry 
);

  integer i;
  
  logic [DATA_WIDTH-1:0] P;
  logic [DATA_WIDTH-1:0] G;
  logic [DATA_WIDTH:0]   C;
  logic [DATA_WIDTH-1:0] Sum;
  
  always @(i_data_one, i_data_two) begin
    for (i = 0; i < DATA_WIDTH; i++) begin
      C[0] = 1'b0;
      // Carry Generate
      P[i] = i_data_one[i] ^ i_data_two[i];
      // Carry Propagate
      G[i] = i_data_one[i] & i_data_two[i];
      // Sum
      Sum[i] = P[i] ^ C[i];
      // Carry
      C[i+1] = G[i] | (P[i] & C[i]);
    end
  end
  
  assign o_data  = Sum;
  assign o_carry = C[DATA_WIDTH];

endmodule