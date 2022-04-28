.data
	number1: .word 0
	number2: .word 1
	space: .asciiz " "
	prompt: .asciiz "n elementos: "
.text		
	main:
		li $v0, 4
		la $a0, prompt
		syscall

		li $v0, 5
		syscall

		move $t0, $v0
		
		addi $t1, $zero, 3
		
		li $v0, 1
		lw $a0, number1
		syscall
		
		li $v0, 1
		lw $a1, number2
		syscall
		
		lw $t2, number1($zero)
		lw $t3, number2($zero)
	
		while:
			bgt $t1, $t0, exit
			add $t4, $t2, $t3
			jal printNumber
			add $t2, $t3, $zero
			add $t3, $t4, $zero
			addi $t1, $t1, 1
			
			j while
			
		exit:
		
		li $v0, 10
		syscall
	
	printNumber:
		li $v0, 1
		add $a0, $t4, $zero
		syscall
		
		li $v0, 4
		la $a0, space
		syscall
		
		jr $ra