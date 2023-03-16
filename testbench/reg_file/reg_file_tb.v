`include "../../cpu/reg_file_module/reg_file.v"
`timescale 1ns/100ps

module reg_file_tb;

    // Declare connections to ALU
    reg[31:0] IN;
    reg[4:0] INADDRESS, OUT1ADDRESS, OUT2ADDRESS;
    reg WRITE_EN, CLK, RESET;
    wire[31:0] OUT1, OUT2;

    // Instantiate ALU module
    reg_file myreg_file(IN, OUT1, OUT2, INADDRESS, OUT1ADDRESS,OUT2ADDRESS, WRITE_EN, CLK, RESET);

    initial begin
        $dumpfile("reg_file_tb.vcd");
        $dumpvars(0,myreg_file);
    end

    initial begin
        IN = 32'b00000000000000000000000000000010;

        INADDRESS = 5'b00000;
        OUT1ADDRESS = 5'b00000;
        OUT2ADDRESS = 5'b00000;

        WRITE_EN = 1'b0;
        CLK = 1'b1;
        RESET = 1'b1;

        #10



        SELECT = 6'b000000;
        #10;
        SELECT = 6'b000001;
        #10;
        SELECT = 6'b000010;
        #10;
        SELECT = 6'b000011;

        #10;
        SELECT = 6'b000100;
        #10;
        SELECT = 6'b000101;
        #10;
        SELECT = 6'b000110;
        #10;
        SELECT = 6'b000111;

        //mul commmand
        #10;
        SELECT = 6'b001000;
        #10;
        SELECT = 6'b001001;
        #10;
        SELECT = 6'b001010;
        #10;
        SELECT = 6'b001011;
        #10;
        SELECT = 6'b001100;
        #10;
        SELECT = 6'b001101;
        #10;
        SELECT = 6'b001111;


        #10;
        SELECT = 6'b010000;
        #10;
        SELECT = 6'b010101;
        #10;
        SELECT = 6'b011111;
        $finish;

    end

endmodule
