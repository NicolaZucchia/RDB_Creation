delimiter $$
create procedure RiempimentoGiornaliero()
begin
    select count(*) as 'Conteggio', sala from visione inner join proiezione
    where visione.salaProiezione = proiezione.sala group by sala;
end $$
delimiter ;