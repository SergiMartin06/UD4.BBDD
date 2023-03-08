select Ticket.N_Factura,Ticket.Data,Ticket.Hora,Empleat.Nom,sum(Linea_ticket.PreuIVA_Inclos)

from Ticket,Empleat,Linea_ticket,Producte

where Ticket.Empleat_DNI=Empleat.DNI
and Ticket.ID=Linea_ticket.Ticket_ID
and Producte.Codi_Intern=Linea_ticket.Producte_Codi_Intern
and Producte.Codi_Barres="IIIIIIIIII"