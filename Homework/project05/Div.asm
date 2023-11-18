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
  D=A
  @R0
  M=D
(END_ALGO_1)

// should not run
(ALGO_2)
  @400
  D=A
  @R0
  M=D
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

  @END
  0;JMP

  (IF_SPECIAL_CASE_2)
    // if (R0 == 0) then JMP to EVALUATE_CASES
    @R0
    D=M
    @EVALUATE_CASES
    D;JEQ

    // if (R1 != 0) then JMP to EVALUATE_CASES
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
    @R1
    D=M
    @CASE_2
    D;JLT

    // at this point R0 and R1 are greater than 0
    @10
    D=A
    @R2
    M=D
    @R3
    M=D

    @END
    0;JMP

    (CASE_2)
      // if (R0 < 0) then JMP to CASE_3
      @R0
      D=M
      @CASE_3
      D;JLT

      // if (R1 > 0) then JMP to CASE_3
      @R1
      D=M
      @CASE_3
      D;JGT

      // at this point R0 > 0 and R1 < 0
      @20
      D=A
      @R2
      M=D
      @R3
      M=D

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
      @R1
      D=M
      @CASE_4
      D;JLT

      // at this point R0 < 0 and R1 > 0
      @30
      D=A
      @R2
      M=D
      @R3
      M=D

      @END
      0;JMP
    (END_CASE_3)

    (CASE_4)
      // at this point R0 < 0 and R1 < 0
      @40
      D=A
      @R2
      M=D
      @R3
      M=D

      @END
      0;JMP
    (END_CASE_4)

  (END_EVALUATE_CASES)

(END_MAIN)

(END)
  @END
  0;JMP

