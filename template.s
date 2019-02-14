*----------------------------------------------------------------------
* Programmer: 
* Class Account: 
* Assignment or Title: 
* Filename: 
* Date completed:  
*----------------------------------------------------------------------
* Problem statement:
* Input: 
* Output: 
* Error conditions tested: 
* Included files: 
* Method and/or pseudocode: 
* References: 
*----------------------------------------------------------------------
*
        ORG     $0
        DC.L    $3000           * Stack pointer value after a reset
        DC.L    start           * Program counter value after a reset
        ORG     $3000           * Start at location 3000 Hex
*
*----------------------------------------------------------------------
*
#minclude /home/cs/faculty/cs237/bsvc/macros/iomacs.s
#minclude /home/cs/faculty/cs237/bsvc/macros/evtmacs.s
*
*----------------------------------------------------------------------
*
* Register use
*
*----------------------------------------------------------------------
*


fact:	EQU	$7000


start:  initIO                  * Initialize (required for I/O)
	setEVT			* Error handling routines
*	initF			* For floating point macros only	


	//lineout	PROMPT
	linein	buff
	cvta2	buff,D0

	move.l	D0,D1
	move.w	D1,-(SP)
	jsr	fact
	adda.l	#2,SP

	dump	D0


        break                   * Terminate execution
*
*----------------------------------------------------------------------
*       Storage declarations

PROMPT:	dc.b	'Enter a number',0
buff:	ds.b	80

        end