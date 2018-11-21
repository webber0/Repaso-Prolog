happy(yolanda).
listen2Music(mia).
listen2Music(yolanda):- happy(yolanda).
playsAirGitar(mia):- listen2Music(mia).
playsAirGitar(yolanda):- listen2Music(yolanda).

loves(vincent,mia).
loves(marsellus,mia).
loves(pumpkin,honey_bunny).
loves(honey_bunny,pumpkin).
% Segun el ejercicio, el concepto de "Celos" es que "X" y "Z" esten
% enamorados de la misma persona
jealous(X,Y):-loves(X,Z), loves(Y,Z),dif(X,Y),dif(X,Z).

%Ejercicio 1.4 de la pagina de Prolog
killer(butch).
married(marsellus,mia).
dead(zed).
footmassage(mia).
miaLoves(Y):-goodDancer(Y).
willKillMe(X):-footmassage(X).
goodDancer(bucky).
goodDancer(adele).

%Ejercicio 1.5 de la pagina de Prolog
wizard(ron).
wizard(X):-hasBroom(X),hasWand(X).
hasWand(harry).
quidditchPlayer(harry).
hasBroom(X):- quidditchPlayer(X).

%Ejercicio 2.2 de la pagina de Prolog
house_elf(dobby).
witch(hermione).
witch('McGonagall').
witch(rita_skeeter).
magic(X):- house_elf(X).
magic(X):-wizard(X).
magic(X):-witch(X).

%Ejercicio 2.3 de la pagina de Prolog
word(determiner,a).
word(determiner,every).
word(noun,criminal).
word(noun,'big kahuna burger').
word(verb,eats).
word(verb,likes).
sentence(Word1,Word2,Word3,Word4,Word5):-
   word(determiner,Word1),
   word(noun,Word2),
   word(verb,Word3),
   word(determiner,Word4),
   word(noun,Word5).
%Ejemplo de Recursividad
is_digesting(X,Y):- just_ate(X,Y).
is_digesting(X,Y):- just_ate(X,Z),is_digesting(Z,Y).

just_ate(mosquito,blood(jonh)).
just_ate(frog,mosquito).
just_ate(stork,frog).

%Arbol Descendiente de una  linea familiar femenina
child(anne,bridget).
child(bridget,caroline).
child(caroline,donna).
child(donna,emily).

descend(X,Y):-child(X,Y).
descend(X,Y):-child(X,Z),descend(Z,Y),!.

%Ejercicio de las muniecas Matryoshka de la pagina de Prolog.
muneca(katarina,olga).
muneca(olga,natasha).
muneca(natasha,irina).

esta_contenida(X,Y):-muneca(X,Y).
esta_contenida(X,Y):-muneca(X,Z),esta_contenida(Z,Y).

%Ejercicio de los trenes de la pagina de Prolog.
directTrain(saarbruecken,dudweiler).
directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(stAvold,freyming).
directTrain(fahlquemont,stAvold).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

travelToFrom(X,Y):-directTrain(X,Y).
travelToFrom(X,Y):-directTrain(X,Z),travelToFrom(Z,Y).
%Ejemplo de Recursividad y Listas
nombres([john, diego,fernando]).
miembro(X,[X|_]).
miembro(X,[_|T]):- miembro(X,T).
