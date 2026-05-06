create table patients (
    patient_id int primary key auto_increment,
    full_name varchar(100),
    phone varchar(20),
    age int,
    address varchar(255)
);

delimiter //
create procedure seedpatients()
begin
    declare i int default 1;
    while i <= 500000 do
        insert into patients(full_name, phone, age, address)
        values (
            concat('patient ', i),
            concat('090', lpad(i, 7, '0')),
            floor(rand()*100),
            'ho chi minh city'
        );
        set i = i + 1;
    end while;
end //
delimiter ;

call seedpatients();

explain select * from patients where phone = '0900000001';
select * from patients where phone = '0900000001';

create index idx_phone on patients(phone);

explain select * from patients where phone = '0900000001';
select * from patients where phone = '0900000001';

delimiter //
create procedure insert1000()
begin
    declare i int default 1;
    while i <= 1000 do
        insert into patients(full_name, phone, age, address)
        values (
            concat('new ', i),
            concat('091', lpad(i, 7, '0')),
            floor(rand()*100),
            'ha noi'
        );
        set i = i + 1;
    end while;
end //
delimiter ;

call insert1000();

drop index idx_phone on patients;

call insert1000();