// initialize variables
@R2
M=0

@R3
M=0

// Call MAIN function
@MAIN
0;JMP

// should not run
(ALGO_1)
  @400
  D=M
  @R0
  M=D

// should not run
(ALGO_2)
  @400
  D=M
  @R0
  M=D

(MAIN)
  // We want to check whether we have any "special cases"
  // if (R0 == 0 && R1 == 0) then R2 = 0 and R3 = -2
  // else if (R0 != 0 && R1 == 0) then R2 = 0 and R3 = -1

  // if (R0 != 0) then JMP to IF_SPECIAL_CASE_2
  @R0
  D=M
  @IF_SPECIAL_CASE_2
  D;JNE

  // if (R1 != 0) then JMP to IF_SPECIAL_CASE_2
  @R1
  D=M
  @IF_SPECIAL_CASE_2
  D;JNE

  // R2 = 0
  @R2
  M=0

  // R3 = -2
  @R3
  M=-1
  M=M-1

  (IF_SPECIAL_CASE_2)
    // if (R0 == 0) then JMP to SWITCH
    @R0
    D=M
    @EVALUATE_CASES
    D;JEQ

    // if (R1 != 0) then JMP to SWITCH
    @R1
    D=M
    @EVALUATE_CASES
    D;JNE

    // R2 = 0
    @R2
    M=0

    // R3 = -1
    @R3
    M=-1

  // if (R0 > 0 && R1 > 0) then invoke algo_1
  // else if (R0 > 0 && R1 < 0) then negate R1 and invoke algo_1 and negate R3
  // else if (R0 < 0 && R1 > 0) then invoke algo_2 and negate R3
  // else negate R1 and invoke algo_2
  (EVALUATE_CASES)
  

(END)
  @END
  0;JMP

