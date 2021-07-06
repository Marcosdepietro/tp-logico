%Enunciado
/*Armar un programa Prolog que resuelva el siguiente problema lógico:

Quien mata es porque odia a su víctima y no es más rico que ella. Además, quien mata debe vivir en la mansión Dreadbury.
Tía Agatha, el mayordomo y Charles son las únicas personas que viven en la mansión Dreadbury.
Charles odia a todas las personas de la mansión que no son odiadas por la tía Agatha.
Agatha odia a todos los que viven en la mansión, excepto al mayordomo.
Quien no es odiado por el mayordomo y vive en la mansión, es más rico que tía Agatha
El mayordomo odia a las mismas personas que odia tía Agatha.*/


/* 
1

El programa debe resolver el problema de quién mató a la tía Agatha. 
Mostrar la consulta utilizada y la respuesta obtenida.*/

% Base de conocimentos

viveEnLaMansion(agatha).
viveEnLaMansion(mayordomo).
viveEnLaMansion(charles).

%Hechos y reglas

odia(agatha,Victima):-
    viveEnLaMansion(Victima),
    Victima\=mayordomo.

odia(mayordomo,Victima):-
    odia(agatha,Victima).

odia(charles,Victima):-
    viveEnLaMansion(Victima),
    not(odia(agatha,Victima)).

masRicoQue(Victima,agatha):-
    viveEnLaMansion(Victima),
    not(odia(mayordomo,Victima)).
   
mata(Persona,Victima):-
    viveEnLaMansion(Persona),
    odia(Persona,Victima),
    not(masRicoQue(Persona,Victima)).
/*
mata(Persona,agatha).
Persona = agatha ;
false. 
*/

/*
2

Agregar los mínimos hechos y reglas necesarios para poder consultar:

- Si existe alguien que odie a milhouse.
odia(_,milhouse). ¿Existe alguien que odie a milhouse? Por consola muestra:false
odia(Persona,milhouse).Por consola muestra:false ,ya que milhouse no vive en la mansion por lo tanto nadie lo puede odiar


- A quién odia charles.
odia(charles,Persona).

Persona = mayordomo ;
false.

- El nombre de quien odia a tía Ágatha.
odia(agatha,Persona).    
Persona = agatha ;
Persona = charles.


- Todos los odiadores y sus odiados.
odia(Persona,Victima).
Persona = Victima, Victima = agatha ;
Persona = agatha,
Victima = charles ;
Persona = mayordomo,
Victima = agatha ;
Persona = mayordomo,
Victima = charles ; 
Persona = charles,  
Victima = mayordomo ;
false. 

- Si es cierto que el mayordomo odia a alguien.
odia(mayordomo,_).
true .

Mostrar las consultas utilizadas para conseguir lo anterior, junto con las respuestas obtenidas.

 */

