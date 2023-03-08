select count(distint(Vuelo.Num_Vuelo)) as "Numero de vuelos reservados"

from Reserva,Vuelo

where Reserva.Num_Vuelo=Vuelo.Num_Vuelo;