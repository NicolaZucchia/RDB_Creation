delimiter $$
create trigger trg_CheckProiezioniBeforeUpdate before insert on proiezione
    for each row
    begin
        declare tempo int(3);
        select durata from film into tempo;
        if (data == new.date()) then
            if (ora > new.ora) then
                if (ora - tempo < new.ora) then
                    signal sqlstate '45001' set message_text = "Le proiezioni si sovrappongono";
                end if;
            end if;
            if (ora < new.ora) then
               if (ora + tempo > new.ora) then
                   signal sqlstate '45001' set message_text = "Le proiezioni si sovrappongono";
                end if;
            end if;
        end if;
    end $$
delimiter ;
