module floating_point_accum (
  input  logic        clk   , //! clock signal
  input  logic        resetn, //! Active level 0
  input  logic [31:0] a     , //! Add numbers
  input  logic        load  , //! Load strobe for a and b signals
  output logic        busy  , //! High means performing calculations, low means result ready.
  output logic        status, //! Status output. Bit 2 - Not a Number, Bit 1 - Infinity, Bit 0 - Denormal.
  output logic [31:0] sum     //! Accumulator output
);

  logic [31:0] accum_o;
  
  Float32Add adder_inst (
    .CLK(clk),      
    .nRST(resetn),  
    .leftArg(a),    
    .rightArg(accum_o),   
    .addSub(1'b1),
    .loadArgs(load),
    .status(status),    
    .busy(busy),
    .sum(accum_o)     
  );

  assign sum = accum_o;
endmodule