.data
	str1: .asciiz "Hello world"
	str2: .asciiz "\nBan co thay lap trinh mips kho(Y/N):"
.text
.globl main
main:
	li	$v0,4
	la	$a0,str1
	syscall		#in str1
	li	$v0,4
	la	$a0,str2
	syscall		#in str2
	#nhap cau tra loi
	li	$v0,12
	
	syscall
	li	$v0,10
	syscall
