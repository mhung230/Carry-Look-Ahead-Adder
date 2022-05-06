module CLA_adder_tb #(
  parameter DATA_WIDTH = 32
);

  logic [DATA_WIDTH-1:0] i_data_one, i_data_two;
  
  logic [DATA_WIDTH-1:0] o_data;
  logic                  o_carry;

  CLA_Adder CLA(.*);
  
  initial begin
    i_data_one = 32'h1023ac52;
    i_data_two = 32'h00000000; #20
    i_data_one = 32'h00000000;
    i_data_two = 32'hffffffff; #20
    i_data_one = 32'h000012fc;
    i_data_two = 32'h75ca0112; #20
    i_data_one = 32'hd7c812ea;
    i_data_two = 32'hf2000105; #20
    i_data_one = 32'h0000000f;
    i_data_two = 32'hfffffff1; #20
    i_data_one = 32'hf0000000;
    i_data_two = 32'h1fffffff; #20
    i_data_one = 32'h000ff000;
    i_data_two = 32'h00011000; #20
    i_data_one = 32'hac000010;
    i_data_two = 32'h2000facd; #20
    i_data_one = 32'h00000005;
    i_data_two = 32'h0000000a; #20
    i_data_one = 32'h1200000a;
    i_data_two = 32'h00a00001; #20
    $finish;
  end

endmodule