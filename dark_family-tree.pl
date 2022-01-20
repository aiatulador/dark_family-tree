/*facts*/

/* Kahnwald */

male(daniel_kahnwald).
female(ines_kahnwald).
male(sebastian_kruger).
male(michael_kahnwald).
female(hannah_kahnwald).
male(jonas_kahnwald).

father(daniel_kahnwald,ines_kahnwald).
father(sebastian_kruger,hannah_kahnwald).
mother(hannah_kahnwald,michael_kahnwald).
father(michael_kahnwald,jonas_kahnwald).

/*nielsen*/


father(noah,tronte_nielsen).
mather(agnes_nielsen,tronte_nielsen).

father(tronte_nielsen,mads_nielsen).
father(tronte_nielsen,ulrich_nielsen).
mother(jana_nielsen,mads_nielsen).
mother(jana_nielsen,ulrich_nielsen).

father(ulrich_nielsen,magnus_nielsen).
father(ulrich_nielsen,martha_nielsen).
father(ulrich_nielsen,mikkel_nielsen).

mother(katharina_nielsen,magnus_nielsen).
mother(katharina_nielsen,martha_nielsen).
mother(katharina_nielsen,mikkel_nielsen).

/* tiedemann */

father(egon_tiedemann,claudia_tiedemann).
mother(doris_tiedemann,claudia_tiedemann).

mother(claudia_tiedemann,regina_tiedemann).

father(boris_niewald,bartosz_tiedemann).
mother(regina_tiedemann,bartosz_tiedemann).


/* doppler */

father(bernd_doppler,helge_doppler).
mother(greta_doppler,helge_doppler).

father(helge_doppler,peter_doppler).

father(peter_doppler,franziska_doppler).
mother(charlotte_doppler,franziska_doppler).
father(peter_doppler,elisabeth_doppler).
mother(charlotte_doppler,elisabeth_doppler).


/* rule */

parent(X,Y):-mother(X,Y);father(X,Y).

brother(X,Y):-father(Z,X),father(Z,Y),mother(Z,X),mother(Z,Y),X\=Y.
sister(X,Y):-father(Z,X),father(Z,Y),mother(Z,X),mother(Z,Y),X\=Y.

sibling(X,Y):-parent(Z,X),parent(Z,Y),X\=Y.
sibling(Y,X):-parent(Z,X),parent(Z,Y),X\=Y.

grandparent(X,Y):-parent(X,Z),parent(Z,Y).

greatgrandparent(X,Y):-parent(X,P),parent(P,Z),parent(Z,Y).

greatgreatgrandparent(X,Y):-parent(A,Y),parent(B,A),parent(C,B),parent(X,C).

firstcousin(X,Y):-parent(Z,X),parent(W,Y),sibling(Z,W).

firstcousin(Y,X):-parent(Z,X),parent(W,Y),sibling(Z,W).

secondcousin(X,Y):-greatgrandparent(Z,X),greatgrandparent(Z,Y),\+firstcousin(X,Y),\+sibling(X,Y),X\=Y.
	
thirdcousin(X,Y):-greatgreatgrandparent(Z,X),greatgreatgrandparent(Z,Y),\+firstcousin(X,Y),\+secondcousin(X,Y),\+sibling(X,Y),X\=Y.