DROP DATABASE IF EXISTS Dulichviet;
CREATE DATABASE Dulichviet;
USE Dulichviet;

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountId    int unsigned auto_increment primary key,  
	Email        varchar(200) not null unique, 
	Username   	 varchar(100) not null unique,
	Fullname     varchar(200) not null,
	Phone	     varchar(50) not null unique,
	Address      varchar(500) not null,
	`Password`   varchar(200) not null,     -- Default '123456'
	`Role`       enum('ADMIN', 'USER') default 'USER',
    `Status`     enum('ACTIVE', 'DEACTIVE') default 'ACTIVE'    -- Delete account = Update Status --> DEACTIVE
);

DROP TABLE IF EXISTS Tour;
CREATE TABLE Tour(
	TourId		tinyint unsigned auto_increment primary key,  
	Title		varchar(200) not null,
	`Type`		enum('HOTTOUR', 'TEAMBUILDING', 'HOLIDAY', 'SHORTTOUR'),
	Depart		varchar(50) not null,
	Arrival		varchar(50) not null,
	Duration	tinyint unsigned not null, 	     	
	Transport	enum('AIRPLANE', 'CAR', 'TRAIN') not null,
	Content		text not null,
	Image		varchar(500) not null,
	Price		int unsigned null,
	`Status`    enum('AVAILABLE','UNAVAILABLE') default 'AVAILABLE'      -- Delete tour = Update Tour --> UNAVAILABLE
);

DROP TABLE IF EXISTS Booking;
CREATE TABLE Booking(
	BookingId	 int unsigned auto_increment primary key,
	Note		 varchar(500),
	AccountId 	 int not null,
	TourId	     int not null,
    `Status`     enum('CONFIRM', 'CANCEL') default 'CONFIRM'    -- Delete booking = Update Status --> CANCEL
);

-------------
-- Add data `Account`
INSERT INTO `Account`	(	 		Email				,			Username	   	 ,			Fullname 			,		Phone		,						Address                           ,  						`Password`								   ) 
VALUES 					(		'public@gmail.com'		, 		'publicaccount'		 ,		'Public Account'		,    '0123456789' 	,  			      'Address Public'                        ,		'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi' );

select * from `Account`;

-- Add data Tour
INSERT INTO Tour	(	 		Title				,			`Type`	   	 ,			Depart 			,		Arrival 		,		Duration         ,  	Transport		,      	Content		   ,      				  Image       			,		Price		) 
VALUES 				(		'Hà Nội - Đà Nẵng'		, 		   'HOTTOUR'	 ,			'Hà Nội'		,    	'Đà Nẵng'	 	,  			4            ,		'AIRPLANE' 		,       'content1'	   ,	'google.com/photos/sfjhrbgbsrgj453'		,     5600000		);

select * from Tour;

-- Add data Booking
INSERT INTO Booking	(			Note		         ,  	AccountId		,      	TourId		   ) 
VALUES 				(			'note1'      	     ,			1 			,       	1	       );

select * from Booking;
