// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/mult/Mult.tst

load Pow.hack,
output-file Pow.out,
compare-to Pow.cmp,
output-list RAM[3]%D2.6.2 RAM[4]%D2.6.2 RAM[5]%D2.6.2;

set RAM[3] 2,   // Set test arguments
set RAM[4] 1,
set RAM[5] -1;  // Test that program initialized product to 0
repeat 30000 {
  ticktock;
}

output;

set PC 0,
set RAM[3] 2,   // Set test arguments
set RAM[4] 3,
set RAM[5] -1;  // Ensure that program initialized product to 0
repeat 30000 {
  ticktock;
}

output;

set PC 0,
set RAM[3] 2,   // Set test arguments
set RAM[4] 10,
set RAM[5] -1;  // Ensure that program initialized product to 0
repeat 30000 {
  ticktock;
}

output;

set PC 0,
set RAM[3] 5,   // Set test arguments
set RAM[4] 3,
set RAM[5] -1;  // Ensure that program initialized product to 0
repeat 30000 {
  ticktock;
}

output;


set PC 0,
set RAM[3] 10,   // Set test arguments
set RAM[4] 4,
set RAM[5] -1;  // Ensure that program initialized product to 0
repeat 30000 {
  ticktock;
}

output;

set PC 0,
set RAM[3] -1,   // Set test arguments
set RAM[4] 1,
set RAM[5] -1;  // Ensure that program initialized product to 0
repeat 30000 {
  ticktock;
}

output;

set PC 0,
set RAM[3] -1,   // Set test arguments
set RAM[4] 3,
set RAM[5] -1;  // Ensure that program initialized product to 0
repeat 30000 {
  ticktock;
}

output;

set PC 0,
set RAM[3] -1,   // Set test arguments
set RAM[4] 10,
set RAM[5] -1;  // Ensure that program initialized product to 0
repeat 30000 {
  ticktock;
}

output;

set PC 0,
set RAM[3] -5,   // Set test arguments
set RAM[4] 5,
set RAM[5] -1;  // Ensure that program initialized product to 0
repeat 30000 {
  ticktock;
}

output;

set PC 0,
set RAM[3] 0,   // Set test arguments
set RAM[4] 1,
set RAM[5] -1;  // Ensure that program initialized product to 0
repeat 30000 {
  ticktock;
}

output;
