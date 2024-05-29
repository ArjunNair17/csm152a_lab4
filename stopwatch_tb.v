`timescale 1ns / 1ps

module stopwatch_tb;
    reg clock_100mhz;
    reg pause;
    reg reset;
    reg select;
    reg adjust;
    wire [3:0] segment_num;
    wire [6:0] segment_values;

    initial begin
       clock_100mhz = 0;
       reset = 0;
       select = 0;
       pause = 0;
       adjust = 0;
       #100;
       pause = 1;
       #100;
       pause = 0;
       #100;
       pause = 1;
       #100;
       pause = 0;
    end
            
    always begin
        #0.1;
        clock_100mhz = ~clock_100mhz;
    end

    stopwatch stopwatch(
        // input
        .clock_100mhz(clock_100mhz),
        .reset(reset),
        .pause(pause),
        .adjust(adjust),
        .select(select),
        // output
        .segment_num(segment_num),
        .segment_values(segment_values)
    );
    
endmodule
