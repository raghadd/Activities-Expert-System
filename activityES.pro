PREDICATES
nondeterm activity(symbol)
nondeterm city(symbol)
nondeterm lists(char)
nondeterm service(symbol, symbol)
nondeterm activityList
nondeterm displayMenu
nondeterm citylist
nondeterm serviceList
nondeterm services(char)
nondeterm repeat
nondeterm activityCity(symbol, symbol).
nondeterm activityCityList(char).
nondeterm activityCityPrint(symbol).
nondeterm cityActivityPrint(symbol).


CLAUSES
activity(scubaDiving).
activity(surfing).
activity(hiking).
activity(desertBiking).
activity(skyDiving).
activity(starGazing).
activity(horseRiding).
activity(paragliding).

city(jeddah).
city(abha).
city(yanbu).
city(riyadh).
city(jizan).
city(taif).
city(madinah).
city(dammam).
city(farasan).

activityCity(scubaDiving, jeddah).
activityCity(scubaDiving, yanbu).
activityCity(scubaDiving, farasan).

activityCity(surfing, yanbu).
activityCity(surfing, farasan).

activityCity(hiking, jeddah).
activityCity(hiking, abha).
activityCity(hiking, taif).

activityCity(desertBiking, jeddah).
activityCity(desertBiking, madinah).
activityCity(desertBiking, yanbu).
activityCity(desertBiking, riyadh).
activityCity(desertBiking, dammam).
activityCity(desertBiking, jizan).

activityCity(skyDiving, dammam).
activityCity(skyDiving, riyadh).

activityCity(starGazing,madinah).
activityCity(starGazing,riyadh).
activityCity(starGazing,abha).
activityCity(starGazing,yanbu).
activityCity(starGazing,taif).
activityCity(starGazing, jizan).
activityCity(starGazing,jeddah).
activityCity(starGazing,farasan).

activityCity(horseRiding, jeddah).
activityCity(horseRiding, riyadh).
activityCity(horseRiding, taif).
activityCity(horseRiding,dammam).
activityCity(horseRiding,jizan).
activityCity(horseRiding,abha).
activityCity(horseRiding,yanbu).
activityCity(horseRiding, farasan).

activityCity(paragliding, jeddah).
activityCity(paragliding, abha).
activityCity(paragliding, dammam).
activityCity(paragliding, farasan).


service(scubaDiving, sale).
service(surfing, sale).
service(surfing,childCare).
service(hiking, childCare).
service(iceSkating, childCare).
service(desertBiking, childCare).
service(skyDiving, femaleGroup).
service(iceSkating,sale).
service(iceSkating, resident).



displayMenu :- 
repeat, nl, nl,
write("******************"),nl,
write("1- Activities\n2- City\n3- Services\n4- Done :)\n"),nl,
write("^ Select Number: "), readchar(X), write(X),nl,
lists(X),
displayMenu.

lists('1') :- % start based on activity
write("Activities: "), nl,
write("1- scubaDiving\n2- surfing\n3- hiking\n4- desertBiking\n5- skyDiving\n6- starGazing\n7- horseRidin\n8- paragliding"), nl,
write("~~ Enter Activity Name: "), readln(X), 
write("~~The following cities have this activity"),nl, activityCityPrint(X). 


lists('2') :- % start based on city
write("Cities: "), nl,
write("1- Jeddah\n2- abha\n3- yanbu\n4- riyadh\n5- jizan\n6- taif\n7- madinah\n8- dammam\n9- farasan"), nl,
write("~~ Enter City Name: "), readln(X), 
write("~~You can find the following activities in this city: "),nl, cityActivityPrint(X). 
%cityList.

lists('3') :- % start based on service
serviceList.

lists('4') :- % EXIT
write("***** Thank you for using our system! *****"),
exit, nl.


cityActivityPrint(X):-
city(X), activityCity(Activity, X), write(Activity), nl, fail.

activityCityList('1'):-
write("The following cities have this activity"),nl, activityCityPrint("sa").


activityCityPrint(X):-
activity(X), activityCity(X, City), write(City), nl, fail.


activityList :-
activity(X), write("- ", X),nl, fail.

cityList :-
city(X), write("- ", X),nl, fail.


serviceList :-
nl, write("~~Select prefered service~~\n"),
write("1- Sales\n2- Female groups\n 3-Child Care\n4- Resident Included"),nl,
write("	Enter number: "), readchar(X), write(X), nl, services(X).


services('1'):-
service(X, sale), write("- ", X), nl, fail.

services('2'):-
service(X, femaleGroup), write("- ", X),nl, fail.


services('3'):-
service(X, childCare), write("- ", X),nl, fail.


services('4'):-
service(X, resident), write("- ", X),nl, fail.

repeat.
repeat:- repeat.


GOAL
write("	***** A guide for Outdoor Activities in Saudi Arabia *****"),nl,
write("      Find your next destination based on one of the next choices:\n"),
displayMenu.






