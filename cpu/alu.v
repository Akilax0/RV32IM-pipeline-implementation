module alu (DATA1, DATA2, RESULT, SELECT);

    input   [31:0]  DATA1, DATA2;
    input   [5:0]   SELECT;
    output  [31:0]  RESULT;

    reg     [31:0]  RESULT;

    wire    [31:0]  INTER_ADD,
                    INTER_SUB,
                    INTER_AND,
                    INTER_OR,
                    INTER_XOR,
                    INTER_SLT,
                    INTER_SLTU,
                    INTER_SLL,
                    INTER_SRL,
                    INTER_SRA;


    assign  INTER_ADD = DATA1 + DATA2;

    assign  INTER_SUB = DATA1 - DATA2;
    assign  INTER_AND = DATA1 & DATA2;
    assign  INTER_OR = DATA1 | DATA2;
    assign  INTER_XOR = DATA1 ^ DATA2;

    assign  INTER_SLL = DATA1 << DATA2;
    assign  INTER_SRL = DATA1 >> DATA2;
    assign  INTER_SRA = DATA1 >>> DATA2;

    assign  INTER_SLT = DATA1 >>> DATA2;
    assign  INTER_SLTU = DATA1 >>> DATA2;

/*
ref: https://varshaaks.wordpress.com/2021/07/19/rv32i-base-integer-instruction-set/


R -Type

ADD, SUB , OR, XOR, AND
SLT, SLTU
SLL, SRL, SRA

I - Type

ADDI, ANDI, ORI, XORI
SLTI, (SLTUI)
SLLI, SRLI, SRAI


U -Type

LUI
AUIPC

J - Type

JALR
JAL

B - Type

BEQ BNEQ    
BLT BLTU
BGE BGEU

S - Type

LOAD LW LH LHU LB LBU
STORE SW SH SB 

*/

always @ (*)
begin
    case(alu_control)
        6'b000000:
            RESULT = INTER_ADD;
        6'b000001:
            RESULT = INTER_SLL;
        6'b000010:
            RESULT = INTER_SLT
        6'b000011:
            RESULT = INTER_SLTU;
        6'b000100:
            RESULT = INTER_XOR;
        6'b000101:
            RESULT = INTER_SRL;
        6'b000110:
            RESULT = INTER_OR;
        6'b000111:
            RESULT = INTER_AND;
        6'b001000:
            RESULT = INTER_SUB;
        6'b001001:
            RESULT = INTER_SRA;
        default: RESULT = 0;
    endcase
end

endmodule
