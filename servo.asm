	    Mov TMOD,#10H
again:	Mov TH1,#0FAH
		Mov TL1,#24H
		clr TF1		  //     Port P1.0 is ON for 1.5 ms
		setb TR1
		setb P2.7	
loop:   JNB TF1,loop
		clr TR1
		clr TF1

		Mov TH1,#0B7H
		Mov TL1,#0BBH
		clr TF1
		setb TR1
		clr P2.7	  //  Port P1.0 is OFF for 18 ms
loop1:  JNB TF1,loop1
		clr TR1
		clr TF1
		sjmp again
	    end