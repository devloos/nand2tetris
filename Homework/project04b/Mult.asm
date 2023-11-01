// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// R0 will be my loop control variable

// R2 = 0

// LOOP:
// if R0 == 0
//   END
// else
//   R2 = R2 + R1
//   R0 = R0 - 1
//   LOOP

// R2 = 0
@R2
M=0

// flag = 0
@flag
M=0

@R0
D=M
@lcv
M=D

// if R0 is positive jump to loop
@lcv
D=M
@LOOP
D;JGE

// R0 is negative... convert to positive
@lcv
M=!M
M=M+1

// we need to set flag
@flag
M=1

// if R0 == 0
(LOOP)
@lcv
D=M
@FLAGCHECK
D;JEQ

// R2 = R2 + R1
@R1
D=M
@R2
M=D+M

// R0 = R0 - 1
@lcv
M=M-1

@LOOP
0;JMP

(FLAGCHECK)
// if flag was false or 0 go to end
@flag
D=M
@END
D;JEQ

// needs to be flipped because flag was set
@R2
M=!M
M=M+1

// infinite program loop
(END)
@END
0;JMP
