select Reserva.ID,Pasatger.Nom

from Pasatger,Vuelo,Reserva

where Pasatger.DNI=Reserva.Pasatger_DNI
and Reserva.Num_Vuelo=Vuelo.Num_Vuelo
and Vuelo.Dia_Arribada="11/9/22"