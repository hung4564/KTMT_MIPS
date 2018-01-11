#sap xep 1 mang n phan tu
#in ra phan tu lon thu k
.data 
	n: .word 0
	k: .word 0
	A: .word 0:40
	str1: .asciiz "\nNhap n: "
	str2: .asciiz " "
	str3: .asciiz "\nNhap A["
	str4: .asciiz "]: "
	str5: .asciiz " "
.text 
.globl main
main: 
li $v0,4
la $a0,str1
syscall

#$t0 = n
li $v0,5
syscall
sw $v0,n
lw $t0,n

li $t1, 0 #t1 la bien dem
la $t2, A #t2 la dia chi

for: 
	beq $t1,$t0,done #i = n out
	#in "Nhap a[i]: "
	li $v0,4
	la $a0,str3
	syscall
	
	li $v0,1
	la $a0,($t1)
	syscall
	
	li $v0,4
	la $a0,str4
	syscall
	
	#Nhap a[i]
	li $v0, 5
	syscall 
	sw $v0,($t2)
	
	addi $t1,$t1,1
	#Dich con tro
	addi $t2,$t2,4
	j for
done: 
	li $t1, 0 #t1 = i
	la $t2, A #t2 la dia chi
#for i=0 to n-2 
#	for j=i to n-1
#	 if (a[i]>a[j])
#	  c = a[i]
#	  a[i] = a[j]
#	  a[j] = c
	addi $t3,$t0,-1 #t3 = n-1
for1:
	beq $t1,$t3,done2   #i = n-1 done 
	move $t4,$t1 	    #j = i
	move $t7,$t2
	for2: 
		beq $t4,$t0,done3 #j = n done
		lw $t5,($t2) #$t5 = a[i]
		lw $t6,($t7) #$t6 = a[j]
		bgt $t5,$t6,sapxep
		j xong
		sapxep:
		sw $t5,($t7)  #a[j] = t5
		sw $t6,($t2)  #a[i] = t6 
		xong: 
		addi $t4,$t4,1 #j++
		addi $t7,$t7,4 #dia chi mang +4
		j for2
	done3:
	addi $t1,$t1,1 #i++
	addi $t2,$t2,4 
	j for1
done2: 
	la $t2,A
	li $t1,0
for3:
	beq $t1,$t0,exit
	li $v0,1
	lw $a0,($t2)
	syscall
	
	li $v0,4
	la $a0,str5
	syscall
	
	li $v0,4
	la $a0,str2
	syscall 
	
	addi $t1,$t1,1
	addi $t2,$t2,4
	j for3

exit:
	li $v0, 10
	syscall	
