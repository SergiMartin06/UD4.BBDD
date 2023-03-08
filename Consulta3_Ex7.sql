select count(Linea_ticket) as "numero lineas"

from Linea_ticket,Ticket,Empleat

where Empleat.DNI=Ticket.Empleat_DNI
and Ticket.ID=Linea_ticket.Ticket_ID
and Empleat.Nom like "0%"
and Ticket.Data <"16/6/23">;