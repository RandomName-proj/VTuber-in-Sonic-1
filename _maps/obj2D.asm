burromap:
burromap_0: 	dc.w burromap_12-burromap
burromap_2: 	dc.w burromap_1D-burromap
burromap_4: 	dc.w burromap_28-burromap
burromap_6: 	dc.w burromap_33-burromap
burromap_8: 	dc.w burromap_3E-burromap
burromap_A: 	dc.w burromap_49-burromap
burromap_C: 	dc.w burromap_54-burromap
burromap_E: 	dc.w burromap_5F-burromap
burromap_10: 	dc.w burromap_65-burromap
burromap_12: 	dc.b $2
	dc.b $EC, $A, $0, $0, $F0
	dc.b $4, $9, $0, $9, $F4
burromap_1D: 	dc.b $2
	dc.b $EC, $A, $0, $F, $F0
	dc.b $4, $9, $0, $18, $F4
burromap_28: 	dc.b $2
	dc.b $E8, $A, $0, $1E, $F4
	dc.b $0, $A, $0, $27, $F4
burromap_33: 	dc.b $2
	dc.b $E8, $A, $0, $30, $F4
	dc.b $0, $A, $0, $39, $F4
burromap_3E: 	dc.b $2
	dc.b $E8, $A, $0, $F, $F0
	dc.b $0, $A, $0, $42, $F4
burromap_49: 	dc.b $2
	dc.b $F4, $6, $0, $4B, $E8
	dc.b $F4, $A, $0, $51, $F8
burromap_54: 	dc.b $2
	dc.b $EC, $A, $0, $F, $F0
	dc.b $4, $9, $0, $9, $F4
burromap_5F: 	dc.b $1
	dc.b $E8, $A, $0, $30, $F4
burromap_65: 	dc.b $1
	dc.b $E8, $A, $0, $1E, $F4
	even