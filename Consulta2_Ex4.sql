select polissa.N. Polissa,TipoPolissa.Nombre,Client.DNI,Client.Nom,Client.Cognom

from Polissa, Client, TipoPolissa

where client.DNI=Polissa.Client_DNI
and Polissa.TipoPolissa_ID=TipoPolissa.ID
and TipoPolissa.Nombre="Viatge";