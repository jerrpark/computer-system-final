.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 is the pointer to the array
#	a1 is the # of elements in the array
# Returns:
#	None
# ==============================================================================
relu:
    # Prologue
	addi sp sp -20
	sw t0 0(sp)
	sw t1 4(sp)
	sw t2 8(sp)
	sw t3 12(sp)
	sw t4 16(sp)
	
	li t0 1
	li t1 0
	li t2 0
	li t3 0
	li t4 0


loop_start:
	add t2 t1 a0
	lw t3 0(t2)
	blt t3 x0 loop_continue
	beq t0 a1 loop_end
	addi t0 t0 1
	addi t1 t1 4
	j loop_start


loop_continue:
	sw x0 0(t2)
	
	j loop_start


loop_end:
    # Epilogue 
	lw t0 0(sp)
	lw t1 4(sp)
	lw t2 8(sp)
	lw t3 12(sp)
	lw t4 16(sp)   
	addi sp sp 20
	ret
