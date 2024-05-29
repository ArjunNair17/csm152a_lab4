`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/20/2024 02:55:13 PM
// Design Name: 
// Module Name: counting
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module counting(
    input wire timer,
    input wire input_mode,
    input wire deposit,
    input wire withdrawal,
    input wire [31:0] amount,
    output reg [31:0] balance    
    );
    
    reg [31:0] curBalance;
    initial begin 
        curBalance = 1000;
    end
    
    always @ (posedge timer) begin
        if(input_mode) begin
            if(deposit) begin
                    if(amount + curBalance > 9999) begin
                        curBalance <= 9999;
                    end
                    else begin
                        curBalance <= curBalance + amount;
                    end
                  end  
                  
                  if(withdrawal) begin
                      if(amount > balance) begin
                           curBalance <= curBalance;
                      end
                      
                      else begin
                           curBalance <= curBalance - amount;
                      end
                  end 
        end
        
        assign balance = curBalance;
          
//        if(reset) begin
//            seconds <= 0;
//            minutes <= 0;
//        end
//        else if (seconds == 59) begin
//            seconds <= 0;
//            if(minutes == 59) begin
//                minutes <= 0;
//            end
//            minutes <= minutes + 1;
        
//        end    
//        else  begin
        
//                if(enable) begin
//                  seconds <= seconds + 1;
//                end
        end     
        
       
//         if (reset) begin
//            seconds <= 0;
//            minutes <= 0;
      //  end
//        if (enable) begin
//            if(seconds == 59) begin
//                minutes <= minutes + 1;
//                seconds <= 0;
//                if (minutes == 60) begin
//                    minutes <= 0;
//                    seconds <= 0;
//                end
//            end
//            else begin
//                 seconds <= seconds + 1;
//            end
       // end
endmodule