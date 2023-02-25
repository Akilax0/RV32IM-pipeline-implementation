`include "../cpu/alu_module/alu.v"
`timescale 1ns/100ps

module alu_tb;

    // Declare connections to ALU
    reg[31:0] DATA1, DATA2;
    reg[5:0] SELECT;
    wire[31:0] RESULT;

    // Instantiate ALU module
    alu myALU(DATA1, DATA2, RESULT, SELECT);



endmodule
