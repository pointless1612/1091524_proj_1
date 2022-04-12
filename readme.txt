While executing, it`ll require user to input a number.
Then according to the number user input, it would do the following operation.

      F(X) = 2.X + F( X / 5 ), X > 20 
	F( X - 2 ) + F( X - 3 ), 10 < X <= 20
	F( X - 1 ) + F( X - 2 ), 1 < X <= 20
	1, X = 0
	5, X = 1
	-1, oyherwise.

The program is written by RISC-V, and it would begin with some system call that require input.
Then it`ll call the recursive function F().
F() start with determine the scope which X located, and then do the corresponding operation until end.

X saved in s0, result saved in s8