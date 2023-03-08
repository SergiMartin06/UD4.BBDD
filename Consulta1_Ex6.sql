select Pasatger.DNI,Pasatger.Nom,Pasatger.Cognom,Vuelo.Num_Vuelo,Vuelo.Origen,Vuelo.Desti,Reserva.Impot_Tot

from Pasatger,Reserva,Vuelo

where Pasatger.DNI=Reserva.Pasatger_DNI
and Reserva.Num_Vuelo=Vuelo.Num_Vuelo
and Reserva.ID="16253"