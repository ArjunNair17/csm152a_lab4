`timescale 1ns / 1ps

module counting_tb;

  
    reg timer;
    reg[31:0] amount;
    wire deposit;
    wire withdraw;
    reg input_mode;
    wire [5:0] minutes;
    wire [5:0] seconds;
    reg clk;
   wire [6:0] seg;
   wire [3:0] an;
    wire clk_2Hz;
    wire deposit_2;
      wire clk_1Hz;
      wire clk_fast;
      wire clk_adjust;
      wire [31:0] balance;
      reg [31:0] number;
      
      
         // Test stimulus
       initial begin
       
     
          
   //       reset = 0;
   //       enable = 1
          amount = 100;
          input_mode = 0;
          clk = 0;
          timer = 0;
          #100;
          
          
           // Reset signals
         
   
           
   
      
       end
      
  
     assign deposit = 1;
        assign withdraw = 0;
        
       
        reg [16:0] counter;
        reg curDeposit;
        reg curWD;
        
        initial begin
            counter = 0;
            curDeposit = 1;
            curWD = 0;
            input_mode = 0;
        end
      
       always #(1) clk = ~clk;
       
       always @(posedge clk) begin
            if(counter == 16'b1111_1111_1111_1111) begin
                counter <= 0;
                input_mode <= ~input_mode;
    //          
            end
            
            else begin
               counter <= counter + 1;
            end
            
            if(input_mode == 0) begin
                number <= balance;
            end
            
            else begin
                number <= amount;
            end
       end
  
  
  
  
  
      // Instantiate the clock divider module
      clk clk_inst (
          .clk_100MHz(clk),
          .clk_2Hz(clk_2Hz),
          .clk_1Hz(clk_1Hz),
          .clk_fast(clk_fast),
          .clk_adjust(clk_adjust)
      );

    counting uut (
        .timer(clk),
          .deposit(curDeposit),
          .input_mode(input_mode),
          .amount(amount),
          .withdrawal(curWD),
          .balance(balance)
//        .enable(enable),
      
    );
    
     sevsegdisplay display (
           .number(number),
           .clk(timer),
           .seg(seg),
           .digit(an)
           
       );

    // Clock generation
 
   


 
    
 
   
//   always @ * begin
//    deposit =  
//   end
   
//   assign deposit = curDeposit;
//   assign withdraw = curWD;


endmodule
