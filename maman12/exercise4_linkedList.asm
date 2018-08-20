.data
num1: .word -1, num3
num2: .word 17, 0
num3: .word 32, num5
num4: .word -6, num2
num5: .word 1972, num4
newLine: .asciiz "\n"

#$t2 - cursor element to list
#$t3 - variable value
#$t4 - sum
#$t5 - shit
#$t6 - sum of diveded by four

.text
la $t2, num1 # point to first element

get_next:
lw $t3,0($t2) # get value of first element

add $t4,$t4,$t3 #add element's value to sum
and $t5, $t3, 11
bne $t5, $zero, skip_four
add $t6, $t6, $t3

skip_four:
lw $t2,4($t2) #move to next element
beq $t2,0,end
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