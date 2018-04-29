.data
	.balign 4			/* Align bytes to 4 bytes */
	scanType: .asciz "%d"		/* scanType variable to store the type of input, CONST */
	output: .asciz "%d\n"		/* output variable to store the type of output, CONST */
	
.text
	.balign 4
	addr_scanType: .word scanType	/* Address declaration for scanType */
	addr_output: .word output	/* Address declaration for output */
	.global main			/* Main delcaration */

main:
	push {lr}			/* Pushes Link Register to stack */
	
	mov r9, #0			/* Prep r9 for sum */
	mov r8, #0			/* Prep counter variable */

getInput:				/* getInput label */
	cmp r8, #5			/* Compare r8 to constant value of 5 */
	beq done			/* Branch to done label if equal */

	sub sp, sp, #4			/* Allocate space in stack for integer read */
	ldr r0, =scanType		/* Load scanType into r0 */
	mov r1, sp			/* Move stack pointer to r1 */
	bl scanf			/* scanf function call */
	ldr r4, [sp]			/* Load r4 with value read and stored in stack */
	add sp, sp, #4			/* Restore the stack */

	add r9, r9, r4			/* Add value to sum */
	add r8, r8, #1			/* Increment counter by 1 */

	b getInput			/* Break to getInput label */

done:
	ldr r0, =output			/* Load r0 with output type */
	mov r1, r9			/* Move sum to r1 for printf */
	bl printf			/* printf function call */

	pop {pc}			/* Pop program counter from stack */
