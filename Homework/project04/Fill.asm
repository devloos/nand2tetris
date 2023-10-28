// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// LOOP:
// if KBD == 0
//   set pixelcolor 0
// else
//   set pixelcolor 1

// if prev == pixelcolor
//   LOOP
// else
//   prev = pixelcolor
//   FUNCTION:
//   compute all pixels depending on pixelcolor
//   ...
//   LOOP

@prev
M=0

@pixelcolor
M=0

(LOOP)
@KBD
D=M
@NOINPUT
D;JEQ

// user pressed key
@pixelcolor
M=-1
@ENDINPUT
0;JMP

// if KBD == 0
(NOINPUT)
@pixelcolor
M=0

// if prev == pixelcolor LOOP
(ENDINPUT)
@pixelcolor
D=M
@prev
D=D-M
@LOOP
D;JEQ

// else
// prev = pixelcolor
@pixelcolor
D=M
@prev
M=D

// screen loop init
@8191
D=A
@i
M=D

(SCREENLOOP)
@i
D=M
@LOOP
D;JLT

// go forward ith place
@SCREEN
D=D+A

// address of current 16 bits into R0
@R0
M=D

// grab pixel color
@pixelcolor
D=M

//  store either 1 or 0 in current 16 bits or ith index
@R0
A=M
M=D

@i
M=M-1

@SCREENLOOP
0;JMP

