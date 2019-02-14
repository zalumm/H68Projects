ORG	$7000
	
findmin:	
	link	A6,#0
	movem.l	D1/A1,-(SP)
	move.w	8(A6),D1		*B
	move.l	10(A6),A1		*A
	
	cmpi.w	#1,D1
	beq	ret1

	move.l	D1,D2
	move.l	A1,A2
	
	adda.l  #2,A2
	subi.w	#1,D2	
	
		

	move.l	A2,-(SP)
	move.w  D2,-(SP)
	JSR     findmin
	adda.l  #6,SP

fBIG:
	cmp.l  (A1),D0    ** D0 > (a1) RETURN a0  ELSE return a0 : return them into Adda #2
	bgt	dSmal
**else
	bra	aSmal
	
aSmal:	
	move.l	(A1),D0
	*adda.l	#2,A1
	move.l	D0,(A1)
	bra	teardwn	
	

dSmal:	
	*adda.l	#2,A1
	move.l	D0,(A1)
	
	bra	teardwn
	
ret1:
	
	move.l  (A1),D0
	
			
teardwn:	
	movem.l	(SP)+,D1/A1
	unlk	A6
	rts