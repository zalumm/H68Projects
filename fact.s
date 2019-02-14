	ORG	$7000

*	int fact(int n){
*		if( n < 2)
*			return 1;
*		return n*fact(n-1)
*	}
*
*	ints 16bits
*	pointers 32 bits


fact:	
	link	A6,#0
	movem.l	D1-D3/A1,-(SP)
	move.w	8(A6),D1

	*setup memoization
	move.w	D1,D3
	lea	mem,A1
	mulu	#2,D3
	adda	D3,A1
	cmpi.w	#0,(A1)
	beq	calc
	move.w	(A1),D0
	bra	teardwn

calc:	*body

	cmpi.w	#2,D1
	BLT	ret1	*D1 < 2
	*calculate result
	subi.w	#1,D1

	*CALL SUBROUTINE
	move.w	D1,-(SP)
	jsr	fact
	adda.l	#2,SP
	addi.w	#1,D1 *calculate n*fact(n-1)
	muls	D1,D0

	
	bra	save

ret1:	move.w	#1,D0

save:
	move.w	D0,(A1)
	


teardwn:movem.l	(SP)+,D1-D3/A1
	unlk	A6
	rts


mem:	dcb.w	10,0	*cannot calculate more than 10 values
	




	end



