module top2 (
    input wire clk,
    input wire btnD,
    input wire btnU,
   // input wire reset,
  //  input wire enable,
    output wire [0:6] seg,
    output wire [3:0] an
);
    reg enable;
    reg reset;
    wire [5:0] minutes;
    wire [5:0] seconds;
    wire clk_100MHz; // 100 MHz master clock input
   
   wire  clk_2Hz;    // 2 Hz clock output
   wire  clk_1Hz;    // 1 Hz clock output
   wire  clk_fast;   // Faster clock output (50 - 700 Hz)
   wire clk_adjust;
    clk clock (
        .clk_100MHz(clk),  // 100 MHz master clock input
        .clk_2Hz(clk_2Hz),
        .clk_1Hz(clk_1Hz),
        .clk_fast(clk_fast),
        .clk_adjust(clk_adjust)
    );

    // Instantiate the counting module
    counting uut (
        .timer(clk_1Hz),
        .reset(reset),
        .enable(enable),
        .minutes(minutes),
        .seconds(seconds)
    );
    
    // Instantiate the 7-segment display module
    sevsegdisplay display (
        .min(minutes),
        .sec(seconds),
        .clk(clk),
        .seg(seg),
        .digit(an)// Use the same clock for simplicity
    );
    
    always @ (posedge clk) begin
        reset = btnD;
        if(btnU == 1) begin
            enable = ~enable;
        end
    end

endmodule