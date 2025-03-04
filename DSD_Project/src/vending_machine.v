`timescale 1ns / 1ps

module vending_machine();
    
    // **Vending Machine Inputs & Wires**
    reg clk, reset, C;
    reg [3:0] P, Qu, M; // Price, Quantity, Money
    wire [2:0] Q;
    wire [7:0] T; // Control signal (Auto-generated)

    // **Instantiate Control Logic** 
	// assign C <= 0;
	
    control_logic ctrl (
        .clk(clk),
        .reset(reset),
        .C(C), // Ensure C is connected as input
        .Q(Q),
        .T(T)
    );

    wire [3:0] price, quantity, money, total, s, result, com;
    wire Disp;

    Register p_reg (P, T[1], 0, clk, price);
    Register q_reg (Qu, T[1], 0, clk, quantity);
    Register m_reg (M, T[1], 0, clk, money);

    // **ALU & Comparator Operations**
    alu_4bit mul (price, quantity, 1'b0, 1'b1, T[2], total);
    comparator_4bit comp (money, total, C); // Comparator (T3)
	// alu_4bit comp (money, total, 1'b0, 1'b1, T[3], C);
	// con8to1 con(com, C);
    return_value ret(money, T[4], result);
    alu_4bit sub (money, total, 1'b1, 1'b0, T[5], s);
    return_value ret2(s, T[6], result);
    return_value dispense(C, T[7], Disp);

    
	
	initial begin
        clk = 0;	 
        forever #5 clk = ~clk; // Clock period of 10ns
    end
   
       // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;	   
		
        //C = 0;
        P = 4'b0000; Qu = 4'b0000; M = 4'b0000;
        #10 reset = 0; // Release Reset

        // **Test Case 1: Valid Purchase**
        #10 P = 4'b0010; // Price = 2
            Qu = 4'b0011; // Quantity = 3
            M = 4'b0110;  // Money = 6 (valid as 2 × 3 = 6)
           // C = 1; 
        #20;

        // **Test Case 2: More Money Provided**
        #10 P = 4'b0100; // Price = 4
            Qu = 4'b0010; // Quantity = 2
            M = 4'b1010;  // Money = 9
           // C = 1;
        #20;

        // **Test Case 3: Not Enough Money**
        #10 P = 4'b0101; // Price = 5
            Qu = 4'b0011; // Quantity = 3
            M = 4'b1100;  // Money = 12 (invalid as 5 × 3 = 15)
            //C = 0; 
        #20;

        // **Test Case 4: Edge Case (Minimum Values)**
        #10 P = 4'b0001; // Price = 1
            Qu = 4'b0001; // Quantity = 1
            M = 4'b0011;  // Money = 1 (valid as 1 × 1 = 1)
            //C = 1;
        #20;  
		
		//reset = 1;
		//#10
		//reset = 0;
		

        // **Test Case 5: Maximum Valid Input**
        #10 P = 4'b0011; // Price = 3
            Qu = 4'b0101; // Quantity = 5
            M = 4'b1111;  // Money = 15 (valid as 3 × 5 = 15)
            //C = 1;
        #20;
        
        // **Test Case 6: Low Money (Invalid Purchase)**
        #10 P = 4'b0110; // Price = 6
            Qu = 4'b0010; // Quantity = 2
            M = 4'b1000;  // Money = 8 (invalid as 6 × 2 = 12)
            //C = 0;
        #20;

        // **Test Case 7: Random Inputs (Middle Values)**
        #10 P = 4'b0011; // Price = 3
            Qu = 4'b0011; // Quantity = 3
            M = 4'b1001;  // Money = 9 (valid as 3 × 3 = 9)
          //  C = 1;
        #20;
        
        // **Stop Simulation**
        $finish;
    end

    // **Monitor Outputs**
    initial begin
        $monitor("Time=%0t | C=%b | Price=%b (%0d), Quantity=%b (%0d), Money=%b (%0d) | Total=%b (%0d) | Return=%b | Dispense=%b",
         $time, C, 
         price, price, quantity, quantity, money, money, 
         total, total, result, Disp);

    end


endmodule
