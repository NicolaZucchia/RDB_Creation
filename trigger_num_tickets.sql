delimiter $$
create trigger trg_beforeNewBiglietto before update on visione
    for each row
    begin
        declare numSpettatori int(3);
        select count(*) into numSpettatori from visione v inner join sala s
        where v.salaProiezione = s.numero;
        if (numSpettatori >= sala.capienza) then
            signal sqlstate '45001' set message_text = "Capienza massima raggiunta";
        end if;
    end $$
delimiter ;
