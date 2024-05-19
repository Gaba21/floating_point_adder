module floating_point_adder (
  input  logic        clk   , //! clock signal
  input  logic        resetn, //! Active level 0
  input  logic [31:0] a     , //! First number for add
  input  logic [31:0] b     , //! Second number for add
  input  logic        load  , //! Load strobe for a and b signals
  output logic        busy  , //! High means performing calculations, low means result ready.
  output logic        status, //! Status output. Bit 2 - Not a Number, Bit 1 - Infinity, Bit 0 - Denormal.
  output logic [31:0] sum     //! Add result
);


  Float32Add adder_inst (
    .CLK(clk),      
    .nRST(resetn),  
    .leftArg(a),    
    .rightArg(b),   
    .addSub(1'b1),
    .loadArgs(load),
    .status(status),    
    .busy(busy),
    .sum(sum)     
  );

endmodule