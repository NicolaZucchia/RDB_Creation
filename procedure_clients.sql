delimiter $$
create procedure ClientiFidelizzati()
begin
    select distinct spettatore, count(spettatore) as ‘Proiezioni Assistite’ from visione order by count(spettatore) desc;
end $$
delimiter ;
