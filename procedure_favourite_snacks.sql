delimiter $$
create procedure SnackBevandePreferiti()
begin
select r.nome, r.codiceProdotto, r.qtyPurchased, f.pIva, f.nome from ristoro r inner join fornitore f on r.provenienza = f.pIva
    order by qtyPurchased desc;
end $$
delimiter ;
