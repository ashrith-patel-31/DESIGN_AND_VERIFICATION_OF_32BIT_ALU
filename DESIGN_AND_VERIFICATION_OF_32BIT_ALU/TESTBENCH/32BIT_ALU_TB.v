`timescale 1ns / 1ps

module alu_32bit_tb;

reg [31:0] A;
reg [31:0] B;
reg [3:0] ALU_Sel;

wire [31:0] ALU_Out;
wire Zero;

alu_32bit uut(
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .Zero(Zero)
);

initial begin

    // Addition
    A = 32'd20;
    B = 32'd10;
    ALU_Sel = 4'b0000;
    #10;

    // Subtraction
    A = 32'd20;
    B = 32'd10;
    ALU_Sel = 4'b0001;
    #10;

    // AND
    A = 32'hF0F0F0F0;
    B = 32'h0F0F0F0F;
    ALU_Sel = 4'b0010;
    #10;

    // OR
    A = 32'hF0F0F0F0;
    B = 32'h0F0F0F0F;
    ALU_Sel = 4'b0011;
    #10;

    // XOR
    A = 32'hAAAAAAAA;
    B = 32'h55555555;
    ALU_Sel = 4'b0100;
    #10;

    // NOT
    A = 32'h0000FFFF;
    ALU_Sel = 4'b0101;
    #10;

    // Left Shift
    A = 32'd8;
    ALU_Sel = 4'b0110;
    #10;

    // Right Shift
    A = 32'd16;
    ALU_Sel = 4'b0111;
    #10;

    $finish;

end

endmodule