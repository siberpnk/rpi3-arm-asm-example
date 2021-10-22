; function stage1a_min
; returns the minimum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1a_min:
	cmp r0, r1
	blt .if_lt
	bgt .if_gt_OR_eq
	beq .if_gt_OR_eq

.if_lt:
	mov r0, r1
	mov r1, r2
	cmp r0, r1
	ble .return
	b stage1a_min

.if_gt_OR_eq:
	cmp r0, r2
	ble stage1a_min	

.return:
        bx lr
