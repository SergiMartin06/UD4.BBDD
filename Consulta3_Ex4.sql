select *

from Polissa,Cliente,TipoPolissa,Vendedor

where Client.DNI=Polissa.Client_DNI
and Polissa.TipoPolissa_ID=TipoPolissa.ID
and Polissa.Vendedor_DNI=Vendedor.DNI;