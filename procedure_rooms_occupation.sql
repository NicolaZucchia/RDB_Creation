delimiter $$
create procedure RiempimentoGiornaliero()
begin
    select count(*) as 'Conteggio', sala from visione
    inner join proiezione
    on visione.salaProiezione = proiezione.sala 
    group by sala;
end $$
delimiter ;
