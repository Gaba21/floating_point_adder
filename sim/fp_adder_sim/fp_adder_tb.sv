module fp_adder_tb ();



  logic        clk   ;
  logic        resetn;
  logic [31:0] a     ;
  logic [31:0] b     ;
  logic        load  ;
  logic        busy  ;
  logic        status;
  logic [31:0] sum   ;

  floating_point_adder DUT (
    .clk   (clk   ),
    .resetn(resetn),
    .a     (a     ),
    .b     (b     ),
    .load  (load  ),
    .busy  (busy  ),
    .status(status),
    .sum   (sum   )
  );
    initial clk <= 0;
    always #5 clk = ~clk;
    
    initial begin
        a = '0;
        b = '0;
        resetn = 0;
        #30;
        resetn = 1;

        @(posedge clk);
        a = 32'h4048f5c3; // 3.14
        b = 32'h41200000; // 10
        load = 1'b1;      // load data
        @(posedge clk);
        load = 1'b0;  
        @(negedge busy);   
        $display("0x%0h",sum);
        //Set new numbers
        load = 1'b1;
        a = 32'h40a00000; // 5
        b = 32'hc047ae14; // -3.12
        @(posedge clk);
        load = 1'b0; 
        @(negedge busy);   

        $display("0x%0h",sum);
        #50;
        $finish();


    end

endmodule