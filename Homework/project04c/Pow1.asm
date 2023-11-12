// create loop
// set R0 and R1 to R3
// call function
// dec powlvc
// jmp to loop

// init R5
@R5
M=0

// powlvc = R4 dont mess with R4
@R4
D=M
@powlvc
M=D

// if power is 1 save base into R5 and end
@R4
D=M-1 
@POWERWASONE
D;JEQ

// start loop
(POWLOOP)
@powlvc
D=M
@END
D;JEQ

// R0 = R3
@R3
D=M
@R0
M=D

// R1 = R3
@R3
D=M
@R1
M=D

// store the address of next in return
@NEXT
D=A
@return
M=D

@functionMult
0;JMP

(NEXT)
// store result of functionMult into R5
@R2
D=M
@R5
M=D+M

@powlvc
M=M-1

@POWLOOP
0;JMP

(functionMult)
// R2 = 0
@R2
M=0

// flag = 0
@flag
M=0

// lcv = R0
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

// lcv = lcv - 1
@lcv
M=M-1

@LOOP
0;JMP

(FLAGCHECK)
// if flag was false or 0 go to end
@flag
D=M
@RETURN
D;JEQ

// needs to be flipped because flag was set
@R2
M=!M
M=M+1

// return to caller
(RETURN)
@return
A=M
0;JMP

(POWERWASONE)
@R3
D=M
@R5
M=D

(END)
@END
0;JMP
