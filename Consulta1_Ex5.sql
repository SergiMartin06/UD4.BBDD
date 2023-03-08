select Citaxd.Vehicle_Matricula,Citaxd.Data,Citaxd.Hora,Tipus_Vehicle.Nom,Vehicle.Marca,Client_User.Nom

from Client_User,Vehicle,Tipus_Vehicle,Citaxd

where Client_User.DNI=Vehicle.Client_User_DNI
and Vehicle.Matricula=Citaxd.Vehicle_Matricula
and Vehicle.Tipus_Vehicle_ID=Tipus_Vehicle.ID;