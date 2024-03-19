module reg_file_tb;

//Inputs
    parameter n = 32;
    reg [n-1:0] R1;
    reg overflow_in;
    reg zero_in;
    reg carry_in;
    reg clk;

//Outputs
    wire [n-1:0] R0;
    wire overflow;
    wire zero;
    wire carry;

//Instantiate unit under test
    reg_file #(n) reg_file(
        .R1(R1),
        .overflow_in(overflow_in),
        .zero_in(zero_in),
        .carry_in(carry_in),
        .clk(clk),
        .R0(R0),
        .overflow(overflow),
        .zero(zero),
        .carry(carry)
    );

//Initializations
    initial begin
        clk = 0;
        R1 = 0;
        overflow_in = 0;
        zero_in = 0;
        carry_in = 0;

    //Test Cases        
        #20;
        R1 = 10;
        overflow_in = 1;
        zero_in = 0;
        carry_in = 1;

        #20;
        R1 = 4;
        overflow_in = 0;
        zero_in = 1;
        carry_in = 0;

        #20;
        R1 = 10;
        overflow_in = 1;
        zero_in = 0;
        carry_in = 1;

        #20;
        R1 = -8;
        overflow_in = 1;
        zero_in = 0;
        carry_in = 1;

        #20;
        R1 = 8;
        overflow_in = 0;
        zero_in = 1;
        carry_in = 0;

        #20;
        $finish;
    end
    
    always #5 clk = ~clk;

endmodule