.globl main
.data
	Input0: .string"Input a number:\n"
	Input1: .string"The damage:\n"
	endl: .string"\n"
.text
main:
	addi s11, zero, 20 # s11 = 20
	addi s10, zero, 10 # s10 = 10
	addi s9, zero, 1   # s9 = 1
	addi s8, zero, 0   # s8 = result
	la a0, Input0
	li a7, 4
	ecall		  # output "Input a number:"
	li a7, 5
	ecall		  # aquire input x
	mv s0, a0   	  # s0 = input = x
	jal ra, F	  # jump to F
	la a0, Input1
	li a7, 4
	ecall		  # output "The damage:"
	mv a0, s8
	li a7, 1
	ecall		  # output the result
	li a7, 10
	ecall		  # end the program
F:
	blt s11, s0, case1 # x > 20
	blt s10, s0, case2 # x > 10
	blt s9, s0, case3  # x > 1
	beq s9, s0, case4  # x == 1
	beq zero, s0, case5# x == 0
	j case6		   # elsewhere
 case1:  # x > 20
 	addi t0, zero, 2 # t0 = 2
 	mul t2, s0, t0   # t2 = x * 2
 	add s8, t2, s8   # s8 += x * 2
 	addi sp, sp, -8
 	sw ra, 0(sp)
 	sw s0, 4(sp)
 	addi t0, zero, 5 # t0 = 5
 	div s0, s0, t0   # s0 = x / 5
 	jal ra, F  	 # F(x / 5)
 	lw ra, 0(sp)
 	lw s0, 4(sp)
 	addi sp, sp, 8
 	jalr zero, 0(ra)
case2:   # 10 < x <= 20
	addi sp, sp, -8
	sw ra, 0(sp)
	sw s0, 4(sp)
	addi s0, s0, -2
	jal ra, F        # F(x - 2)
	lw s0, 4(sp)
	sw s0, 4(sp)
	addi s0, s0, -3
	jal ra, F	 # F(x - 3)
	lw ra, 0(sp)
	lw s0, 4(sp) 
	addi sp, sp, 8
	jalr zero, 0(ra)
case3:   # 1 < x <= 10
	addi sp, sp, -8
	sw ra, 0(sp)
	sw s0, 4(sp)
	addi s0, s0, -1
	jal ra, F        # F(x - 1)
	lw s0, 4(sp)
	sw s0, 4(sp)
	addi s0, s0, -2
	jal ra, F	 # F(x - 2)
	lw ra, 0(sp)
	lw s0, 4(sp) 
	addi sp, sp, 8
	jalr zero, 0(ra)
case4: 	# x == 1
	addi s8, s8, 5   # output += 5
	jalr zero, 0(ra)
case5:	# x == 0
	addi s8, s8, 1   # output += 1
	jalr zero, 0(ra)
case6:	# elsewhere
	addi s8, s8, -1  # output = -1
	jalr zero, 0(ra)

	
	
