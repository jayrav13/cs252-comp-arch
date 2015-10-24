/*	charpos Implementation
	CS 252, Homework 3
	Jay H. Ravaliya 
*/

.global charpos
.text


charpos:
	stmfd	sp!, {v1-v6, lr}	/* set up parameters */
	mov	a3, #0			/* move value 0 to a3 */

elop:	
	ldrb	a4, [a1], #1		/* go to next character */
	cmp	a4, #0			/* compare to 0 */
	beq	nfnd			/* if 0, go to not found branch */
	cmp	a4, a2			/* compare to lookfor */
	addne	a3, a3, #1		/* increment 1 to counter */
	beq	fnd			/* if equal, go to found branch */
	bne	elop			/* if not equal, loop */

fnd:					/* found branch	*/
	mov	a1, a3			/* move counter to a1 */
	b	fin			/* go to finish branch */

nfnd:					/* not found branch */
	mov	a1, #-1			/* move -1 to a1 */
	b	fin			/* go to finish branch */

fin:	ldmfd	sp!, {v1-v6, pc}	/* return to C code */
