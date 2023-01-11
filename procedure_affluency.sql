delimiter $$
create procedure AffluenzaGiornaliera ()
begin
    select count(spettatore), pellicola from visione
    inner join proiezione
    on visione.dataProiezione = proiezione.data
    where dataProiezione = curdate()
    group by proiezione.pellicola;
end $$
delimiter ;
