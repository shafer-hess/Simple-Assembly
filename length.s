.data
	.balign 4			/* Align bytes to 4 bytes */
	scanType: .asciz "%s"		/* scanType variable to store type of input, CONST */
	output: .asciz "%d\n"		/* output variable to declare output type, CONST */
	//string: .byte 100		/* Where scanf will store input */
	string: .asciz ""
	strLen: .word 0

.text
	.balign 4
	addr_scanType: .word scanType	/* Address declaration for scanType */
	addr_output: .word output	/* Address declaration for output */
	addr_string: .word string	/* Address declaration for string */	
	addr_strLen: .word strLen
	.global main			/* Main declaration */

main:
	push {lr}			/* Pushes Link Register to stack */
	sub sp, sp, #100		/* Allocate space in stack for string input */
	
	ldr r0, =scanType		/* Specifies scanf type */
	ldr r1, =string			/* Stores user input in address of string */
	bl scanf			/* scanf function call */

	add sp, sp, #100		/* Restores stack */
	
	ldr r4, =string			/* Load r4 with the address of user input  */
	ldrb r5,[r4]			/* Load r5 with the current character at r4 */
	
	mov r6, #0			/* Prep r6 counter register with zero value */

calcLen:				/* Length calulation label */
	cmp r5, #0			/* Compare character in r5 to NULL terminating */
	beq done			/* Branch to done label if equal */
	
	add r4, r4, #1			/* Increment address of r4 to next character */
	ldrb r5, [r4]			/* Load next character of input into r5 */
	add r6, r6, #1			/* Increment word length counter by 1 */
	
	b calcLen			/* Branch to beginning of length calculation */

done:					/* Done label */
	ldr r0, =output			/* Prep printf with output type */
	mov r1, r6			/* Move string length to r1 for output */
	bl printf			/* Print string lenght*/

	pop {pc}			/* Pop program counter from stack */
