.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 is the pointer to the start of the vector
#	a1 is the # of elements in the vector
# Returns:
#	a0 is the first index of the largest element
# =================================================================
argmax:

    # Prologue
	addi sp sp -28
	sw t0 0(sp)
	sw t1 4(sp)
	sw t2 8(sp)
	sw t3 12(sp)
	sw t4 16(sp)
	sw t5 20(sp)
    sw t6 24(sp)
	li t0 0
	li t1 0
	li t4 0

loop_start:
	add t2 t1 a0
	lw t3 0(t2)
	blt t4 t3 loop_continue
	addi t0 t0 1
	beq t0 a1 loop_end
	addi t1 t1 4
	j loop_start

loop_continue:
	mv t5 t2
	mv t4 t3
    add t6 t0 x0
	j loop_start

loop_end:
    

    # Epilogue
	mv a0 t6
	lw t0 0(sp)
	lw t1 4(sp)
	lw t2 8(sp)
	lw t3 12(sp)
	lw t4 16(sp)
	lw t5 20(sp)
    lw t6 24(sp)
	addi sp sp 28
	ret
