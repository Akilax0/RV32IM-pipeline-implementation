# RV32IM-pipeline-implementation

## Introduction

The objective of this project is to design and implement a 5 stage pipeline CPU to support the RISC-V instruction architecture. This pipeline CPU supports the entire RV32IM ISA which contains 45 instructions. The designed pipeline CPU is implemented using behavioral modeling in verilogHDL and icarus Verilog is used to compile and simulate. gtkWave is used to observe the behavior.

## RV32I Base Integer Instruction Set Version 2.0


### Programmers Model for Base Integer Subset

 ISA designed to require minimumal implementation. 
 RV32I contains,
    - 47 unique instructions


There are 31 general purpose registers
    - x1 - x31 hold integer values
    - x0 hardwired to constant 0.
    - no hardwired lr but calling convention uses x1 to hold return address on 
a call. 
    - for RV32 32 bits wide registers.
    - One additional user-visible register, program counter -> pc.



![int_reg_state](./images/int_reg_state.png)

### Base Instruction Formats

Four core instruction formats -> R/I/S/U

All fixed 32bit in length and must aligned on 4 bute boundary in memory. 
An instruction address misaligned exception is generated on a taken branch or 
unconditional jump if targer is not 4 byte aligned. 

No instruction fetch misaligned exception is generated for conditional branch 
that is not taken.



![ins_formats](./images/ins_formats.png)



Each immediate subfield is labeled with the bit position (imm[x]) in the 
immediate value being produced, rather than within ins's immediate field as
usually done. 

ISA keeps rs1,rs2 and rd at same posiitons in all formats -> simplify decoding.
Except for 5-bit immediates in CSR instructions. Immediates leftmost and sign bit always on 31 bit. 

### Immediate Encoding Variants

Further two variants of instruction formats -> B/J 
based on handling immediates.

Difference between S and B is that the 12 bit immediate field used to 
encode branch offsets in multiples of 2 in B format.
Instead of shifting all bits in the 

