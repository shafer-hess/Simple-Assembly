.data
	.balign 4			/* Align bytes to 4 bytes */
	scanType: .asciz "%d"		/* scanType variable to store type of input, CONST */
	output: .asciz "%d\n"		/* output variable to declare output type, CONST */

.text
	.balign 4			/* Align bytes to 4 bytes */ 
	addr_scanType: .word scanType	/* Address declaration for scanType */
	addr_output: .word output	/* Address declaration for output */

	.global main			/* Main declaration */		
	
main:
	push {lr}			/* Pushes Link Register address to stack */
	sub sp, sp, #8			/* Allocate space in stack for 2 scanf calls */
	
	ldr r0, addr_scanType		/* Specifies scanf type */
	mov r1, sp			/* Moves stack address to r1 */
	bl scanf			/* scanf function call */
	ldr r4, [sp]			/* Load r4 with user input in stack */
	
	ldr r0, addr_scanType		/* Specifies scanf type */
	mov r1, sp			/* Moves stack address to r1 */
	bl scanf			/* scanf function call */
	ldr r5, [sp]			/* Load r5 with user input in stack */

	add sp, sp, #8			/* Restore Stack after scanning */

	cmp r4, r5			/* Compare r4 and r5 */
	bgt greaterThan			/* Branch to greaterThan if r4 > r5 */
	blt lessThan			/* Branch to lessThan if r4 < r5 */

greaterThan:				/* greaterThan label */
	ldr r0, =output			/* Specifies Output type (%d) */
	mov r1, r4			/* Loads parameter for output */
	bl printf			/* Prints r4 if greater */
	b out				/* Breaks to end of function */

lessThan:				/* lessThan label */
	ldr r0, =output			/* Specifies Output type (%d) */
	mov r1, r5			/* Loads parameter for output */
	bl printf			/* Prints r5 if lesser */
	b out				/* Breaks to end of function */

out:					/* out label */	
	pop {pc}			/*Pops program counter out of stack */
