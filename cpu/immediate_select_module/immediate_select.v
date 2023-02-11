`timescale 1ns/100ps

module immediate_select(INSTRUCTION, SELECT, OUTPUT);

    input [31:0] INSTRUCTION;
    input [3:0] SELECT;
    output reg [31:0] OUTPUT;

    wire [19:0] TYPE1, TYPE2;
    wire [11:0] TYPE3, TYPE4, TYPE5;
    wire [4:0] TYPE6;


    // Combinations
    assign TYPE1 = INSTRUCTION[31:12];
    assign TYPE2 = INSTRUCTION[31:12];
    assign TYPE3 = INSTRUCTION[31:20];
    assign TYPE4 = (INSTRUCTION[31:25],INSTRUCTION[11:7]);
    assign TYPE5 = (INSTRUCTION[31:25],INSTRUCTION[11:7]);
    assign TYPE6 = INSTRUCTION[29:25];



always @(*)begin
    case (SELECT[2:0])
    // TYPE 1
    3'b000:
        OUT = {TYPE1, {12{1'b0}}};
    // TYPE 2
    3'b001:
        if(SELECT[3] == 1'b1)
            OUT = {{11{1'b0}},TYPE2,1'b0};
        else
            //
            OUT = {{11{INST{31}}}, INST[31], INST[19:12], INST[30:21],1'b1}; 
    3'b000:
        OUT = {YPE1, {12{1'b0}}};
    3'b000:
        OUT = {YPE1, {12{1'b0}}};
    3'b000:
        OUT = {YPE1, {12{1'b0}}};
    3'b000:
        OUT = {YPE1, {12{1'b0}}};

end





end module