%Punto 1 y 2
%clausulas
entrada(paella).
entrada(gazpacho).
entrada(consomé).

carne(filete_de_cerdo).
carne(pollo_asado).

pescado(trucha).
pescado(bacalao).

postre(flan).
postre(helado).
postre(pastel).

bebida(agua_mineral).
bebida(cerveza).
bebida(vino).

menu(X,Y,Z,W):- entrada(X),carne(Y),postre(Z),bebida(W).
menu(X,Y,Z,W):- entrada(X),pescado(Y),postre(Z),bebida(W).
menuSinFlan(X,Y,Z,W):-entrada(X),carne(Y),postre(Z),dif(Z,flan),bebida(W).
menuSinFlan(X,Y,Z,W):-entrada(X),pescado(Y),postre(Z),dif(Z,flan),bebida(W).

%Parentesco (punto 3)
hombre(pedro) .
hombre(manuel) .
hombre(arturo) .
mujer(maría).
mujer(sabrina).
padre(pedro, manuel).
padre(pedro, arturo).
padre(pedro, maría) .
padre(pedro,sabrina).

niño(X,Y):-padre(Y,X),dif(X,Y).
hijo(X,Y):-padre(Y,X),hombre(X),dif(X,Y).
hija(X,Y):-padre(Y,X),mujer(X),dif(X,Y).
hermano_o_hermana(X,Y):-padre(_,X),padre(_,Y),dif(X,Y).
hermano(X,Y):- hermano_o_hermana(X,Y),hombre(Y),hombre(X),dif(X,Y).
hemana(X,Y):-hermano_o_hermana(X,Y),mujer(X),mujer(Y),dif(X,Y).

%Punto 4
transporte(roma,20).
transporte(londres,30).
transporte(tunez,10).

alojamiento(roma,hotel,50).
alojamiento(roma,hostal,30).
alojamiento(roma,camping,10).
alojamiento(londres,hotel,60).
alojamiento(londres,hostal,40).
alojamiento(londres,camping,20).
alojamiento(tunez,hotel,40).
alojamiento(tunez,hostal,20).
alojamiento(tunez,camping,5).


viaje(C,S,H,P):- transporte(C,Z),alojamiento(C,H,W),precio(P,Z,S,W).
precio(P,Z,S,W):- P is Z+(S*W).
viajeEconomico(C,S,H,P,Pmax):-transporte(C,Z),alojamiento(C,H,W),precio(P,Z,S,W),menor(P,Pmax).
%sumar(S,X,Y):- S is X+Y.
menor(X,Y):- X<Y.

%Punto 4 bis version 1

parcial1(ana,7).
parcial1(juan,2).
parcial1(pedro,6).
parcial1(luisa,2).

parcial2(ana,8).
parcial2(juan,2).
parcial2(pedro,5).
parcial2(luisa,7).

%Rastreo para el parcial
triangulo(1,2).
triangulo(3,2).
cuadrado(5).
cuadrado(6).
rectangulo(1,3).
rectangulo(1,2).
circulo(2).
circulo(4).

area(triangulo,A):-triangulo(B,H),A is (B*H)/2.
area(cuadrado,A):-cuadrado(L),A is L*L.
area(rectangulo,A):-rectangulo(B,H),A is B*H.
area(circulo,A):-circulo(R),A is (R*R)*3.14.

prod(F1,A1,F2,A2):-area(F1,A1),area(F2,A2),A1<A2.
proyeccion(F,A):-prod(F,A,_,_).
max(F,A):-area(F,A),not(proyeccion(F,A)).

%Recursivididad
fibonacci(0,0).
fibonacci(1,1).
fibonacci(2,1).
fibonacci(3,2).
fibonacci(X,Y):-X1 is X-1, X2 is X-2,fibonacci(X1,Y1),fibonacci(X2,Y2), Y is Y1+Y2.
gauss(0,0).
gauss(1,1).
gauss(2,3).
gauss(X,Y):-X1 is X-1,gauss(X1,Y1),Y is X+Y1.

factorial(0,1).
factorial(1,1).
factorial(X,Y):-X1 is X-1, factorial(X1,Y1),Y is Y1*X.

multiplicacion(0,_,0).
multiplicacion(_,0,0).
multiplicacion(1,A,A).
multiplicacion(A,1,A).
multiplicacion(A,B,C):-B1 is B-1, multiplicacion(A,B1,C1),C is A+C1.

%pow(A,1,A).
%pow(1,_,1).
%pow(A,B,C):-B1 is B-1,pow(A,B1,C1),C is A*C1.

mcd(1,1,1):-!.
mcd(0,0,0):-!.
mcd(X,Y,Z):-X=:=Y,Z is X,!.
mcd(X,Y,Z):-X>Y,X1 is X-Y,mcd(X1,Y,Z1), Z is Z1.
mcd(X,Y,Z):-X<Y,X1 is Y-X,mcd(X1,X,Z1), Z is Z1.

divide(_,0,0,'Error').
divide(A,1,0,A).
divide(A,A,0,1).
divide(A,B,0,D):-A<B, D is mod(A,B).
divide(A,B,C,D):-A>=B, A1 is A-B,divide(A1,B,C1,D),C is C1+1.

%Practica 2021

%Dado una cantidad de paises y sus superficies,
%buscar el pais de mayor superficie

%Paises y sus superficies -numeros ficticios-
pais(argentina,45).
pais(brasil,120). %claramente, este es el resultado que espero
pais(chile,20).
pais(paraguay,30).

%a bit of Relational Algebra
%Hago un producto cartesiano
producto_cartesiano(S1,S2):-pais(_,S1),pais(_,S2).
%Busco todos los menores a algo
los_menores(S1):-producto_cartesiano(S1,S2), S1<S2.
%Obtengo el mayor de todos
maxima_superficie(S):-pais(_,S),not(los_menores(S)).
%Hago un join para saber a que pais corresponde
descubrir_pais(P,S):-maxima_superficie(S),pais(P,S).
