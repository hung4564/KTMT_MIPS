.data
	Message1:	.asciiz "Nhap n (n <= 100): "
	Message2:	.asciiz "Nhap A["
	Message3:	.asciiz "]: "
	Message4:	.asciiz "\nMang ban dau"
	Message5:	.asciiz "\nMang sau khi sap xep"
	Message6:	.asciiz "\nA["
	Message7:	.asciiz "]= "
	n:		.word 0
	A:		.space 100
.text
.globl main
main:
	# Nhap n
	li $v0, 4
	la $a0, Message1
	syscall
	li $v0, 5
	syscall
	sw $v0, n
	
	# Nhap cac phan tu cua mang
	lw $s0, n			# $s0 = n
	li $t0, 0			# $t0 ~ i = 1
	la $s1, A			# $s1 = dia chi co so cua A
	Loop1:
		bge $t0, $s0, ExitLoop1	# Ket thuc viec nhap cac phan tu cua mang A
		
		add $t1, $s1, $t0	# Dia chi cua A[i]
		
		li $v0, 4
		la $a0, Message2
		syscall
		li $v0, 1
		move $a0, $t0
		syscall
		li $v0, 4
		la $a0, Message3
		syscall
		
		li $v0, 5
		syscall
		sb $v0, 0($t1)
		
		addi $t0, $t0, 1	# i++
		j Loop1
	ExitLoop1:
	
	# In ra cac gia tri cua mang truoc khi sap xep
	li $v0, 4
	la $a0, Message4
	syscall
	
	li $t0, 0			# $t0 ~ i = 0
	Loop2:
		bge $t0, $s0, ExitLoop2	# Ket thuc vong lap
		add $t1, $s1, $t0	# $t1 = Dia chi A[i]
		
		li $v0, 4
		la $a0, Message6
		syscall
		li $v0, 1
		move $a0, $t0
		syscall
		li $v0, 4
		la $a0, Message7
		syscall
		li $v0, 1
		lb $a0, 0($t1)
		syscall
		
		addi $t0, $t0, 1	# i++
		j Loop2
	ExitLoop2:
	
	# Sap xep
	li $t0, 0			# $t0 ~ i = 0
	Loop3:
		bge $t0, $s0, ExitLoop3	# Ket thuc viec sap xep
		addi $t1, $t0, 1	# $t1 ~ j = i + 1
		add $t2, $s1, $t0	# Dia chi A[i]
		Loop4:
			bge $t1, $s0, ExitLoop4
			
			lb $t3, 0($t2)		# $t3 = A[i]
			add $t4, $s1, $t1	# Dia chi A[j]
			lb $t5, 0($t4)		# $t5 = A[j]
			
			blt $t3, $t5, Continue	# A[i] < A[j]
			sb $t3, 0($t4)		# A[i] = gia tri ban dau cua A[j]
			sb $t5, 0($t2)		# A[j] = gia tri ban dau cua A[i]
			
			Continue:
			addi $t1, $t1, 1	# j++
			j Loop4
		ExitLoop4:
	addi $t0, $t0, 1		# i++
	j Loop3
	ExitLoop3:

	# In mang sau khi sap xep
	li $v0, 4
	la $a0, Message5
	syscall
	
	li $t0, 0			# $t0 ~ i = 0
	Loop5:
		bge $t0, $s0, ExitLoop5	# Ket thuc vong lap
		add $t1, $s1, $t0	# $t1 = Dia chi A[i]
		
		li $v0, 4
		la $a0, Message6
		syscall
		li $v0, 1
		move $a0, $t0
		syscall
		li $v0, 4
		la $a0, Message7
		syscall
		li $v0, 1
		lb $a0, 0($t1)
		syscall
		
		addi $t0, $t0, 1	# i++
		j Loop5
	ExitLoop5:
	
	# Ket thuc chuong trinh
	li $v0, 10
	syscall