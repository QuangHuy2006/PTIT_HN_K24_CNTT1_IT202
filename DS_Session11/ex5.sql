USE social_network_pro;
delimiter $$
create procedure createPostWithValidation(p_user_id int, p_content varchar(50), out message varchar(50))
begin 
	if length(p_content) < 5 then 
    set message = 'Nội dung quá ngắn';
    else
	insert into posts(user_id, content) values
    (p_user_id, p_content);
    end if;
end $$
delimiter ;
call createPostWithValidation(1, 'a', @message);
select @message;