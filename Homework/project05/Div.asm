// initialize variables
@R2
M=0

@R3
M=0

@R1
D=M
@divisor
M=D

// Call MAIN function
@MAIN
0;JMP

(ALGO_1)
  // quotient = 0
  @R2
  M=0;

  // remainder = dividend
  @R0
  D=M
  @R3
  M=D

  (DO_WHILE_ALGO_1)
    // remainder = remainder - divisor
    @divisor
    D=M
    @R3
    M=M-D

    // quotient += 1
    @R2
    M=M+1

    // if (remainder > 0) then JMP to DO_WHILE_ALGO_1
    @R3
    D=M
    @DO_WHILE_ALGO_1
    D;JGT
  (END_DO_WHILE_ALGO_1)

  // if (remainder >= 0) then return
  @R3
  D=M
  @ALGO_1_HANDLE_RETURN
  D;JGE

  // remainder += divisor
  @divisor
  D=M
  @R3
  M=M+D

  // quotient -= 1
  @R2
  M=M-1

  (ALGO_1_HANDLE_RETURN)
    @ALGO_1_RETURN
    A=M
    0;JMP
(END_ALGO_1)

(ALGO_2)
  // quotient = 0
  @R2
  M=0;

  // remainder = dividend
  @R0
  D=M
  @R3
  M=D

  (DO_WHILE_ALGO_2)
    // remainder = remainder + divisor
    @divisor
    D=M
    @R3
    M=M+D

    // quotient += 1
    @R2
    M=M+1

    // if (remainder < 0) then JMP to DO_WHILE_ALGO_2
    @R3
    D=M
    @DO_WHILE_ALGO_2
    D;JLT
  (END_DO_WHILE_ALGO_2)

  (ALGO_2_HANDLE_RETURN)
    @ALGO_2_RETURN
    A=M
    0;JMP
(END_ALGO_2)

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
  @divisor
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

  @END
  0;JMP

  (IF_SPECIAL_CASE_2)
    // if (R0 == 0) then JMP to EVALUATE_CASES
    @R0
    D=M
    @EVALUATE_CASES
    D;JEQ

    // if (R1 != 0) then JMP to EVALUATE_CASES
    @divisor
    D=M
    @EVALUATE_CASES
    D;JNE

    // R2 = 0
    @R2
    M=0

    // R3 = -1
    @R3
    M=-1

    @END
    0;JMP
  (END_IF_SPECIAL_CASE_2)

  // if (R0 > 0 && R1 > 0) then invoke algo_1
  // else if (R0 > 0 && R1 < 0) then negate R1 and invoke algo_1 and negate R3
  // else if (R0 < 0 && R1 > 0) then invoke algo_2 and negate R3
  // else negate R1 and invoke algo_2
  (EVALUATE_CASES)
    // if (R0 < 0) then JMP to CASE_2
    @R0
    D=M
    @CASE_2
    D;JLT

    // if (R1 < 0) then JMP to CASE_2
    @divisor
    D=M
    @CASE_2
    D;JLT

    // at this point R0 and R1 are greater than 0
    // call algo_1
    @END
    D=A
    @ALGO_1_RETURN
    M=D

    @ALGO_1
    0;JMP

    (CASE_2)
      // if (R0 < 0) then JMP to CASE_3
      @R0
      D=M
      @CASE_3
      D;JLT

      // if (R1 > 0) then JMP to CASE_3
      @divisor
      D=M
      @CASE_3
      D;JGT

      // at this point R0 > 0 and R1 < 0
      // negate divisor
      @divisor
      M=!M
      M=M+1

      // call algo_1
      @CASE_2_NEXT
      D=A
      @ALGO_1_RETURN
      M=D

      @ALGO_1
      0;JMP

      (CASE_2_NEXT)
        // negate quotient
        @R2
        M=!M
        M=M+1

      @END
      0;JMP
    (END_CASE_2)

    (CASE_3)
      // if (R0 > 0) then JMP to CASE_4
      @R0
      D=M
      @CASE_4
      D;JGT

      // if (R1 < 0) then JMP to CASE_4
      @divisor
      D=M
      @CASE_4
      D;JLT

      // at this point R0 < 0 and R1 > 0
      // call algo_2
      @CASE_3_NEXT
      D=A
      @ALGO_2_RETURN
      M=D

      @ALGO_2
      0;JMP

      (CASE_3_NEXT)
        // negate quotient
        @R2
        M=!M
        M=M+1

      @END
      0;JMP
    (END_CASE_3)

    (CASE_4)
      // at this point R0 < 0 and R1 < 0
      // negate divisor
      @divisor
      M=!M
      M=M+1

      // call algo_2
      @END
      D=A
      @ALGO_2_RETURN
      M=D

      @ALGO_2
      0;JMP
    (END_CASE_4)

  (END_EVALUATE_CASES)

(END_MAIN)

(END)
  @END
  0;JMP