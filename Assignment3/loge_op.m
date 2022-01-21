cir = imread('cir.png');
cir = im2bw(cir);
rec = imread('rec.png');
rec = im2bw(rec);

Or = cir | rec;
And = cir & rec;
Nor = ~Or;
Nand = ~And;
Xor = xor(cir,rec);
Xnor = ~Xor;

subplot(2,4,1), imshow(cir), title('Circle')
subplot(2,4,2), imshow(rec), title('Rectangle')
subplot(2,4,3), imshow(Or), title('Logical OR')
subplot(2,4,4), imshow(And), title('Logical AND')
subplot(2,4,5), imshow(Nor), title('Logical NOR')
subplot(2,4,6), imshow(Nand), title('Logical NAND')
subplot(2,4,7), imshow(Xor), title('Logical XOR')
subplot(2,4,8), imshow(Xnor), title('Logical XNOR')