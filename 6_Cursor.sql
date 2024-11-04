CREATE TABLE o_rollcall (
rno INT PRIMARY KEY,
name VARCHAR(20),
addr VARCHAR(40)
);

CREATE TABLE n_rollcall (
rno INT ,
name VARCHAR(20),
addr VARCHAR(40)
);

INSERT INTO o_rollcall (rno, name, addr) VALUES
(1, 'Om', 'Nashik'),
(2, 'Manav', 'Pune'),
(3, 'Kartik', 'Mumbai'),
(4, 'Aryaan', 'Delhi');

INSERT INTO n_rollcall (rno, name, addr) VALUES
(1, 'Om', 'Nashik'),
(2, 'Manav', 'Pune'),
(3, 'Kartik', 'Mumbai');

SELECT * FROM o_rollcall;
SELECT * FROM n_rollcall;

delimiter //
create procedure merge(IN rno1 int)
begin
declare rno2 int;
declare exit_cond boolean;
declare c1 cursor for select rno from o_rollcall where rno>rno1;
declare continue handler for not found set exit_cond=TRUE;
open c1;
l1: loop
fetch c1 into rno2;
if not exists(select * from n_rollcall where rno = rno2) then
insert into n_rollcall select * from o_rollcall where rno = rno2;
end if;
if exit_cond then
close c1;
leave l1;
end if;
end loop l1;
end;
//

delimiter ;

call merge(3);

SELECT * FROM n_rollcall;
