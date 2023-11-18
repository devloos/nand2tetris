// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/mult/Mult.tst

load Div.hack,
output-file Div.out,
compare-to Div.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2 RAM[3]%D2.6.2;

set RAM[0] 0,   // Set test arguments
set RAM[1] 0,
set RAM[2] -1;  // Test that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] 1,   // Set test arguments
set RAM[1] 0,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] -1,   // Set test arguments
set RAM[1] 0,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] 0,   // Set test arguments
set RAM[1] 2,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] 0,   // Set test arguments
set RAM[1] -2,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] 3,   // Set test arguments
set RAM[1] 1,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] 1,   // Set test arguments
set RAM[1] 3,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] 6,   // Set test arguments
set RAM[1] 14,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] 16,   // Set test arguments
set RAM[1] 1,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] 1,   // Set test arguments
set RAM[1] 1,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] 35,   // Set test arguments
set RAM[1] 55,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] 51,   // Set test arguments
set RAM[1] 5,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

// ec1 tests - mix of positive and negative operands

set PC 0,
set RAM[0] -6,   // Set test arguments
set RAM[1] 7,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] -6,   // Set test arguments
set RAM[1] -7,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] 66,   // Set test arguments
set RAM[1] -27,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] 1,   // Set test arguments
set RAM[1] -1,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] -1,   // Set test arguments
set RAM[1] 1,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] -1,   // Set test arguments
set RAM[1] -1,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;

set PC 0,
set RAM[0] -1,   // Set test arguments
set RAM[1] -10,
set RAM[2] -1;  // Ensure that program initialized product to 0
repeat 1000 {
  ticktock;
}

output;


