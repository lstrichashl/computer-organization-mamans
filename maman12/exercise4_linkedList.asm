.data
num1: .word -1, num3
num2: .word 17, 0
num3: .word 32, num5
num4: .word -6, num2
num5: .word 1972, num4
newLine: .asciiz "\n"
initGetBase4: .word 3221225472 #1100000000

#$t3 - flag: is digit should be printed
#$t4 - sum
#$t5 - shit
#$t6 - sum of diveded by four
#$t7 - shit2
#$t8 - holds how nuch to shift
#$t9 - temp
#$s1 - holds andwise 4 base
#$s2 - variable value
#$s3 - cursor element to list

.text
la $s3, num1 # point to first element
la $s1, initGetBase4
lw $s1,0($s1)

get_next:
lw $s2,0($s3) # get value of first element
add $t4,$t4,$s2 #add element's value to su

# if nuber is divided by four - add it to sum
and $t5, $s2, 11
bne $t5, $zero, skip_sum_four_based
add $t6, $t6, $s2

skip_sum_four_based:
#get four based number
and $t8,$t8,$zero
move $t9, $s2
and $t3, $t3, $zero
get_4_base_next:
and $t7, $t9, $s1
srl $t7,$t7,30
or $t3, $t7, $t3
beq $t3, $zero, dont_print
li $v0,1
move $a0,$t7
syscall
dont_print:
addi $t8, $t8, 1
sll $t9, $t9, 2
bne $t8, 16, get_4_base_next

li $v0,4
la $a0, newLine
syscall
lw $s3,4($s3) #move to next element
beq $s3,0,end
j get_next


end:
#print sum
li $v0,1
move $a0,$t4
syscall
#print new line
li $v0,4
la $a0, newLine
syscall
#print divided by four sum
li $v0,1
move $a0,$t6
syscall
