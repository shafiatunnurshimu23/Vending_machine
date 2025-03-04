module test_control_logic;

    reg clk, reset, C;
    wire [2:0] Q;
    wire [7:0] T;

    // Instantiate the control_logic module
    control_logic uut (
        .clk(clk),
        .reset(reset),
        .C(C),
        .Q(Q),
        .T(T)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Monitor the signals
        $monitor("Time=%0t | clk=%b, reset=%b, C=%b | Q=%b, T=%b", 
                 $time, clk, reset, C, Q, T);

        // Initialize signals
        clk = 0;
        reset = 1;
        C = 0;
        #10;
        
        // Release reset
        reset = 0;
        #10;
        
        // Test Case 1: Apply C = 0
        C = 0;
        #20;
        
        // Test Case 2: Apply C = 1
        C = 1;
        #20;
        
        // Test Case 3: Toggle reset
        reset = 1;
        #10;
        reset = 0;
        #20;
        
        // Test Case 4: Multiple clock cycles with C = 1
        C = 1;
        #50;
        
        $stop;
    end

endmodule
