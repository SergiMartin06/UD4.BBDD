select *

from Citaxd,Client_User,Vehicle,Tipus_Vehicle

where Client_User.DNI=Vehicle.Client_User_DNI
and Vehicle.Matricula=Citaxd.Vehicle_Matricula
and Vehicle.Tipus_Vehicle_ID=Tipus_Vehicle.ID