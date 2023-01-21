module alu (
   
    input [31:0] DATA1,
    input [31:0] DATA2,
    input [5:0] SELECT,

    output reg [31:0] RESULT,
    output ZERO
);

always @ (*)
begin
    case(alu_control)
        3'b000: result = a + b;
        3'b001: result = a - b;
        3'b010: result = ~a;
        3'b011: result = a<<b;
        3'b100: result = a>>b;
        3'b101: result = a & b;
        3'b110: result = a | b;
        3'b110: begin if (a<b) result = 32'd1;
        else result = 32'd0;
    end
    default: result = a+b;
endcase
end

assign zero  = (result == 32'd0)? 1'b1:1'b0;

endmodule
