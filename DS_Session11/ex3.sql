USE social_network_pro;
delimiter $$
-- create procedure
create procedure addNewUser (in nu_username varchar(50), in nu_full_name varchar(50), in nu_gender enum('nam','nữ'), in nu_email varchar(50), in nu_password varchar(50), in nu_birthdate date, in nu_hometown varchar(50))
begin
	insert into users(username, full_name, gender, email, password, birthdate, hometown) values
     (nu_username, nu_full_name, nu_gender, nu_email, nu_password, nu_birthdate, nu_hometown);
end $$
-- call procedure
call addNewUser('quangyeutuoi', 'Nguyễn Đăng Quang', 'nữ', 'nguyendangquang0510@gmail.com', 'quangyeutuoi123', '2001-05-10', 'Hải Phòng');

select * from users;
delimiter ;