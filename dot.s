.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 is the pointer to the start of v0
#   a1 is the pointer to the start of v1
#   a2 is the length of the vectors
#   a3 is the stride of v0
#   a4 is the stride of v1
# Returns:
#   a0 is the dot product of v0 and v1
# =======================================================
dot:

    # Prologue
	li t0 0
	li t1 0
	li t2 0
	li t3 0
	li t4 0
	li t5 0
	li t6 0
loop_start:

	mul t0 t4 a3
    mul t1 t4 a4
    
    add t2 t5 t0
    add t3 t5 t1
    
    add t2 t2 a0
    lw t2 0(t2)
    add t3 t3 a1
    lw t3 0(t3)
    
	beq t0 a2 loop_end

	addi t4 t4 1
    addi t5 t5 4
    
	mul t2 t2 t3
	add t6 t6 t2
	j loop_start


loop_end:

    # Epilogue
	mv a0 t6
	ret
