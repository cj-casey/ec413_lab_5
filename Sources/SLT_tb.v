module SLT_tb;

//Inputs
    parameter n = 32;
    reg [n-1:0] a;
    reg [n-1:0] b;
    reg clk;

//Outputs
    wire out;

//Instantiate unit under test
    SLT #(n) SLT(
        .a(a),
        .b(b),
        .clk(clk),
        .out(out)
    );

//Initializations
    initial begin
        clk = 0;
        a = 0;
        b = 0;

    //Test Cases        
        #20;
        a = 10;
        b = 4;

        #20;
        a = 4;
        b = 10;

        #20;
        a = 10;
        b = -8;

        #20;
        a = -8;
        b = 10;

        #20;
        a = 8;
        b = 8;

        #20;
        $finish;
    end

//Clock Generation
    always #5 clk = ~clk;

endmodule