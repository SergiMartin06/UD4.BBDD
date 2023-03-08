select Avion.ID,Avion.model,Avion.Model,Avion.Capacitat,Vuelo.Avion_ID,Vuelo.Dia_Arribada,Vuelo.Dia_Tornada

from Avion,Vuelo,Reserva

where Avion.Model="Comercial"
and Avion.ID=Vuelo.Avion_ID
and Reserva.Num_Vuelo=Vuelo.Num_Vuelo 