module FA (Sum, Cout, A, B, Cin);

   input A;
   input B;
   input Cin;   

   output Sum;
   output Cout;

	wire	w1;
	wire	w2;
	wire	w3;
	wire	w4;

	xor	x1(w1, A, B);
	xor	x2(Sum, w1, Cin);

   //Sum = A ⊕ B ⊕ Cin

	nand    n1(w2, A, B);
	nand    n2(w3, A, Cin);
	nand	n3(w4, B, Cin);
	nand	n4(Cout, w2, w3, w4);
   //Cout = (A & B) | (A & Cin) | (B & Cin)

endmodule // FA