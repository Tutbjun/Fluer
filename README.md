# Fluer

Del 1:
Hvad er forskellen på de tre programmer?
    Program 1 tegner én flue uden bevægelse, program 2 tegner én flue med bevægelse og program tegner flere fluer med bevægelser.

Start Flue1: Tryk fire gange på skærmen, hvor mange objekter tegnes nu hvert frame og hvorfor?
    I programmet overskriver man det første objekt ved at køre dets constructer flere gange, og derfor vil der kun blive tegnet et enkelt objekt (i koden; f). Det ser dog ud som flere, fordi gamle tegninger ikke bliver fjernet.

Start Flue2move: Tryk fire gange på skærmen, hvor mange objekter bevæges nu hvert frame og hvorfor?
    Det samme antal af samme grund. Nu bevæger det ene eksisterende objekt sig bare.

Hvis du fjerner pushMatrix og popMatrix i de tre programmer, har det så nogen betydning og hvorfor?
    I program 1 og 2; nej. Der er alligevel en slags push/popMatrix omkring draw-løkken, og når der kun bliver tegnet et enkelt objekt, så har det ingen betydning. I program 3 vil det dog betydde, at hvert objekts position og rotation vil være ift. det tidligere objekt, og derfor vil det have en stor betydning.

I Flue3moveAll bruges ArrayList. Nævn nogle vigtige forskelle på ArrayList og almindelige arrays?
    Et almindeligt array har fx en konstant længde, som bliver defineret i dens constructer
    En liste har derimod en variabel længde, som kan ændres ved at sætte en værdi ind på en given plads eller ved at fjerne en plads (og værdien)


Del 2:
Skriv kommentarer i koden, så det er muligt at læse hvad der sker 
    Har gjort det kun i fluekode 3, fordi 1 og 2 har de samme elementer som 3 (næsten)

Udtænk en konstruktør, der modtager størrelsen på fluen som argument. Brug processing funktionen "scale" til at ændre fluens størrelse.
    Se kode 3

Hvis man trykker på tasten "e", skal der nu indsættes store fluer
    Se kode 3

Når fluerne når kanten af skærmen skal de vende om
    Har ændret distanceFlyttet variablen til en 2d hastighedsvektor
    Ellers se kode 3
    
Del 3:
  Ville gerne lave det, men har ikke tid...
