; function stage1b_max
; returns the maximum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1b_max:
        cmp r0, r1
	blt .if_lt
	bgt .if_gt
	beq .if_eq

.if_lt:
	mov r0, r1
	mov r1, r2
	cmp r0, r1
	bge .return
	b stage1b_max

.if_eq: 
	cmp r0, r2
	bge .return
	b stage1b_max

.if_gt:
	cmp r0,r2
	bge .return
	b stage1b_max

.return:
        bx lr
