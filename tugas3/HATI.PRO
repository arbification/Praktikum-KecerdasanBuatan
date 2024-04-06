domains
penyakit = string
gejala = symbol
query = string
jawab = char
database
dbmengalami(gejala)
dbtdkmengalami(gejala)
predicates
penyebab(penyakit)
go
mengalami(query,gejala)
tdkmengalami(query,gejala)
gejala(gejala)
clear_fakta2
simpan(gejala,jawab)
tanya(query,gejala,jawab)
go_once
diagnosa(penyakit)
solusi(penyakit)
goal
clearwindow,
makewindow(1,7,7," DIAGNOSA PENYAKIT HATI ",0,0,24,80),
go,
removewindow.
clauses
go:-
go_once,nl,nl,nl,nl,nl,
write("Ingin mengulangi diagnosa lagi (y/t) ?"),
readchar(Jawab),nl,
clearwindow,
Jawab = 'y',
go.
go_once:-
diagnosa(_),!,
save("test.dat"),
clear_fakta2.
go_once:-
write("Selamat anda orang baik"),nl,
clear_fakta2.
mengalami(_,Gejala):-
dbmengalami(Gejala),!.
mengalami(Query,Gejala):-
not(dbtdkmengalami(Gejala)),
tanya(Query,Gejala,Jawab),
Jawab='y'.
tdkmengalami(_,Gejala):-
dbtdkmengalami(Gejala),!.
tdkmengalami(Query,Gejala):-
not(dbmengalami(Gejala)),
tanya(Query,Gejala,Jawab),
Jawab='t'.
tanya(Query,Gejala,Jawab):-
write(Query),
readchar(Jawab),
write(Jawab),nl,
simpan(Gejala,Jawab).
simpan(Gejala,'y'):-
asserta(dbmengalami(Gejala)).
simpan(Gejala,'t'):-
asserta(dbtdkmengalami(Gejala)).
clear_fakta2:-
retract(dbmengalami(_)),fail.
clear_fakta2:-
retract(dbtdkmengalami(_)),fail.
clear_fakta2.
/*------------gejala-----------*/
gejala(Gejala):-
dbmengalami(Gejala),!.
gejala(Gejala):-
dbtdkmengalami(Gejala),!,fail.

gejala(gacha):-
mengalami("Suka pamer hasil gacha jika laksek? (y/t) ",gacha).
gejala(tetangga):-
mengalami("Anda tidak suka tetangga anda sukses? (y/t) ",tetangga).
gejala(kabur):-
mengalami("Sering sengaja tidak membaca Whatsapp ketika dimintai tolong? (y/t) ",kabur).
gejala(marah):-
mengalami("Suka menghina orang tua player mobile legend yang badplay? (y/t) ",marah).
gejala(ghibah):-
mengalami("Apakah anda suka membicarakan teman anda yang menjengkelkan? (y/t) ",ghibah).
gejala(songong):-
mengalami("menghindari teman yang dianggap tidak satu level dengan dirimu? (y/t) ",songong).
gejala(menyalahkan):-
mengalami("Menyalahkan orang tua atau teman atas kondisi saat ini? (y/t) ",menyalahkan).
gejala(ujub):-
mengalami("Merasa tampan/cantik dan terus mengagumi kecantikan atau ketampanannya tersebut? (y/t) ",ujub).
gejala(pamer):-
mengalami("Tidak bisa berhenti pamer kekayaan orang tua di medsos? (y/t) ",pamer).


