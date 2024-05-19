module fp_accum_tb ();



  logic        clk   ;
  logic        resetn;
  logic [31:0] a     ;
  logic        load  ;
  logic        busy  ;
  logic        status;
  logic [31:0] sum   ;


  int cnt = 0;

  floating_point_accum  DUT(
  .clk(clk)   ,   
  .resetn(resetn),
  .a(a)     ,     
  .load(load)  ,  
  .busy(busy)  ,  
  .status(status),
  .sum(sum)       
);
    initial clk <= 0;
    always #5 clk = ~clk;
    
    initial begin
        a = '0;
        resetn = 0;
        
        #30;
        resetn = 1;

        @(posedge clk);
        a = 32'h3f800000; // 3.14
        load = 1'b1;      // load data

        while (cnt < 10) begin
            @(negedge busy);   
            cnt++;
        end
        $display("0x%0h",sum);
        #50;
        $finish();


    end

endmodule