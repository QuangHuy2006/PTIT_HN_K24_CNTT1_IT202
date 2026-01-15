create database session14_ex3;

use session14_ex3;

create table users (
    user_id int primary key auto_increment,
    username varchar(50) not null,
    posts_count int default 0,
    following_count int default 0,
    followers_count int default 0
);

create table posts (
    post_id int primary key auto_increment,
    user_id int not null,
    content text not null,
    created_at datetime default current_timestamp,
    likes_count int default 0,
    foreign key (user_id) references users(user_id)
);

create table likes (
    like_id int primary key auto_increment,
    post_id int not null,
    user_id int not null,
    foreign key (post_id) references posts(post_id),
    foreign key (user_id) references users(user_id),
    unique key unique_like (post_id, user_id)
);

create table follows (
    follower_id int not null,
    followed_id int not null,
    primary key (follower_id, followed_id)
);

insert into users (username) values 
('nguyendangquang'),
('dangquoctoan'),
('trantriduong');

-- bài 1
delimiter //
create procedure add_posts(in p_user_id int, in p_content text)
begin
    declare exit handler for sqlexception 
    begin
        rollback;
    end;

    start transaction;

    if not exists (select 1 from users where user_id = p_user_id) then
        rollback;
    end if;

    insert into posts (user_id, content)
    values (p_user_id, p_content);

    update users
    set posts_count = posts_count + 1
    where user_id = p_user_id;

    commit;
end//
delimiter ;

call add_posts(1, 'học văn');
call add_posts(20, 'học c++');

select * from posts;
select * from users;

-- bài 2
delimiter //
create procedure sp_like_post(in p_user_id int, in p_post_id int)
begin

    start transaction;

    insert into likes (post_id, user_id)
    values (p_post_id, p_user_id);

    update posts
    set likes_count = likes_count + 1
    where post_id = p_post_id;

    commit;
end//
delimiter ;

call add_posts(1, 'chào em nha');
call sp_like_post(1, 1);

select * from likes;
select post_id, content, likes_count from posts;

call sp_like_post(1, 1);

-- bài 3
delimiter //
create procedure sp_follow_user(in p_follower_id int, in p_followed_id int)
begin
    start transaction;

    if not exists (select 1 from users where user_id = p_follower_id)
       or not exists (select 1 from users where user_id = p_followed_id) then
        rollback;

    elseif p_follower_id = p_followed_id then
        rollback;

    elseif exists (
        select 1 
        from follows 
        where follower_id = p_follower_id 
          and followed_id = p_followed_id
    ) then
        rollback;

    else
        insert into follows (follower_id, followed_id)
        values (p_follower_id, p_followed_id);

        update users
        set following_count = following_count + 1
        where user_id = p_follower_id;

        update users
        set followers_count = followers_count + 1
        where user_id = p_followed_id;

        commit;
    end if;
end//
delimiter ;

call sp_follow_user(1, 2);
select * from users where user_id in (1, 2);

call sp_follow_user(1, 1);
call sp_follow_user(1, 2);