/* --------------------diagnosa------------------ */
diagnosa("Paket lengkap, semoga cepat mendapat hidayah"):-
gejala(gacha),
gejala(tetangga),
gejala(kabur),
gejala(marah),
gejala(ghibah),
gejala(songong),
gejala (menyalahkan),
gejala (ujub),
gejala (pamer),
penyebab("Paket lengkap, semoga cepat mendapat hidayah").
diagnosa("Iri Dengki, Sombong, Pemarah, Ghibah, Bangga Diri"):-
gejala(tetangga),
gejala(kabur),
gejala(marah),
gejala(ghibah),
gejala(songong),
gejala (menyalahkan),
gejala (ujub),
penyebab("Iri Dengki, Sombong, Pemarah, Ghibah, Bangga Diri").
diagnosa("Iri Dengki, Sombong, Pemarah, dan Ghibah"):-
gejala(tetangga),
gejala(kabur),
gejala(marah),
gejala(ghibah),
gejala(songong),
gejala (menyalahkan),
penyebab("Iri Dengki, Sombong, Pemarah, Ghibah").
diagnosa("Iri Dengki, Sombong, dan Pemarah"):-
gejala(tetangga),
gejala(kabur),
gejala(marah),
gejala(songong),
penyebab("Iri Dengki, Sombong, dan Pemarah").
diagnosa("Iri Dengki dan Sombong"):-
gejala(tetangga),
gejala(songong),
penyebab("Iri Dengki dan Sombong").
diagnosa("Iri Dengki dan Pemarah"):-
gejala(tetangga),
gejala(marah),
penyebab("Iri Dengki dan Pemarah").
diagnosa("Iri Dengki dan Ghibah"):-
gejala(tetangga),
gejala(ghibah),
penyebab("Iri Dengki dan Ghibah").
diagnosa("Iri Dengki dan Bangga Diri"):-
gejala(tetangga),
gejala(ujub),
penyebab("Iri Dengki dan Bangga Diri").
diagnosa("Iri Dengki dan Riya"):-
gejala(gacha),
gejala(pamer),
gejala(tetangga),
penyebab("Iri Dengki dan Riya").
diagnosa("Sombong dan Pemarah"):-
gejala(songong),
gejala(marah),
penyebab("Sombong dan Pemarah").
diagnosa("Iri Dengki"):-
gejala(tetangga),
penyebab("Iri Dengki").
diagnosa("Takabur/Sombong"):-
gejala(songong),
penyebab("Takabur/Sombong").
diagnosa("Takabur/Sombong"):-
gejala(kabur),
penyebab("Takabur/Sombong").
diagnosa("Ghadab/Pemarah"):-
gejala(marah),
penyebab("Ghadab/Pemarah").
diagnosa("Ghibah/Bergunjing"):-
gejala(ghibah),
penyebab("Ghibah/Bergunjing").
diagnosa("Ujub/Bangga Diri"):-
gejala(ujub),
penyebab("Ujub/Bangga Diri").
diagnosa("Riya/Pamer"):-
gejala(gacha),
penyebab("Riya/Pamer").
diagnosa("Riya/Pamer"):-
gejala(pamer),
penyebab("Riya/Pamer").
penyebab("Paket lengkap, semoga cepat mendapat hidayah"):-
solusi("Paket lengkap, semoga cepat mendapat hidayah").
penyebab("Iri Dengki, Sombong, Pemarah, Ghibah, Bangga Diri"):-
solusi("Iri Dengki, Sombong, Pemarah, Ghibah, Bangga Diri").
penyebab("Iri Dengki, Sombong, Pemarah, Ghibah"):-
solusi("Iri Dengki, Sombong, Pemarah, Ghibah").
penyebab("Iri Dengki"):-
solusi("Iri Dengki").
penyebab("Takabur/Sombong"):-
solusi("Takabur/Sombong").
penyebab("Ghadab/Pemarah"):-
gejala(menyalahkan),
solusi("Ghadab/Pemarah").
penyebab("Ghibah/Begunjing"):-
solusi("Ghibah/Begunjing").
penyebab("Ujub/Bangga Diri"):-
solusi("Ujub/Bangga Diri").
penyebab("Riya/Pamer"):-
solusi("Riya/Pamer").
solusi(Penyakit):-
    nl, nl, nl,
    write(" Anda mengalami penyakit Hati ", Penyakit),
    nl.
