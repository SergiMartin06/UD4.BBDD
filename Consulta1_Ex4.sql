select Polissa . *

from Polissa,Client

where Client_DNI=Polissa.Client_DNI
and Client.Nom="Penelope";