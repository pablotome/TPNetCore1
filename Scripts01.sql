use TPNetCore
GO

set nocount on
set xact_abort on
begin transaction

DROP PROCEDURE DBO.CargarPractica
GO

DROP TABLE DBO.Practica
GO

DROP TABLE DBO.Socio
GO

DROP TABLE DBO.Deporte
GO

DROP TABLE DBO.Categoria
GO

CREATE TABLE DBO.Categoria
(
	CodCategoria int, 
	DesCategoria varchar(50), 
	CONSTRAINT PK_Categoria PRIMARY KEY (CodCategoria)
)
GO

insert into Categoria ( CodCategoria, DesCategoria ) values 
(1, 'Activo Mayor'), 
(2, 'Activo Menor'), 
(3, 'Adherente'), 
(4, 'Honorarios'), 
(5, 'Vitalicio')


CREATE TABLE DBO.Deporte
(
	CodDeporte int identity(1, 1), 
	DesDeporte varchar(50), 
	CONSTRAINT PK_Deporte PRIMARY KEY (CodDeporte)
)
GO

insert into Deporte ( DesDeporte ) values 
('Atletismo'), 
('BMX'), 
('Baloncesto'), 
('Balonmano'), 
('Boxeo'), 
('Bádminton'), 
('Ciclismo'), 
('Deportes acuáticos'), 
('Equitación'), 
('Esgrima'), 
('Fútbol'), 
('Gimnasia artística'), 
('Gimnasia rítmica'), 
('Gimnasia'), 
('Halterofilia'), 
('Hockey sobre césped'), 
('Judo'), 
('Lucha grecorromana'), 
('Lucha libre'), 
('Lucha'), 
('Montaña'), 
('Natación'), 
('Natación sincronizada'), 
('Pentatlón moderno'), 
('Piragüismo'), 
('Pista'), 
('Remo'), 
('Ruta'), 
('Saltos'), 
('Taekwondo'), 
('Tenis'), 
('Tenis de mesa'), 
('Tiro con arco'), 
('Tiro deportivo'), 
('Trampolín'), 
('Triatlón'), 
('Vela'), 
('Voleibol'), 
('Voleibol de playa'), 
('Waterpolo')


CREATE TABLE DBO.Socio
(
	CodSocio int identity(1, 1), 
	Nombre varchar(50), 
	Apellido varchar(50), 
	EMail varchar(100), 
	Sexo char(1), 
	FechaNacimiento datetime, 
	CUIL char(11), 
	CodCategoria int, 
	CONSTRAINT PK_Socio PRIMARY KEY (CodSocio), 
	CONSTRAINT FK_Socio_Categoria FOREIGN KEY (CodCategoria) REFERENCES Categoria(CodCategoria), 
	CONSTRAINT UK_CUIL UNIQUE (CUIL)
)

CREATE TABLE DBO.Practica
(
	CodPractica int identity(1, 1), 
	CodSocio int, 
	CodDeporte int, 
	CONSTRAINT PK_Practica PRIMARY KEY (CodPractica), 
	CONSTRAINT FK_Practica_Socio FOREIGN KEY (CodSocio) REFERENCES Socio(CodSocio), 
	CONSTRAINT FK_Practica_Deporte FOREIGN KEY (CodDeporte) REFERENCES Deporte(CodDeporte), 
	CONSTRAINT UK_Practica UNIQUE (CodSocio, CodDeporte)
)


insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Helene', 'Posselt', 'hposselt0@cpanel.net', 'F', '1986-07-01', '19485111666', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Avery', 'Lambricht', 'alambricht1@wsj.com', 'M', '1988-10-02', '60039092777', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rosalinda', 'Quest', 'rquest2@intel.com', 'F', '1985-02-25', '04369935466', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jaclin', 'Pollington', 'jpollington3@deviantart.com', 'F', '1976-06-21', '26102131900', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Florence', 'Lilywhite', 'flilywhite4@huffingtonpost.com', 'F', '1989-12-13', '39873521166', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Weylin', 'Reina', 'wreina5@cmu.edu', 'M', '1981-05-13', '38278266322', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rosella', 'Lawrance', 'rlawrance6@samsung.com', 'F', '1984-07-05', '50089219088', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Noe', 'Aylott', 'naylott7@earthlink.net', 'M', '1970-02-01', '27132556866', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Katti', 'Wilshin', 'kwilshin8@indiegogo.com', 'F', '1975-01-24', '70456763877', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ashlee', 'Piddle', 'apiddle9@mtv.com', 'F', '1982-08-28', '72055139955', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Findley', 'Donovan', 'fdonovana@telegraph.co.uk', 'M', '1988-08-21', '60808941577', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Toiboid', 'Fawdry', 'tfawdryb@tripadvisor.com', 'M', '1971-05-21', '81860801477', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mayor', 'Pawelek', 'mpawelekc@loc.gov', 'M', '1990-11-30', '07283981255', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Licha', 'Langwade', 'llangwaded@buzzfeed.com', 'F', '1973-04-12', '33197923855', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Christiano', 'Chesterton', 'cchestertone@prweb.com', 'M', '1977-04-23', '76080640133', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marjie', 'Alejandre', 'malejandref@gravatar.com', 'F', '1986-08-04', '25973278688', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Fraze', 'Teulier', 'fteulierg@opensource.org', 'M', '1985-04-17', '03979533722', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ephrayim', 'Shearme', 'eshearmeh@usda.gov', 'M', '1975-08-14', '01628250133', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Roddy', 'Tybalt', 'rtybalti@nih.gov', 'M', '1987-03-07', '14376151044', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mac', 'MacGiany', 'mmacgianyj@uol.com.br', 'M', '1974-03-24', '77889562011', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Inesita', 'Elliot', 'ielliotk@google.ca', 'F', '1985-07-09', '81689164099', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Burr', 'Paton', 'bpatonl@webeden.co.uk', 'M', '1974-02-10', '78164852122', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Brendin', 'Benwell', 'bbenwellm@blogger.com', 'M', '1977-01-06', '00563750933', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kimball', 'Stonhouse', 'kstonhousen@chronoengine.com', 'M', '1976-10-05', '64822363166', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Katrine', 'Whittlesea', 'kwhittleseao@vistaprint.com', 'F', '1975-10-04', '80567902922', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kelcie', 'Bellenger', 'kbellengerp@va.gov', 'F', '1977-11-06', '79823868733', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Retha', 'Emeny', 'remenyq@seesaa.net', 'F', '1983-05-02', '98342454833', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tally', 'Jewkes', 'tjewkesr@businesswire.com', 'M', '1972-05-14', '53196088966', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mollee', 'Kleinstein', 'mkleinsteins@webs.com', 'F', '1987-07-07', '51188635899', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kellen', 'Vassay', 'kvassayt@flickr.com', 'M', '1979-09-12', '91208817977', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Regan', 'Matus', 'rmatusu@infoseek.co.jp', 'M', '1987-04-21', '72948682044', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Elysia', 'Maryet', 'emaryetv@google.co.jp', 'F', '1988-02-18', '01581001233', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kippy', 'Tregensoe', 'ktregensoew@youku.com', 'M', '1970-05-21', '85750935099', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jamey', 'January 1st', 'jjanuarystx@ezinearticles.com', 'M', '1973-07-21', '85140790188', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Fitzgerald', 'Rosenshine', 'frosenshiney@bloomberg.com', 'M', '1973-04-05', '07257333222', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Huntley', 'Readett', 'hreadettz@meetup.com', 'M', '1976-05-15', '09316201477', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Neda', 'Nother', 'nnother10@clickbank.net', 'F', '1990-06-09', '61539036655', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dulcinea', 'Barke', 'dbarke11@aboutads.info', 'F', '1990-01-02', '56567461944', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jerry', 'de Tocqueville', 'jdetocqueville12@aboutads.info', 'M', '1985-05-03', '14062819055', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Burk', 'Godber', 'bgodber13@google.com.hk', 'M', '1970-05-06', '42633963244', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jessie', 'Petken', 'jpetken14@last.fm', 'F', '1970-08-02', '91949848244', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Adriane', 'Pichan', 'apichan15@pcworld.com', 'F', '1972-03-15', '81457618166', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Anatollo', 'Yakunchikov', 'ayakunchikov16@bigcartel.com', 'M', '1972-11-07', '49303520611', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ertha', 'Clowney', 'eclowney17@unc.edu', 'F', '1976-04-03', '09576086088', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kally', 'Sowley', 'ksowley18@cocolog-nifty.com', 'F', '1984-02-21', '35505306844', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lorrin', 'Dartan', 'ldartan19@ftc.gov', 'F', '1989-04-14', '24874422555', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Maurizia', 'O''Hingerty', 'mohingerty1a@cornell.edu', 'F', '1984-10-17', '91485397400', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jody', 'Bowstead', 'jbowstead1b@imageshack.us', 'F', '1987-12-05', '01899676333', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Eada', 'Lindermann', 'elindermann1c@purevolume.com', 'F', '1977-11-16', '41898973455', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dreddy', 'Bernardot', 'dbernardot1d@pcworld.com', 'F', '1976-06-11', '94551973166', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bay', 'Wansbury', 'bwansbury1e@dell.com', 'M', '1976-06-20', '32991760488', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Roscoe', 'Grima', 'rgrima1f@nasa.gov', 'M', '1990-11-16', '42124791922', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Buck', 'Baldam', 'bbaldam1g@businessinsider.com', 'M', '1986-09-25', '39231261233', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Michail', 'Perrat', 'mperrat1h@networkadvertising.org', 'M', '1973-01-21', '92629921499', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hinda', 'Joscelin', 'hjoscelin1i@storify.com', 'F', '1982-04-30', '97068457988', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jimmie', 'Drover', 'jdrover1j@java.com', 'M', '1986-01-06', '06752735522', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Arvy', 'Bolam', 'abolam1k@live.com', 'M', '1987-10-25', '86460220722', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rosene', 'Truelove', 'rtruelove1l@blinklist.com', 'F', '1976-11-12', '46646315888', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bernette', 'Kitney', 'bkitney1m@hatena.ne.jp', 'F', '1988-04-08', '70230410877', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Prescott', 'Loines', 'ploines1n@amazon.co.uk', 'M', '1989-07-10', '25050962955', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Karoly', 'Tisun', 'ktisun1o@bizjournals.com', 'M', '1985-04-03', '48632775122', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Liesa', 'O''Giany', 'logiany1p@liveinternet.ru', 'F', '1988-09-25', '55639967944', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jeni', 'Ossipenko', 'jossipenko1q@taobao.com', 'F', '1978-03-07', '34758169466', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Merridie', 'Cardenosa', 'mcardenosa1r@alibaba.com', 'F', '1989-10-04', '31956279811', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kare', 'Teodoro', 'kteodoro1s@umn.edu', 'F', '1988-12-30', '64149464000', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marga', 'Chapiro', 'mchapiro1t@seattletimes.com', 'F', '1976-10-10', '99449398899', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lombard', 'Brownlie', 'lbrownlie1u@japanpost.jp', 'M', '1974-01-07', '98971291544', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gannon', 'Radbourne', 'gradbourne1v@parallels.com', 'M', '1977-04-18', '09412479966', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Stavros', 'Worsalls', 'sworsalls1w@ask.com', 'M', '1976-02-03', '53419835722', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Maisie', 'Pischoff', 'mpischoff1x@g.co', 'F', '1984-07-31', '61007841577', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jesse', 'Probets', 'jprobets1y@earthlink.net', 'F', '1989-04-14', '54163091800', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Morissa', 'Garric', 'mgarric1z@ow.ly', 'F', '1977-10-10', '03793653088', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Page', 'Wickenden', 'pwickenden20@hugedomains.com', 'M', '1974-03-21', '33939298522', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Filmore', 'Yansons', 'fyansons21@clickbank.net', 'M', '1975-09-12', '49542889755', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Pepillo', 'Gillino', 'pgillino22@chron.com', 'M', '1980-02-02', '35943517855', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nola', 'Stollsteimer', 'nstollsteimer23@columbia.edu', 'F', '1987-07-05', '62976748688', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Margarita', 'Fordy', 'mfordy24@nbcnews.com', 'F', '1979-09-29', '40342121011', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lorraine', 'Abberley', 'labberley25@clickbank.net', 'F', '1975-12-19', '56457935955', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bronson', 'Lockitt', 'blockitt26@surveymonkey.com', 'M', '1982-02-20', '64372761777', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Redd', 'Stileman', 'rstileman27@webmd.com', 'M', '1970-08-17', '52833092233', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hadrian', 'Bodycombe', 'hbodycombe28@who.int', 'M', '1976-01-14', '65552756188', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Willey', 'Rase', 'wrase29@telegraph.co.uk', 'M', '1986-04-05', '03854872588', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bing', 'McKerrow', 'bmckerrow2a@dailymotion.com', 'M', '1971-06-10', '37146725322', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marjie', 'Krystek', 'mkrystek2b@bloglovin.com', 'F', '1974-06-29', '94358030911', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Stavro', 'Gaitley', 'sgaitley2c@behance.net', 'M', '1990-05-02', '54805649277', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Maris', 'Tolemache', 'mtolemache2d@blogtalkradio.com', 'F', '1975-12-15', '84396397322', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Martie', 'Springell', 'mspringell2e@senate.gov', 'M', '1979-07-10', '61551816599', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Deonne', 'Maggs', 'dmaggs2f@baidu.com', 'F', '1978-12-18', '07965463200', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Doreen', 'Briamo', 'dbriamo2g@w3.org', 'F', '1974-08-03', '83188018144', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rosabel', 'McCarrick', 'rmccarrick2h@gizmodo.com', 'F', '1973-03-10', '62288452688', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hildagarde', 'Di Batista', 'hdibatista2i@google.pl', 'F', '1990-06-21', '00864693988', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Normy', 'MacCracken', 'nmaccracken2j@globo.com', 'M', '1978-07-27', '61810231511', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Barnie', 'Gillett', 'bgillett2k@wikipedia.org', 'M', '1982-08-13', '79083143333', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Vernor', 'Calcraft', 'vcalcraft2l@acquirethisname.com', 'M', '1971-09-10', '58500355244', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Yvonne', 'Trewhella', 'ytrewhella2m@symantec.com', 'F', '1982-02-09', '05765068699', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ximenez', 'Lordon', 'xlordon2n@independent.co.uk', 'M', '1970-03-15', '44454771177', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rafaellle', 'Pilch', 'rpilch2o@usgs.gov', 'M', '1990-06-29', '27225862077', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Agnesse', 'Chatell', 'achatell2p@so-net.ne.jp', 'F', '1975-02-16', '84434254588', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Isabeau', 'Bartosik', 'ibartosik2q@github.com', 'F', '1989-12-26', '60958373244', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Arliene', 'Swoffer', 'aswoffer2r@pbs.org', 'F', '1987-08-25', '21359662155', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Merrielle', 'Greenstead', 'mgreenstead2s@columbia.edu', 'F', '1975-02-16', '23737347022', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Emyle', 'Noore', 'enoore2t@boston.com', 'F', '1984-11-30', '42965981711', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Joelynn', 'Linner', 'jlinner2u@nih.gov', 'F', '1990-05-06', '49465089611', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Virgie', 'Lancley', 'vlancley2v@aol.com', 'F', '1974-02-19', '27278067011', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Eleanore', 'Emmett', 'eemmett2w@elpais.com', 'F', '1972-03-20', '95106718788', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kendal', 'Blincoe', 'kblincoe2x@gnu.org', 'M', '1982-11-11', '66767003366', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mallory', 'Cortin', 'mcortin2y@reuters.com', 'M', '1981-08-09', '52599728488', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nate', 'Giacaponi', 'ngiacaponi2z@bandcamp.com', 'M', '1977-10-25', '60710424299', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Charlie', 'Warrick', 'cwarrick30@sitemeter.com', 'M', '1981-09-04', '40549564599', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Patten', 'Bothram', 'pbothram31@dagondesign.com', 'M', '1976-07-16', '97575985777', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lishe', 'Greenstreet', 'lgreenstreet32@patch.com', 'F', '1972-12-01', '01636257866', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Merissa', 'Castiglione', 'mcastiglione33@state.gov', 'F', '1977-11-21', '05306053766', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marietta', 'Caldroni', 'mcaldroni34@oracle.com', 'F', '1979-09-17', '88396345411', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Michail', 'Stanislaw', 'mstanislaw35@yahoo.com', 'M', '1988-01-10', '17949349011', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ilaire', 'Coulbeck', 'icoulbeck36@zimbio.com', 'M', '1973-10-09', '32087192211', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Salomon', 'Jenteau', 'sjenteau37@blinklist.com', 'M', '1979-09-08', '07201475066', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Winslow', 'Fewings', 'wfewings38@reuters.com', 'M', '1973-11-03', '18898474888', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gena', 'Laguerre', 'glaguerre39@twitpic.com', 'F', '1989-08-18', '46007849366', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Priscella', 'Cherrett', 'pcherrett3a@youku.com', 'F', '1975-12-06', '80806814499', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Barr', 'Bryning', 'bbryning3b@jugem.jp', 'M', '1988-08-20', '49529615400', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mei', 'Harken', 'mharken3c@statcounter.com', 'F', '1990-10-09', '67626513566', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Almeta', 'Golton', 'agolton3d@theguardian.com', 'F', '1987-08-23', '49745303722', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Amitie', 'Slowey', 'aslowey3e@narod.ru', 'F', '1982-01-23', '51145603955', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Linet', 'Cartan', 'lcartan3f@whitehouse.gov', 'F', '1974-12-02', '05246742644', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Buffy', 'Richfield', 'brichfield3g@hhs.gov', 'F', '1987-05-29', '23516465844', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Brant', 'Dreelan', 'bdreelan3h@yellowbook.com', 'M', '1978-01-22', '68556508722', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Worth', 'Gyse', 'wgyse3i@geocities.com', 'M', '1970-07-07', '83546539355', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tally', 'Riepl', 'triepl3j@issuu.com', 'F', '1979-06-29', '85171276844', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Llewellyn', 'Dowbiggin', 'ldowbiggin3k@woothemes.com', 'M', '1978-07-24', '43635189011', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marcus', 'Andrat', 'mandrat3l@noaa.gov', 'M', '1983-01-09', '89556192000', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mortimer', 'Stollsteimer', 'mstollsteimer3m@dion.ne.jp', 'M', '1970-06-12', '50003504566', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Almeria', 'Camble', 'acamble3n@whitehouse.gov', 'F', '1981-06-30', '88870219100', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Aurore', 'Shrawley', 'ashrawley3o@gizmodo.com', 'F', '1973-09-09', '56719511199', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jeanne', 'Boick', 'jboick3p@ed.gov', 'F', '1979-06-10', '72907394344', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Merrile', 'Headford', 'mheadford3q@gizmodo.com', 'F', '1973-09-11', '97485141533', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Leopold', 'Carrodus', 'lcarrodus3r@livejournal.com', 'M', '1975-08-21', '41246836422', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cathee', 'Pointon', 'cpointon3s@nasa.gov', 'F', '1987-10-16', '68072035433', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Netty', 'Baack', 'nbaack3t@simplemachines.org', 'F', '1986-12-26', '88935342666', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Frank', 'McKennan', 'fmckennan3u@webmd.com', 'M', '1987-03-23', '56462288833', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Moshe', 'Haensel', 'mhaensel3v@wiley.com', 'M', '1985-09-13', '03724439311', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Heddi', 'Clamp', 'hclamp3w@tiny.cc', 'F', '1984-06-25', '88653698255', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nady', 'Lemoir', 'nlemoir3x@digg.com', 'F', '1979-02-17', '07888825388', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Giacomo', 'Fatscher', 'gfatscher3y@independent.co.uk', 'M', '1987-12-23', '75767590111', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cecelia', 'Blampied', 'cblampied3z@yolasite.com', 'F', '1981-07-31', '40117689877', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jessee', 'Tweddell', 'jtweddell40@globo.com', 'M', '1984-08-20', '73312057499', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bethanne', 'Durtnel', 'bdurtnel41@free.fr', 'F', '1990-04-21', '64703340400', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rowe', 'Aliman', 'raliman42@blogtalkradio.com', 'F', '1970-06-07', '23718894155', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jack', 'Woodall', 'jwoodall43@zimbio.com', 'M', '1977-03-18', '84253126200', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Solly', 'Caughan', 'scaughan44@simplemachines.org', 'M', '1988-04-13', '32069072255', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rem', 'Mellsop', 'rmellsop45@photobucket.com', 'M', '1986-02-02', '02965447955', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bryan', 'Mazzeo', 'bmazzeo46@rambler.ru', 'M', '1989-08-25', '45180559933', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Niven', 'Spikings', 'nspikings47@archive.org', 'M', '1987-08-03', '30519582988', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Anny', 'Simonin', 'asimonin48@surveymonkey.com', 'F', '1970-06-21', '13312705888', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gareth', 'Woodage', 'gwoodage49@cnn.com', 'M', '1983-04-15', '87732588066', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Arden', 'Salzberger', 'asalzberger4a@pagesperso-orange.fr', 'F', '1972-11-29', '30904856133', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Milt', 'Southern', 'msouthern4b@opera.com', 'M', '1981-02-02', '08644758022', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Deonne', 'Verni', 'dverni4c@nasa.gov', 'F', '1979-05-31', '50860788300', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Murielle', 'Pigeram', 'mpigeram4d@usa.gov', 'F', '1980-12-25', '24844730288', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bridgette', 'Yelland', 'byelland4e@ifeng.com', 'F', '1975-05-08', '94507021600', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Janka', 'Edscer', 'jedscer4f@photobucket.com', 'F', '1980-04-20', '53350698644', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Collen', 'De Ruggero', 'cderuggero4g@apple.com', 'F', '1970-01-24', '16463258266', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lewes', 'Hillam', 'lhillam4h@japanpost.jp', 'M', '1990-04-07', '33371026388', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ruperto', 'Litster', 'rlitster4i@spiegel.de', 'M', '1983-09-17', '07821720244', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Blaire', 'Bilam', 'bbilam4j@hostgator.com', 'F', '1978-09-20', '77078985755', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jade', 'Ovesen', 'jovesen4k@bluehost.com', 'F', '1978-08-07', '06235168888', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Wilmette', 'Ventura', 'wventura4l@nps.gov', 'F', '1979-11-08', '11187152844', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Luise', 'Southouse', 'lsouthouse4m@addthis.com', 'F', '1984-11-15', '71265463277', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rustie', 'Luca', 'rluca4n@devhub.com', 'M', '1990-10-12', '29824222200', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Brena', 'Jobin', 'bjobin4o@google.cn', 'F', '1988-07-14', '49755687722', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('York', 'Walbridge', 'ywalbridge4p@meetup.com', 'M', '1970-05-02', '74096669433', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Eleanora', 'Kilner', 'ekilner4q@seattletimes.com', 'F', '1990-08-10', '82607823833', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Thia', 'McCreery', 'tmccreery4r@cocolog-nifty.com', 'F', '1981-12-23', '81310457499', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tyler', 'Davitashvili', 'tdavitashvili4s@about.me', 'M', '1988-12-11', '79816028233', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kirstyn', 'Cauley', 'kcauley4t@sciencedirect.com', 'F', '1970-06-05', '55312765400', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tresa', 'Derycot', 'tderycot4u@feedburner.com', 'F', '1983-08-28', '52363157355', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mose', 'Fidele', 'mfidele4v@yellowbook.com', 'M', '1988-11-25', '48455473844', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Darrell', 'Raggett', 'draggett4w@mtv.com', 'M', '1988-10-16', '96131780900', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Benjamen', 'Sammon', 'bsammon4x@deviantart.com', 'M', '1981-03-17', '29173604100', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lily', 'Campe', 'lcampe4y@washington.edu', 'F', '1988-06-19', '25209158111', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Andi', 'Travers', 'atravers4z@elegantthemes.com', 'F', '1979-06-27', '78450358155', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tobin', 'Guswell', 'tguswell50@dot.gov', 'M', '1976-11-18', '53182855033', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bryan', 'Steed', 'bsteed51@utexas.edu', 'M', '1974-10-20', '55436457322', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Giraud', 'Morison', 'gmorison52@whitehouse.gov', 'M', '1987-05-21', '06171856466', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Xever', 'Curl', 'xcurl53@flavors.me', 'M', '1978-09-12', '96707477911', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Joletta', 'Mollen', 'jmollen54@va.gov', 'F', '1978-05-08', '64007600244', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Holly', 'Durak', 'hdurak55@cbslocal.com', 'M', '1978-01-30', '11408127777', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hildegaard', 'Reolfi', 'hreolfi56@freewebs.com', 'F', '1977-11-03', '54982848377', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jacquetta', 'Rheaume', 'jrheaume57@statcounter.com', 'F', '1986-02-13', '77859239499', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Persis', 'McKerron', 'pmckerron58@fc2.com', 'F', '1976-05-19', '30041163755', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Shoshana', 'Coatham', 'scoatham59@wp.com', 'F', '1976-01-01', '33754180433', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Neel', 'Ardy', 'nardy5a@upenn.edu', 'M', '1979-08-12', '28170817811', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Velvet', 'Hansod', 'vhansod5b@zdnet.com', 'F', '1980-09-01', '70953530699', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Vyky', 'Purton', 'vpurton5c@fastcompany.com', 'F', '1977-01-10', '20831519844', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Augustina', 'Manz', 'amanz5d@nhs.uk', 'F', '1978-06-10', '85429920599', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Giulia', 'Parkinson', 'gparkinson5e@nasa.gov', 'F', '1984-02-25', '41965298955', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nettie', 'Squibbs', 'nsquibbs5f@zimbio.com', 'F', '1973-02-07', '79541773277', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sherri', 'Crosson', 'scrosson5g@apache.org', 'F', '1984-02-21', '80374897522', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Aharon', 'Du Pre', 'adupre5h@wikipedia.org', 'M', '1983-02-22', '27611599266', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Aldridge', 'Dring', 'adring5i@privacy.gov.au', 'M', '1980-10-29', '51056644933', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mauricio', 'Lambol', 'mlambol5j@seesaa.net', 'M', '1983-05-07', '27543198244', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Vladimir', 'Necolds', 'vnecolds5k@biblegateway.com', 'M', '1978-04-19', '91465962166', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rawley', 'Eckert', 'reckert5l@seattletimes.com', 'M', '1979-04-07', '12080336544', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Harold', 'Fyndon', 'hfyndon5m@cnet.com', 'M', '1987-10-20', '24169183466', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Branden', 'Hinnerk', 'bhinnerk5n@stanford.edu', 'M', '1981-01-12', '22500082644', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lily', 'Adamczyk', 'ladamczyk5o@issuu.com', 'F', '1983-11-22', '97953787166', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kellen', 'Fairchild', 'kfairchild5p@ted.com', 'F', '1989-01-15', '38377668100', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Matthias', 'Heis', 'mheis5q@naver.com', 'M', '1979-02-10', '56835185122', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lance', 'Woodall', 'lwoodall5r@vinaora.com', 'M', '1990-06-18', '65079658399', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Monika', 'Strothers', 'mstrothers5s@jimdo.com', 'F', '1971-06-10', '26339317233', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dill', 'Proctor', 'dproctor5t@umich.edu', 'M', '1981-10-16', '47820197500', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Debbi', 'Cluatt', 'dcluatt5u@hibu.com', 'F', '1983-08-19', '73682005622', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Chaim', 'Simonel', 'csimonel5v@vkontakte.ru', 'M', '1985-03-07', '33021188133', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Stefa', 'Hansberry', 'shansberry5w@rakuten.co.jp', 'F', '1988-08-06', '48858785944', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gardy', 'Lawie', 'glawie5x@i2i.jp', 'M', '1986-02-04', '99706496200', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jilly', 'Landon', 'jlandon5y@simplemachines.org', 'F', '1973-06-15', '17466565811', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hilary', 'Cahani', 'hcahani5z@cisco.com', 'F', '1971-10-06', '97691198144', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hadrian', 'Baulch', 'hbaulch60@home.pl', 'M', '1972-10-02', '07686847655', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jackqueline', 'Nayer', 'jnayer61@state.tx.us', 'F', '1990-09-28', '68732821977', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Alidia', 'Harsent', 'aharsent62@ameblo.jp', 'F', '1973-05-23', '38905893322', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Thurston', 'Huster', 'thuster63@barnesandnoble.com', 'M', '1979-08-31', '47997058577', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Julita', 'Noyce', 'jnoyce64@home.pl', 'F', '1990-03-25', '61644587066', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Steven', 'MacDuffie', 'smacduffie65@cpanel.net', 'M', '1989-04-11', '25911354444', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Baxy', 'Matthai', 'bmatthai66@aboutads.info', 'M', '1975-07-25', '68058638644', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Darice', 'Mackerel', 'dmackerel67@samsung.com', 'F', '1981-10-03', '39629213544', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gaspar', 'Rodenburgh', 'grodenburgh68@youtube.com', 'M', '1974-02-07', '52118633566', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gunner', 'Bartolozzi', 'gbartolozzi69@parallels.com', 'M', '1983-04-04', '07284849944', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Alfonso', 'Durrance', 'adurrance6a@hhs.gov', 'M', '1978-11-10', '81822075411', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Stafford', 'Corneliussen', 'scorneliussen6b@wordpress.org', 'M', '1983-05-19', '58111624999', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Elijah', 'Weich', 'eweich6c@w3.org', 'M', '1970-04-15', '87844715300', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ash', 'Stemson', 'astemson6d@angelfire.com', 'M', '1977-08-10', '98242024633', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lem', 'Rookes', 'lrookes6e@tumblr.com', 'M', '1971-07-25', '21219269411', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ripley', 'Reily', 'rreily6f@cbsnews.com', 'M', '1985-12-23', '06720826244', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Allyn', 'Tofpik', 'atofpik6g@liveinternet.ru', 'F', '1970-11-03', '36713467877', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jackelyn', 'Girkins', 'jgirkins6h@biglobe.ne.jp', 'F', '1980-01-27', '88588500411', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Erin', 'Du Barry', 'edubarry6i@auda.org.au', 'F', '1989-01-22', '43928050422', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Fabio', 'Iori', 'fiori6j@vkontakte.ru', 'M', '1981-01-24', '37677754844', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Karoline', 'Gravenor', 'kgravenor6k@uol.com.br', 'F', '1985-07-13', '12960714566', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Markos', 'Rennolds', 'mrennolds6l@posterous.com', 'M', '1990-10-26', '10785057488', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cristi', 'Coverly', 'ccoverly6m@dion.ne.jp', 'F', '1974-01-22', '04816566422', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lewie', 'Stirtle', 'lstirtle6n@canalblog.com', 'M', '1983-09-25', '01898563944', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Georgi', 'Dussy', 'gdussy6o@imageshack.us', 'M', '1981-07-16', '99814610833', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Brenden', 'Cardow', 'bcardow6p@paginegialle.it', 'M', '1982-10-03', '86089931044', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Virgil', 'Gumley', 'vgumley6q@dailymotion.com', 'M', '1974-06-21', '93973181600', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ladonna', 'Wands', 'lwands6r@squarespace.com', 'F', '1990-02-01', '84534690166', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nora', 'Evangelinos', 'nevangelinos6s@seattletimes.com', 'F', '1978-08-18', '79059717400', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ava', 'Bolstridge', 'abolstridge6t@geocities.jp', 'F', '1981-03-16', '86036043988', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carena', 'Sang', 'csang6u@unc.edu', 'F', '1986-08-26', '45402895277', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bren', 'Ninnoli', 'bninnoli6v@miibeian.gov.cn', 'M', '1974-09-08', '84061472611', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hanna', 'Guinery', 'hguinery6w@unicef.org', 'F', '1987-08-16', '69260951677', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hildagard', 'Tippings', 'htippings6x@rediff.com', 'F', '1975-02-28', '06138703288', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Amargo', 'Wenderott', 'awenderott6y@ed.gov', 'F', '1981-07-27', '86112398222', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dalila', 'Fozzard', 'dfozzard6z@cafepress.com', 'F', '1985-08-03', '72312050899', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Karon', 'Ffoulkes', 'kffoulkes70@nps.gov', 'F', '1971-08-13', '59006423566', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Osmond', 'Reading', 'oreading71@nydailynews.com', 'M', '1982-12-20', '63125090877', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Derril', 'Feveryear', 'dfeveryear72@typepad.com', 'M', '1981-07-09', '06776912899', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nicki', 'Yushkin', 'nyushkin73@hubpages.com', 'F', '1986-12-21', '26502512477', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Fabe', 'Livock', 'flivock74@lulu.com', 'M', '1974-06-20', '93588848944', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ignatius', 'Vinnicombe', 'ivinnicombe75@oakley.com', 'M', '1977-05-21', '24592862522', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Addie', 'Folks', 'afolks76@geocities.com', 'M', '1971-08-03', '37013493044', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Josephina', 'Emerine', 'jemerine77@imdb.com', 'F', '1983-08-18', '06609292011', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Isak', 'Iori', 'iiori78@pagesperso-orange.fr', 'M', '1984-04-12', '25930819455', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sutherlan', 'Raft', 'sraft79@nationalgeographic.com', 'M', '1985-12-08', '29678625333', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kira', 'McQuorkel', 'kmcquorkel7a@geocities.com', 'F', '1976-08-12', '16690633999', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sidoney', 'Quarry', 'squarry7b@wordpress.org', 'F', '1990-03-25', '97006816888', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kristoffer', 'Jenkins', 'kjenkins7c@vkontakte.ru', 'M', '1986-05-25', '01807507200', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Adrianne', 'Deniskevich', 'adeniskevich7d@example.com', 'F', '1985-04-16', '48195571144', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Pascal', 'Snawden', 'psnawden7e@wikia.com', 'M', '1970-02-27', '39361472999', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Larissa', 'Grundell', 'lgrundell7f@sohu.com', 'F', '1971-06-21', '84555897011', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Levin', 'Powton', 'lpowton7g@wired.com', 'M', '1980-12-28', '72186583855', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Adelind', 'Alves', 'aalves7h@wikia.com', 'F', '1980-04-25', '38691431500', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ignatius', 'Siggins', 'isiggins7i@nydailynews.com', 'M', '1984-02-02', '15847014555', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('West', 'Arlett', 'warlett7j@xing.com', 'M', '1986-06-14', '36422166766', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Briana', 'Curgenven', 'bcurgenven7k@marketwatch.com', 'F', '1980-05-31', '60660464700', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Taber', 'Gemson', 'tgemson7l@yahoo.com', 'M', '1989-01-26', '73585698577', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Farley', 'Wernham', 'fwernham7m@netlog.com', 'M', '1976-02-11', '34630271000', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Perle', 'Foulser', 'pfoulser7n@facebook.com', 'F', '1979-08-17', '63452006033', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Timotheus', 'Brodie', 'tbrodie7o@unicef.org', 'M', '1985-10-29', '18224034211', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Inge', 'Banbrook', 'ibanbrook7p@odnoklassniki.ru', 'F', '1982-10-16', '52509780888', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Umberto', 'Pren', 'upren7q@abc.net.au', 'M', '1982-01-05', '48617228377', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gerda', 'Seadon', 'gseadon7r@technorati.com', 'F', '1973-05-18', '92717465899', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nikolas', 'Karlqvist', 'nkarlqvist7s@techcrunch.com', 'M', '1984-02-29', '46967830066', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Felizio', 'Farge', 'ffarge7t@parallels.com', 'M', '1989-01-08', '27180483011', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Anny', 'Brave', 'abrave7u@w3.org', 'F', '1982-06-25', '91913803599', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ellswerth', 'Stanfield', 'estanfield7v@cyberchimps.com', 'M', '1988-10-23', '05283389788', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Deirdre', 'Wanden', 'dwanden7w@deviantart.com', 'F', '1986-11-14', '39025610333', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Katine', 'Radage', 'kradage7x@adobe.com', 'F', '1981-06-12', '30885401811', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Leonhard', 'Saxelby', 'lsaxelby7y@behance.net', 'M', '1984-02-15', '30327568399', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Luther', 'Yetton', 'lyetton7z@sfgate.com', 'M', '1981-10-07', '89905523111', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Witty', 'Brownstein', 'wbrownstein80@pen.io', 'M', '1976-12-09', '12316081022', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Halli', 'Belsham', 'hbelsham81@soup.io', 'F', '1982-02-09', '14171748977', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kitty', 'Matisse', 'kmatisse82@printfriendly.com', 'F', '1979-10-14', '66387773000', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sheff', 'Storch', 'sstorch83@bing.com', 'M', '1977-05-27', '98062453933', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Danita', 'Schimonek', 'dschimonek84@seesaa.net', 'F', '1990-07-22', '70932314700', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jerrine', 'Castana', 'jcastana85@amazon.com', 'F', '1983-05-14', '14748796244', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Thoma', 'Kaaskooper', 'tkaaskooper86@cnbc.com', 'M', '1989-05-18', '26072902366', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cesya', 'Fellis', 'cfellis87@hatena.ne.jp', 'F', '1982-03-12', '58675089199', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Debby', 'Seabrocke', 'dseabrocke88@ow.ly', 'F', '1983-06-08', '68510359600', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Artus', 'Rablin', 'arablin89@examiner.com', 'M', '1971-05-10', '65372128200', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rosalie', 'Jerwood', 'rjerwood8a@bloglovin.com', 'F', '1974-08-31', '79059675300', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gareth', 'Jerger', 'gjerger8b@cbsnews.com', 'M', '1978-02-17', '36751662877', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bale', 'Biggs', 'bbiggs8c@123-reg.co.uk', 'M', '1982-01-23', '44727075511', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Zechariah', 'Gouldthorp', 'zgouldthorp8d@walmart.com', 'M', '1981-03-31', '57771971755', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Laurens', 'Comins', 'lcomins8e@columbia.edu', 'M', '1980-09-30', '61881088611', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Moses', 'Christaeas', 'mchristaeas8f@wordpress.org', 'M', '1980-10-28', '60821027388', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rockey', 'Shinton', 'rshinton8g@timesonline.co.uk', 'M', '1986-05-17', '71721315844', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Micky', 'Ambrogioni', 'mambrogioni8h@uol.com.br', 'M', '1977-12-06', '49957451577', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tabb', 'Muldrew', 'tmuldrew8i@icq.com', 'M', '1986-06-17', '59074122322', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Claiborn', 'Beynke', 'cbeynke8j@independent.co.uk', 'M', '1984-06-08', '01052097244', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tami', 'Theobald', 'ttheobald8k@tinyurl.com', 'F', '1971-08-30', '58531981811', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gareth', 'Keele', 'gkeele8l@hp.com', 'M', '1984-07-18', '05142635044', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Liv', 'Bengoechea', 'lbengoechea8m@theguardian.com', 'F', '1990-12-11', '78491775333', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Isis', 'Ortega', 'iortega8n@blog.com', 'F', '1970-04-29', '47808774233', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bronnie', 'Dennistoun', 'bdennistoun8o@jimdo.com', 'M', '1974-12-07', '50615154122', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Case', 'Woffinden', 'cwoffinden8p@ibm.com', 'M', '1977-11-15', '19307814900', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Juliann', 'Sieb', 'jsieb8q@chron.com', 'F', '1988-07-02', '50398958600', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rod', 'Newbegin', 'rnewbegin8r@nationalgeographic.com', 'M', '1989-08-15', '34490290100', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bobine', 'Gergus', 'bgergus8s@prnewswire.com', 'F', '1979-10-09', '18907268933', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Layney', 'Selley', 'lselley8t@whitehouse.gov', 'F', '1990-06-25', '45100575200', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dan', 'Kennewell', 'dkennewell8u@soundcloud.com', 'M', '1974-11-12', '43872045400', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ned', 'Maymond', 'nmaymond8v@blog.com', 'M', '1981-06-01', '74875279211', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bevvy', 'Brimfield', 'bbrimfield8w@blogs.com', 'F', '1988-11-22', '94275809844', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sibylla', 'How', 'show8x@reddit.com', 'F', '1971-12-27', '38778749911', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Meredith', 'Schole', 'mschole8y@psu.edu', 'F', '1983-11-07', '62578344066', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kenneth', 'Sheen', 'ksheen8z@blogs.com', 'M', '1983-02-25', '65560479299', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ilse', 'Bulfield', 'ibulfield90@umich.edu', 'F', '1975-07-27', '79567215477', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Guthry', 'Fried', 'gfried91@ebay.co.uk', 'M', '1972-01-01', '83332772099', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Timmi', 'Natte', 'tnatte92@parallels.com', 'F', '1975-09-11', '73231675155', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gilberte', 'Gonthard', 'ggonthard93@redcross.org', 'F', '1984-08-06', '87591213000', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Derrek', 'Chartres', 'dchartres94@studiopress.com', 'M', '1988-11-22', '15175481444', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Andrea', 'Mayell', 'amayell95@sitemeter.com', 'F', '1984-07-10', '52430494255', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Duffy', 'Cownden', 'dcownden96@mozilla.com', 'M', '1972-02-25', '20507193022', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cynde', 'Garwood', 'cgarwood97@ow.ly', 'F', '1990-12-06', '15125151166', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Oberon', 'Elbourne', 'oelbourne98@nydailynews.com', 'M', '1979-05-22', '30640680755', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dom', 'Lerner', 'dlerner99@dot.gov', 'M', '1970-07-10', '57968148344', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Daniela', 'Burchett', 'dburchett9a@wordpress.org', 'F', '1985-08-25', '23308795122', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marietta', 'Cicutto', 'mcicutto9b@hatena.ne.jp', 'M', '1979-02-27', '88673846788', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Clarinda', 'Von Welldun', 'cvonwelldun9c@deviantart.com', 'F', '1976-11-14', '82146484599', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Owen', 'Abbis', 'oabbis9d@epa.gov', 'M', '1976-06-21', '45133160988', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kimball', 'Durham', 'kdurham9e@topsy.com', 'M', '1978-12-26', '24003675744', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gilburt', 'Barke', 'gbarke9f@jimdo.com', 'M', '1981-11-10', '49306576877', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Antonius', 'Mayger', 'amayger9g@accuweather.com', 'M', '1979-12-09', '55919602277', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Brendan', 'Droghan', 'bdroghan9h@xrea.com', 'M', '1990-06-21', '20789958866', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Annadiane', 'Camolli', 'acamolli9i@cdbaby.com', 'F', '1987-09-19', '40653474833', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Alena', 'Engel', 'aengel9j@ask.com', 'F', '1988-05-18', '88638081044', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gunar', 'Smaile', 'gsmaile9k@oracle.com', 'M', '1974-02-18', '26357005244', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Linus', 'Burmingham', 'lburmingham9l@istockphoto.com', 'M', '1987-08-14', '48951259633', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mortie', 'Eveling', 'meveling9m@yellowbook.com', 'M', '1990-01-23', '17229155600', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Petunia', 'Ccomini', 'pccomini9n@fema.gov', 'F', '1980-09-08', '35452836744', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Regine', 'Hext', 'rhext9o@discuz.net', 'F', '1977-02-24', '90470926866', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Addy', 'Magauran', 'amagauran9p@sina.com.cn', 'M', '1986-03-16', '05988217599', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kean', 'Dunbleton', 'kdunbleton9q@oracle.com', 'M', '1985-07-06', '43546375888', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jaimie', 'Skeat', 'jskeat9r@usatoday.com', 'M', '1983-04-03', '64384204411', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Creight', 'Christauffour', 'cchristauffour9s@lulu.com', 'M', '1978-03-06', '57251473711', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Renado', 'McEnery', 'rmcenery9t@redcross.org', 'M', '1987-08-02', '90678961444', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Allissa', 'Houlaghan', 'ahoulaghan9u@economist.com', 'F', '1981-01-30', '03672357499', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mickie', 'Rodenburgh', 'mrodenburgh9v@irs.gov', 'M', '1971-10-26', '54942878744', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marwin', 'Drinkhill', 'mdrinkhill9w@dmoz.org', 'M', '1988-06-21', '07499061899', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jaquelin', 'Djurkovic', 'jdjurkovic9x@amazonaws.com', 'F', '1983-10-13', '98992987788', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Michaella', 'Conti', 'mconti9y@abc.net.au', 'F', '1973-01-13', '50139672600', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jacquetta', 'Matuszinski', 'jmatuszinski9z@desdev.cn', 'F', '1974-01-11', '11945367199', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Guenevere', 'Lithgow', 'glithgowa0@typepad.com', 'F', '1970-10-15', '50085512722', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Loralyn', 'Heffernan', 'lheffernana1@etsy.com', 'F', '1976-06-27', '25007468600', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Meir', 'Vanshin', 'mvanshina2@boston.com', 'M', '1988-07-18', '75229341411', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bogart', 'Seid', 'bseida3@illinois.edu', 'M', '1970-04-03', '06399164144', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nealon', 'Lutas', 'nlutasa4@cpanel.net', 'M', '1981-07-16', '78630704577', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Maddie', 'Extence', 'mextencea5@themeforest.net', 'M', '1970-09-27', '28996453155', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Evangelin', 'Mitchel', 'emitchela6@shareasale.com', 'F', '1970-09-17', '56285855644', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Starlene', 'Devil', 'sdevila7@aboutads.info', 'F', '1971-12-29', '66997060044', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dania', 'Gorden', 'dgordena8@fda.gov', 'F', '1981-10-30', '62681941799', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dwain', 'Penniall', 'dpennialla9@amazon.co.jp', 'M', '1975-10-03', '25490649099', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Northrop', 'Howles', 'nhowlesaa@exblog.jp', 'M', '1976-04-14', '19089109844', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cheryl', 'Frigout', 'cfrigoutab@tinypic.com', 'F', '1989-03-18', '44988012966', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ag', 'Titchard', 'atitchardac@t-online.de', 'F', '1988-12-19', '96775786777', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Fonsie', 'Stickles', 'fsticklesad@odnoklassniki.ru', 'M', '1980-03-13', '88862965333', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Alfonso', 'Livezley', 'alivezleyae@arizona.edu', 'M', '1987-11-19', '51212016644', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kristopher', 'Perritt', 'kperrittaf@time.com', 'M', '1978-09-26', '37051962944', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Todd', 'Derell', 'tderellag@geocities.jp', 'M', '1972-04-21', '22770380322', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Thorn', 'Southam', 'tsouthamah@sphinn.com', 'M', '1970-07-13', '24161840088', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Byron', 'Gilfether', 'bgilfetherai@people.com.cn', 'M', '1979-01-12', '68468621100', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Barret', 'Beaze', 'bbeazeaj@eepurl.com', 'M', '1985-11-21', '29745067200', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Flemming', 'Rallings', 'frallingsak@networkadvertising.org', 'M', '1980-05-31', '41026870844', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ives', 'Ogle', 'iogleal@lulu.com', 'M', '1982-07-26', '70892974033', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bessie', 'Giddens', 'bgiddensam@posterous.com', 'F', '1978-01-27', '12239276288', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Engracia', 'Tailby', 'etailbyan@instagram.com', 'F', '1971-11-05', '80372611588', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Loraine', 'Rist', 'lristao@wisc.edu', 'F', '1988-09-04', '69783171366', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Karylin', 'Shrigley', 'kshrigleyap@wordpress.com', 'F', '1982-03-22', '90905810733', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Webster', 'Mebius', 'wmebiusaq@businessweek.com', 'M', '1975-04-27', '28143475355', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Elora', 'Miklem', 'emiklemar@myspace.com', 'F', '1977-10-11', '13126784299', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Torre', 'McGibbon', 'tmcgibbonas@wix.com', 'M', '1984-12-19', '50435978522', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Colin', 'Stonehouse', 'cstonehouseat@webeden.co.uk', 'M', '1971-12-14', '98959879433', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Wang', 'Fillimore', 'wfillimoreau@nba.com', 'M', '1974-02-14', '37201482544', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gerry', 'Georges', 'ggeorgesav@rakuten.co.jp', 'M', '1976-11-06', '83611015277', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Parsifal', 'Jakucewicz', 'pjakucewiczaw@reddit.com', 'M', '1985-03-14', '87331414799', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Talbert', 'Bertelsen', 'tbertelsenax@examiner.com', 'M', '1970-10-22', '26811130322', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Katy', 'Knoller', 'kknolleray@cbslocal.com', 'F', '1975-05-20', '11800833855', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Luce', 'Bertolin', 'lbertolinaz@yellowbook.com', 'F', '1978-01-28', '84962111266', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lyn', 'Dewey', 'ldeweyb0@deviantart.com', 'M', '1978-05-29', '84258213399', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Luz', 'Platfoot', 'lplatfootb1@tumblr.com', 'F', '1980-09-27', '98891629388', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cookie', 'Macoun', 'cmacounb2@tinypic.com', 'F', '1990-07-06', '71701582211', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Livvie', 'Feek', 'lfeekb3@yandex.ru', 'F', '1981-10-27', '93444950099', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marshal', 'Alstead', 'malsteadb4@webeden.co.uk', 'M', '1986-05-20', '69283426333', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Levon', 'Vittel', 'lvittelb5@hatena.ne.jp', 'M', '1985-10-03', '93108987122', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Alexi', 'Hopfer', 'ahopferb6@soup.io', 'F', '1971-05-08', '32951856033', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Meagan', 'Wilshaw', 'mwilshawb7@myspace.com', 'F', '1974-05-24', '72940839166', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Joanie', 'Caughte', 'jcaughteb8@google.com.hk', 'F', '1970-05-24', '44725539022', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Frazer', 'Gerb', 'fgerbb9@google.co.jp', 'M', '1985-11-12', '49192912644', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Feliks', 'Heritege', 'fheritegeba@meetup.com', 'M', '1989-02-06', '49872980588', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Pegeen', 'Summergill', 'psummergillbb@nifty.com', 'F', '1971-07-14', '43844948822', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dorey', 'Laxen', 'dlaxenbc@ycombinator.com', 'F', '1978-03-18', '44175302544', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nelia', 'Pieracci', 'npieraccibd@prweb.com', 'F', '1983-09-01', '06786484922', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Barnabe', 'Castellet', 'bcastelletbe@gmpg.org', 'M', '1971-12-08', '43405359233', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Odelle', 'Imesen', 'oimesenbf@photobucket.com', 'F', '1978-05-31', '92973898488', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Elwira', 'McRae', 'emcraebg@go.com', 'F', '1972-10-11', '97144297222', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hyacinthe', 'Vondrach', 'hvondrachbh@joomla.org', 'F', '1980-06-04', '70580311933', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Myrle', 'Tromans', 'mtromansbi@nsw.gov.au', 'F', '1974-11-15', '57630743511', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kerby', 'Kellett', 'kkellettbj@ehow.com', 'M', '1975-05-19', '39392292455', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Darlene', 'Tadd', 'dtaddbk@indiegogo.com', 'F', '1982-08-18', '51093449733', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Alicea', 'Skurm', 'askurmbl@howstuffworks.com', 'F', '1982-03-14', '29131681755', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hillery', 'Hathwood', 'hhathwoodbm@state.gov', 'M', '1982-01-30', '25922627844', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Miquela', 'Howarth', 'mhowarthbn@pagesperso-orange.fr', 'F', '1986-11-18', '38478870177', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Fifi', 'Lothlorien', 'flothlorienbo@prnewswire.com', 'F', '1988-06-07', '44648007344', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kiersten', 'Follen', 'kfollenbp@deviantart.com', 'F', '1975-12-28', '69079200344', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Grove', 'Kubicek', 'gkubicekbq@dedecms.com', 'M', '1977-10-11', '00456293588', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Franky', 'Lobe', 'flobebr@adobe.com', 'M', '1976-05-22', '24845685177', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marline', 'Fawloe', 'mfawloebs@mysql.com', 'F', '1983-09-21', '23829420377', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gun', 'Withey', 'gwitheybt@cpanel.net', 'M', '1977-08-23', '60197051888', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Millicent', 'Athow', 'mathowbu@abc.net.au', 'F', '1981-03-15', '70379756211', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mabelle', 'Mordy', 'mmordybv@state.gov', 'F', '1972-10-31', '44051571899', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Neddie', 'Caltun', 'ncaltunbw@addtoany.com', 'M', '1977-11-01', '39985120200', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Burch', 'Phant', 'bphantbx@howstuffworks.com', 'M', '1979-07-11', '04881703544', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sissy', 'Skoggins', 'sskogginsby@mlb.com', 'F', '1980-09-23', '97546528133', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Shea', 'Millin', 'smillinbz@godaddy.com', 'M', '1988-02-02', '59873721944', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Christi', 'Condit', 'cconditc0@house.gov', 'F', '1988-01-01', '50301242844', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Derby', 'Englefield', 'denglefieldc1@loc.gov', 'M', '1984-01-07', '18205622988', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jessie', 'Daelman', 'jdaelmanc2@youtube.com', 'M', '1978-05-09', '97665637999', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lissa', 'Singh', 'lsinghc3@cam.ac.uk', 'F', '1979-12-19', '23197884255', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jedediah', 'Brennenstuhl', 'jbrennenstuhlc4@cocolog-nifty.com', 'M', '1985-10-26', '89133651622', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ringo', 'Copo', 'rcopoc5@nyu.edu', 'M', '1974-11-26', '15702051244', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Barn', 'Peacey', 'bpeaceyc6@ibm.com', 'M', '1976-10-22', '10359262966', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Astrid', 'Sawden', 'asawdenc7@sogou.com', 'F', '1979-12-09', '54181569422', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('King', 'McNea', 'kmcneac8@purevolume.com', 'M', '1979-12-29', '46856639266', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dianne', 'Bernot', 'dbernotc9@msu.edu', 'F', '1974-07-11', '69825008377', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Avigdor', 'Heinritz', 'aheinritzca@moonfruit.com', 'M', '1970-11-08', '11982237744', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Micki', 'Wyre', 'mwyrecb@parallels.com', 'F', '1984-06-24', '16520177988', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Larine', 'Corck', 'lcorckcc@admin.ch', 'F', '1975-03-20', '45325240911', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Aguistin', 'Landeaux', 'alandeauxcd@chron.com', 'M', '1984-07-25', '21400509088', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Wood', 'Kilminster', 'wkilminsterce@toplist.cz', 'M', '1973-04-05', '88777977388', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Malvina', 'Burbidge', 'mburbidgecf@bravesites.com', 'F', '1989-12-26', '71406770777', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sascha', 'Puleston', 'spulestoncg@tiny.cc', 'M', '1971-02-25', '54069113411', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Britt', 'Ramel', 'bramelch@gmpg.org', 'M', '1990-10-07', '30621171177', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ravid', 'Peschet', 'rpeschetci@opera.com', 'M', '1986-11-23', '72676940477', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Yvon', 'Brash', 'ybrashcj@stanford.edu', 'M', '1989-11-04', '97275750055', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Deidre', 'Pohls', 'dpohlsck@paypal.com', 'F', '1972-01-12', '02362340800', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sarajane', 'Tinton', 'stintoncl@cbslocal.com', 'F', '1984-01-20', '77505175966', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Robin', 'Bottby', 'rbottbycm@amazon.co.jp', 'M', '1974-11-15', '72500234977', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Irina', 'Ferretti', 'iferretticn@businessinsider.com', 'F', '1986-07-18', '09424233644', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kellen', 'Pinsent', 'kpinsentco@cafepress.com', 'F', '1988-11-26', '20664605599', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Yardley', 'Derrington', 'yderringtoncp@noaa.gov', 'M', '1977-09-03', '33700672266', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Linc', 'Huscroft', 'lhuscroftcq@accuweather.com', 'M', '1973-09-02', '75100159955', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Helsa', 'Braxay', 'hbraxaycr@zimbio.com', 'F', '1979-04-26', '09674577500', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nadeen', 'McShirie', 'nmcshiriecs@intel.com', 'F', '1976-12-31', '13443299500', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gianina', 'Sandbatch', 'gsandbatchct@1und1.de', 'F', '1979-11-13', '90632498888', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rozina', 'McEvoy', 'rmcevoycu@macromedia.com', 'F', '1983-06-08', '64428696877', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nani', 'Britten', 'nbrittencv@vimeo.com', 'F', '1987-09-16', '11165309455', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Darryl', 'McGinlay', 'dmcginlaycw@about.me', 'M', '1970-03-24', '36573211600', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rina', 'Donisi', 'rdonisicx@engadget.com', 'F', '1975-04-02', '58125027222', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Audrye', 'Bernhardsson', 'abernhardssoncy@phpbb.com', 'F', '1984-06-03', '58049386733', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kort', 'Sissons', 'ksissonscz@google.cn', 'M', '1982-06-16', '56958216577', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mickie', 'Cisar', 'mcisard0@illinois.edu', 'M', '1987-08-19', '89636884299', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Welch', 'Mccaull', 'wmccaulld1@sbwire.com', 'M', '1977-09-01', '50173834333', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Delcina', 'Jeffrey', 'djeffreyd2@wordpress.org', 'F', '1983-12-19', '46464018000', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ewen', 'Ondrich', 'eondrichd3@google.com.hk', 'M', '1979-10-14', '82224198033', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Brandea', 'Anker', 'bankerd4@cnet.com', 'F', '1980-12-14', '10508009666', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Urban', 'Dundredge', 'udundredged5@weebly.com', 'M', '1986-07-10', '05951634400', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nancey', 'Eastope', 'neastoped6@java.com', 'F', '1971-09-05', '32445539744', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Franky', 'Brend', 'fbrendd7@upenn.edu', 'M', '1986-03-08', '14447142600', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Korry', 'Priddey', 'kpriddeyd8@facebook.com', 'F', '1975-12-27', '74685193666', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lolita', 'Sheward', 'lshewardd9@reverbnation.com', 'F', '1989-01-09', '90478947311', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sorcha', 'Rosengart', 'srosengartda@sun.com', 'F', '1989-01-03', '40127303399', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dario', 'Hannis', 'dhannisdb@blogspot.com', 'M', '1976-06-24', '96658898344', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Brittni', 'Liles', 'blilesdc@nationalgeographic.com', 'F', '1989-03-29', '49808384488', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Devina', 'Ellingford', 'dellingforddd@hostgator.com', 'F', '1975-09-07', '43592739911', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Antonella', 'Feilden', 'afeildende@economist.com', 'F', '1973-08-28', '38846872555', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gisela', 'Halcro', 'ghalcrodf@si.edu', 'F', '1975-10-29', '91413042844', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Benedict', 'Snookes', 'bsnookesdg@drupal.org', 'M', '1987-10-18', '02135006988', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Maddi', 'Bootyman', 'mbootymandh@ucsd.edu', 'F', '1989-05-21', '70792487011', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Quinlan', 'Poff', 'qpoffdi@ezinearticles.com', 'M', '1987-01-10', '72550100088', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jerrold', 'Mackrill', 'jmackrilldj@unicef.org', 'M', '1974-01-24', '22774726388', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Blake', 'Teggart', 'bteggartdk@ifeng.com', 'M', '1990-05-29', '77041011100', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tamma', 'Marsden', 'tmarsdendl@jigsy.com', 'F', '1973-01-21', '83710057333', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rozina', 'Cowdray', 'rcowdraydm@joomla.org', 'F', '1975-02-08', '74420644855', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Brewer', 'Giacomuzzi', 'bgiacomuzzidn@stumbleupon.com', 'M', '1978-08-24', '49689691633', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hubert', 'Manthroppe', 'hmanthroppedo@bravesites.com', 'M', '1985-07-14', '17565441233', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Benedikta', 'Plumm', 'bplummdp@illinois.edu', 'F', '1987-06-26', '17878132588', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Berky', 'Lamps', 'blampsdq@nature.com', 'M', '1987-05-21', '44745538611', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lovell', 'Stepney', 'lstepneydr@google.de', 'M', '1974-12-30', '16547604200', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Eilis', 'Clingoe', 'eclingoeds@com.com', 'F', '1981-04-06', '09295393544', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Laurent', 'Starling', 'lstarlingdt@barnesandnoble.com', 'M', '1985-10-12', '32218325755', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Roarke', 'Roseborough', 'rroseboroughdu@prweb.com', 'M', '1971-11-20', '87285264222', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Flori', 'Oubridge', 'foubridgedv@rambler.ru', 'F', '1984-11-19', '27466245400', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Haley', 'Matteris', 'hmatterisdw@dmoz.org', 'F', '1979-12-13', '61287142500', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dell', 'Methven', 'dmethvendx@surveymonkey.com', 'M', '1971-10-22', '55692820922', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Loren', 'Sweatland', 'lsweatlanddy@booking.com', 'M', '1983-09-17', '55045107400', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Donella', 'Coatman', 'dcoatmandz@fastcompany.com', 'F', '1977-09-17', '93157122777', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Andrei', 'Filppetti', 'afilppettie0@wix.com', 'F', '1973-02-28', '42612307200', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Greer', 'Izhaky', 'gizhakye1@buzzfeed.com', 'F', '1976-06-14', '76592751199', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Torey', 'Rao', 'traoe2@google.co.uk', 'F', '1981-07-06', '79019946655', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Pincus', 'Whitwood', 'pwhitwoode3@prlog.org', 'M', '1970-10-04', '49250855222', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Curtice', 'Orriss', 'corrisse4@lulu.com', 'M', '1986-10-22', '22046658199', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rosamond', 'Pennings', 'rpenningse5@freewebs.com', 'F', '1986-06-07', '57548412055', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Paula', 'Sreenan', 'psreenane6@dedecms.com', 'F', '1971-12-05', '81176622722', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mick', 'Meates', 'mmeatese7@jimdo.com', 'M', '1986-04-25', '78429069988', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Homere', 'Kleen', 'hkleene8@deliciousdays.com', 'M', '1977-10-03', '92695218422', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gillian', 'Barajaz', 'gbarajaze9@unblog.fr', 'F', '1987-12-08', '28548902488', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kameko', 'Burtwhistle', 'kburtwhistleea@cdbaby.com', 'F', '1978-09-25', '06915499900', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Fidel', 'Heggs', 'fheggseb@wiley.com', 'M', '1985-06-09', '16159437066', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Johnath', 'Rimer', 'jrimerec@ebay.com', 'F', '1981-07-05', '84005636899', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Link', 'Woodfin', 'lwoodfined@comcast.net', 'M', '1981-08-02', '54271005477', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Horacio', 'Mealand', 'hmealandee@cafepress.com', 'M', '1983-06-04', '41958898988', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Talbert', 'Palomba', 'tpalombaef@baidu.com', 'M', '1979-11-08', '16101828633', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ezri', 'Mayworth', 'emaywortheg@hexun.com', 'M', '1977-09-17', '53417769177', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sax', 'Ervine', 'servineeh@webs.com', 'M', '1986-08-24', '04884898811', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rozanne', 'Guynemer', 'rguynemerei@aboutads.info', 'F', '1974-05-28', '01182634200', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bibby', 'Pontin', 'bpontinej@usa.gov', 'F', '1986-02-02', '50405102766', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Valene', 'Foxwell', 'vfoxwellek@hubpages.com', 'F', '1975-02-08', '74427190155', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sancho', 'O''Caine', 'socaineel@va.gov', 'M', '1971-09-08', '09730790455', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lind', 'Weir', 'lweirem@nifty.com', 'M', '1980-10-28', '14914996644', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Patton', 'Goshawke', 'pgoshawkeen@cisco.com', 'M', '1970-07-25', '03829381000', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Merrile', 'Cansdill', 'mcansdilleo@hugedomains.com', 'F', '1977-03-09', '15344564066', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jorry', 'Sommersett', 'jsommersettep@smugmug.com', 'F', '1970-01-08', '00976236877', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Artemis', 'Peachment', 'apeachmenteq@sbwire.com', 'M', '1985-08-23', '60377401199', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hayyim', 'Klos', 'hkloser@sciencedirect.com', 'M', '1980-07-16', '63117961555', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Elliott', 'Bastistini', 'ebastistinies@purevolume.com', 'M', '1989-07-04', '80818981900', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Wood', 'Lambotin', 'wlambotinet@berkeley.edu', 'M', '1982-04-18', '58479858000', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Paulita', 'Higgoe', 'phiggoeeu@vinaora.com', 'F', '1988-08-24', '46229463944', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dyane', 'Allcroft', 'dallcroftev@cbc.ca', 'F', '1982-01-27', '05786464200', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nicolis', 'Stockdale', 'nstockdaleew@parallels.com', 'M', '1974-10-01', '21930746311', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Eduino', 'Sigfrid', 'esigfridex@chron.com', 'M', '1989-06-02', '41402476066', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nonnah', 'Howgill', 'nhowgilley@freewebs.com', 'F', '1970-01-02', '56255514722', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Katuscha', 'Clancey', 'kclanceyez@redcross.org', 'F', '1986-01-31', '87157414355', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hastie', 'Whinney', 'hwhinneyf0@t-online.de', 'M', '1985-04-08', '71652638299', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Betty', 'Fothergill', 'bfothergillf1@prnewswire.com', 'F', '1986-05-10', '39759660255', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Querida', 'Boog', 'qboogf2@studiopress.com', 'F', '1982-11-05', '38245546233', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lil', 'St Ange', 'lstangef3@blinklist.com', 'F', '1986-04-30', '21105217400', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kassey', 'Hazle', 'khazlef4@acquirethisname.com', 'F', '1977-12-12', '53535567711', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Allyn', 'Mitrikhin', 'amitrikhinf5@jugem.jp', 'F', '1971-04-07', '80132344522', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rubina', 'Bayfield', 'rbayfieldf6@cyberchimps.com', 'F', '1986-11-05', '67832932700', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gilly', 'Tomaini', 'gtomainif7@salon.com', 'F', '1990-07-20', '42307259811', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Inigo', 'Corrao', 'icorraof8@springer.com', 'M', '1973-12-25', '14107826899', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Simona', 'Dumper', 'sdumperf9@dailymotion.com', 'F', '1988-08-07', '44075112066', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gretta', 'Andrus', 'gandrusfa@slate.com', 'F', '1979-02-02', '63360600122', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Thane', 'Grieve', 'tgrievefb@columbia.edu', 'M', '1986-02-01', '84887201499', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Frasier', 'Goldes', 'fgoldesfc@deviantart.com', 'M', '1972-06-17', '41465429366', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Clarissa', 'Arro', 'carrofd@simplemachines.org', 'F', '1987-08-21', '89029256766', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Granville', 'Schreurs', 'gschreursfe@dyndns.org', 'M', '1974-06-17', '27886625211', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kele', 'Andrasch', 'kandraschff@mapquest.com', 'M', '1971-03-17', '77821523644', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Daisey', 'Shiel', 'dshielfg@uiuc.edu', 'F', '1971-11-02', '43633053399', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ernesto', 'Stapley', 'estapleyfh@nba.com', 'M', '1988-12-20', '85637799077', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lianne', 'Asser', 'lasserfi@apple.com', 'F', '1975-02-18', '29093026799', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rozele', 'Truin', 'rtruinfj@blogger.com', 'F', '1973-08-25', '83569715433', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Valencia', 'Petts', 'vpettsfk@people.com.cn', 'F', '1979-10-10', '68908560077', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Fidel', 'Monkley', 'fmonkleyfl@guardian.co.uk', 'M', '1980-07-07', '83788798366', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rora', 'Saffen', 'rsaffenfm@merriam-webster.com', 'F', '1989-02-07', '96589912977', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carolina', 'Thackham', 'cthackhamfn@comsenz.com', 'F', '1984-05-08', '93337429800', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tomasina', 'Dowson', 'tdowsonfo@dell.com', 'F', '1976-03-04', '77449938299', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gaylene', 'Byrcher', 'gbyrcherfp@mapquest.com', 'F', '1978-02-02', '69597256311', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Matthiew', 'Olivetti', 'molivettifq@e-recht24.de', 'M', '1978-09-10', '49770132044', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Garvy', 'Antic', 'ganticfr@google.ca', 'M', '1984-02-14', '27335897844', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dorelle', 'Lange', 'dlangefs@linkedin.com', 'F', '1971-03-14', '93766958288', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cara', 'Fomichyov', 'cfomichyovft@posterous.com', 'F', '1989-02-12', '39846424744', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Raquela', 'Allery', 'ralleryfu@illinois.edu', 'F', '1988-12-21', '07948531966', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Fred', 'Joubert', 'fjoubertfv@ameblo.jp', 'M', '1986-11-13', '98670865388', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Vinita', 'Gauch', 'vgauchfw@patch.com', 'F', '1986-11-05', '74440639155', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lorrayne', 'McCluney', 'lmccluneyfx@aol.com', 'F', '1978-04-24', '91488109244', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lisle', 'La Rosa', 'llarosafy@tmall.com', 'M', '1971-12-10', '35820145255', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rees', 'Cicerone', 'rciceronefz@squidoo.com', 'M', '1977-10-29', '06331782688', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Wilbert', 'Werndley', 'wwerndleyg0@github.io', 'M', '1971-06-04', '58190869377', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Allyn', 'Janikowski', 'ajanikowskig1@cafepress.com', 'M', '1976-03-17', '65073350299', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cordie', 'Leap', 'cleapg2@deviantart.com', 'M', '1972-04-08', '76948957722', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Paolo', 'Rawstorne', 'prawstorneg3@wisc.edu', 'M', '1982-07-06', '90600630233', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Odell', 'Rubi', 'orubig4@yale.edu', 'M', '1970-07-08', '28211342311', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Raye', 'Curle', 'rcurleg5@goo.gl', 'F', '1974-10-08', '34423202599', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Fons', 'Burkert', 'fburkertg6@usnews.com', 'M', '1974-02-28', '05380576377', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Yasmin', 'Ruslin', 'yrusling7@princeton.edu', 'F', '1982-11-21', '54520817988', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Goober', 'Siley', 'gsileyg8@jigsy.com', 'M', '1975-06-28', '82854087522', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Wash', 'Wiltshaw', 'wwiltshawg9@ca.gov', 'M', '1978-07-28', '46247853633', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Karia', 'Kauffman', 'kkauffmanga@miibeian.gov.cn', 'F', '1979-04-20', '33488645422', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kellsie', 'Ebunoluwa', 'kebunoluwagb@unblog.fr', 'F', '1971-06-25', '41940847722', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carlynne', 'Maides', 'cmaidesgc@slideshare.net', 'F', '1985-11-22', '84765421199', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Glenda', 'Trevor', 'gtrevorgd@desdev.cn', 'F', '1983-10-15', '43148743411', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cyril', 'Buey', 'cbueyge@howstuffworks.com', 'M', '1978-08-23', '01117761988', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Felisha', 'Ojeda', 'fojedagf@wunderground.com', 'F', '1985-11-01', '83894733211', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carmella', 'Vasichev', 'cvasichevgg@list-manage.com', 'F', '1990-11-26', '30341548522', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ruddy', 'Tunnicliff', 'rtunnicliffgh@walmart.com', 'M', '1984-07-27', '81800459511', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Chev', 'Aronstam', 'caronstamgi@skyrock.com', 'M', '1978-05-26', '96698622488', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kaylil', 'Cartledge', 'kcartledgegj@domainmarket.com', 'F', '1979-02-19', '44259960700', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Corrie', 'Cranham', 'ccranhamgk@youtube.com', 'M', '1987-06-09', '56727321866', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Elwin', 'Prinnett', 'eprinnettgl@ft.com', 'M', '1972-03-16', '09747472544', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cammi', 'Seefus', 'cseefusgm@yolasite.com', 'F', '1990-01-27', '63521491622', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Haskell', 'Bamblett', 'hbamblettgn@networkadvertising.org', 'M', '1981-03-15', '22913805599', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tawnya', 'Guinane', 'tguinanego@fda.gov', 'F', '1971-12-01', '95756302899', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dewey', 'Schonfeld', 'dschonfeldgp@netvibes.com', 'M', '1972-07-03', '63112801322', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Caria', 'Endrighi', 'cendrighigq@domainmarket.com', 'F', '1985-08-21', '25886259400', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Halli', 'McDugal', 'hmcdugalgr@economist.com', 'F', '1988-07-04', '38544023411', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Holli', 'Betonia', 'hbetoniags@nbcnews.com', 'F', '1976-01-15', '33874913600', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Even', 'Rylatt', 'erylattgt@amazon.de', 'M', '1987-06-23', '35196108255', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sibyl', 'Backshall', 'sbackshallgu@ft.com', 'F', '1971-06-17', '44247062577', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Malcolm', 'Endersby', 'mendersbygv@webs.com', 'M', '1971-04-16', '27547685722', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Benita', 'Pretty', 'bprettygw@pen.io', 'F', '1978-08-16', '53305318377', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cecilius', 'Welland', 'cwellandgx@hostgator.com', 'M', '1984-06-13', '54157423955', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Shanna', 'Glinde', 'sglindegy@issuu.com', 'F', '1972-11-14', '50351689999', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Chelsey', 'Chelam', 'cchelamgz@newyorker.com', 'F', '1990-06-23', '19199173222', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Karoly', 'Gabites', 'kgabitesh0@china.com.cn', 'M', '1979-09-01', '27334357444', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bard', 'Lovelock', 'blovelockh1@about.me', 'M', '1984-03-15', '86513284433', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lydie', 'Proppers', 'lproppersh2@flavors.me', 'F', '1974-08-02', '41836915244', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Johnath', 'Guiel', 'jguielh3@seesaa.net', 'F', '1981-05-26', '86844705322', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Iain', 'Waberer', 'iwabererh4@dagondesign.com', 'M', '1971-04-28', '50431467611', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Heloise', 'Kingswoode', 'hkingswoodeh5@yandex.ru', 'F', '1981-11-04', '07151692466', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rasla', 'Blackmuir', 'rblackmuirh6@state.gov', 'F', '1981-12-25', '90791762300', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cynthia', 'Buston', 'cbustonh7@over-blog.com', 'F', '1983-07-03', '19649446000', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Alwin', 'Chippendale', 'achippendaleh8@adobe.com', 'M', '1990-06-28', '92951025922', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cornie', 'Moring', 'cmoringh9@photobucket.com', 'M', '1977-11-02', '99328247122', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Madeline', 'Latey', 'mlateyha@salon.com', 'F', '1978-06-02', '78004901144', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lorant', 'Capp', 'lcapphb@wikispaces.com', 'M', '1987-12-19', '46286798355', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Valeda', 'Cane', 'vcanehc@mozilla.com', 'F', '1970-06-04', '68488069277', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Pernell', 'Bordone', 'pbordonehd@wix.com', 'M', '1985-08-04', '94522176855', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bamby', 'Alywin', 'balywinhe@chicagotribune.com', 'F', '1980-04-20', '31747264333', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Abram', 'Benardeau', 'abenardeauhf@cdbaby.com', 'M', '1988-06-26', '07720482822', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Birk', 'Camidge', 'bcamidgehg@hud.gov', 'M', '1990-03-06', '95278891111', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marcos', 'Dowrey', 'mdowreyhh@smh.com.au', 'M', '1984-07-15', '83670121277', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marya', 'Wakelin', 'mwakelinhi@chron.com', 'F', '1970-03-07', '25623735022', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Austin', 'Peachman', 'apeachmanhj@harvard.edu', 'M', '1971-01-12', '83702316244', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mendy', 'Dillaway', 'mdillawayhk@netlog.com', 'M', '1971-04-26', '99180172444', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Karole', 'Clemmen', 'kclemmenhl@smh.com.au', 'F', '1978-09-08', '83078657277', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Archambault', 'Dincke', 'adinckehm@quantcast.com', 'M', '1971-05-26', '70700734377', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ragnar', 'Dilgarno', 'rdilgarnohn@fotki.com', 'M', '1979-05-08', '63182575199', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Wakefield', 'Latliff', 'wlatliffho@scientificamerican.com', 'M', '1986-04-24', '33661920622', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Chaunce', 'Poveleye', 'cpoveleyehp@i2i.jp', 'M', '1985-04-07', '69372346788', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Timotheus', 'Hekkert', 'thekkerthq@weebly.com', 'M', '1985-03-26', '25097964377', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Emelda', 'Druce', 'edrucehr@independent.co.uk', 'F', '1974-10-22', '89079685866', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mira', 'Kellart', 'mkellarths@ox.ac.uk', 'F', '1985-12-03', '21808295311', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tamera', 'Boylund', 'tboylundht@google.co.jp', 'F', '1971-12-17', '23142442811', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Di', 'Ovesen', 'dovesenhu@photobucket.com', 'F', '1974-08-05', '99424173899', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Amery', 'Popescu', 'apopescuhv@jiathis.com', 'M', '1982-09-28', '50319881344', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Brucie', 'O''Cuddie', 'bocuddiehw@newyorker.com', 'M', '1980-06-03', '98035671955', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Clary', 'Feehely', 'cfeehelyhx@printfriendly.com', 'F', '1974-03-09', '75730044000', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Riobard', 'Motion', 'rmotionhy@wikia.com', 'M', '1985-12-31', '53161385899', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Verne', 'Romeo', 'vromeohz@youku.com', 'M', '1984-01-13', '75182202533', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Minne', 'Iliff', 'miliffi0@woothemes.com', 'F', '1982-05-12', '68695637999', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bell', 'Bentham', 'bbenthami1@pen.io', 'F', '1987-01-29', '06855348122', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ursula', 'McMeekin', 'umcmeekini2@com.com', 'F', '1976-12-24', '86330931977', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sigrid', 'Leschelle', 'sleschellei3@artisteer.com', 'F', '1975-11-26', '07687893111', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Fara', 'Dewire', 'fdewirei4@w3.org', 'F', '1973-02-15', '96621682066', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Opal', 'Monckton', 'omoncktoni5@berkeley.edu', 'F', '1976-05-18', '96642373377', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Virgina', 'Coltman', 'vcoltmani6@hibu.com', 'F', '1985-07-05', '69767851755', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Constantine', 'Kauble', 'ckaublei7@canalblog.com', 'M', '1974-10-18', '42798382755', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Janifer', 'Kernock', 'jkernocki8@ucla.edu', 'F', '1975-04-03', '82057342833', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Clara', 'Cawthra', 'ccawthrai9@ow.ly', 'F', '1979-07-28', '87902149788', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Merridie', 'Weller', 'mwelleria@mayoclinic.com', 'F', '1970-07-20', '85696350955', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kermie', 'Zamora', 'kzamoraib@telegraph.co.uk', 'M', '1982-06-20', '81325776399', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Chester', 'Ziem', 'cziemic@hao123.com', 'M', '1986-02-09', '71851603755', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Myles', 'Duffield', 'mduffieldid@github.com', 'M', '1988-12-09', '75178448499', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dag', 'Pacquet', 'dpacquetie@yellowbook.com', 'M', '1977-04-07', '80024058622', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Andras', 'Davall', 'adavallif@blogs.com', 'M', '1987-09-20', '91113130566', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('George', 'Rowaszkiewicz', 'growaszkiewiczig@fda.gov', 'F', '1974-12-21', '41418695622', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Margy', 'Gainsborough', 'mgainsboroughih@over-blog.com', 'F', '1973-10-30', '98647703300', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Foster', 'Cossey', 'fcosseyii@spiegel.de', 'M', '1976-03-12', '70572307100', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Erie', 'Garrett', 'egarrettij@earthlink.net', 'M', '1983-01-21', '26420843611', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Fifi', 'Trounce', 'ftrounceik@tinyurl.com', 'F', '1983-01-11', '19312249277', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Stan', 'Gamlin', 'sgamlinil@adobe.com', 'M', '1980-01-07', '18983960866', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Prentiss', 'Feighney', 'pfeighneyim@loc.gov', 'M', '1972-10-09', '32191619011', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Harper', 'Ashington', 'hashingtonin@seattletimes.com', 'M', '1977-11-21', '92484595955', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Amos', 'Romanini', 'aromaniniio@altervista.org', 'M', '1971-12-03', '44816090600', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Catlee', 'Rives', 'crivesip@about.com', 'F', '1983-05-11', '17807658433', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gordy', 'Bedle', 'gbedleiq@microsoft.com', 'M', '1970-12-28', '71708053755', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Clarice', 'Northwood', 'cnorthwoodir@blogs.com', 'F', '1985-12-03', '58590653455', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Raimundo', 'Digby', 'rdigbyis@paginegialle.it', 'M', '1989-09-08', '45313491999', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jackie', 'Lalonde', 'jlalondeit@prlog.org', 'M', '1972-09-07', '34315841366', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Arvin', 'Lock', 'alockiu@mapy.cz', 'M', '1985-04-15', '12464431044', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marcello', 'Bonifant', 'mbonifantiv@twitpic.com', 'M', '1973-10-09', '59706402044', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Elane', 'Ayto', 'eaytoiw@ezinearticles.com', 'F', '1975-05-25', '35889101588', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Zarla', 'Jiras', 'zjirasix@gizmodo.com', 'F', '1977-09-17', '38254817433', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ellwood', 'Epple', 'eeppleiy@qq.com', 'M', '1978-04-13', '61185140899', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Flory', 'Lippitt', 'flippittiz@marriott.com', 'F', '1974-06-29', '26793400000', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Stephi', 'Prince', 'sprincej0@barnesandnoble.com', 'F', '1988-08-30', '41926965177', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Germaine', 'Parlot', 'gparlotj1@sourceforge.net', 'M', '1979-12-09', '58600706911', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ricki', 'Ogbourne', 'rogbournej2@ebay.com', 'F', '1985-05-12', '52028809955', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ilysa', 'Foulstone', 'ifoulstonej3@amazon.co.uk', 'F', '1979-03-20', '83597007966', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Northrup', 'Birtley', 'nbirtleyj4@gmpg.org', 'M', '1985-05-26', '99677718877', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dermot', 'Hardaway', 'dhardawayj5@canalblog.com', 'M', '1979-10-20', '42118448222', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Isidoro', 'Davydkov', 'idavydkovj6@parallels.com', 'M', '1971-12-30', '98469092766', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Onfroi', 'Patrono', 'opatronoj7@friendfeed.com', 'M', '1974-06-25', '81061526699', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Haze', 'Wolfindale', 'hwolfindalej8@reddit.com', 'M', '1972-03-17', '04437134211', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Delmer', 'Hogsden', 'dhogsdenj9@icio.us', 'M', '1972-02-07', '61510727900', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marcello', 'Schimpke', 'mschimpkeja@sphinn.com', 'M', '1980-01-29', '76493247022', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Etty', 'Downgate', 'edowngatejb@ox.ac.uk', 'F', '1987-04-27', '14297145811', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Evan', 'Goaks', 'egoaksjc@noaa.gov', 'M', '1983-12-10', '62229969655', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Claybourne', 'Raywood', 'craywoodjd@artisteer.com', 'M', '1978-08-14', '08990388322', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cobbie', 'Walklate', 'cwalklateje@wix.com', 'M', '1984-06-03', '49957436344', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nicolai', 'Paule', 'npaulejf@berkeley.edu', 'M', '1985-02-15', '08871096599', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Felipa', 'Seville', 'fsevillejg@indiatimes.com', 'F', '1977-07-17', '30679630755', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Auria', 'Turbat', 'aturbatjh@cmu.edu', 'F', '1976-05-28', '60677137133', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Isidore', 'Shillitoe', 'ishillitoeji@cnet.com', 'M', '1976-05-11', '39244927000', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Farleigh', 'Antcliff', 'fantcliffjj@columbia.edu', 'M', '1980-04-02', '97987457522', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Howard', 'Million', 'hmillionjk@illinois.edu', 'M', '1980-08-21', '44572439222', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nessy', 'Syphus', 'nsyphusjl@nba.com', 'F', '1981-08-07', '09224344333', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Vonny', 'Tidbold', 'vtidboldjm@tripadvisor.com', 'F', '1971-02-28', '51500829611', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ambrose', 'Tejada', 'atejadajn@infoseek.co.jp', 'M', '1980-06-13', '82315445500', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Darline', 'Garlick', 'dgarlickjo@feedburner.com', 'F', '1975-11-03', '65253072366', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ugo', 'Banbrick', 'ubanbrickjp@gmpg.org', 'M', '1973-06-26', '76040280200', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marcos', 'Zanussii', 'mzanussiijq@google.pl', 'M', '1989-08-03', '62755974022', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nellie', 'Wickwar', 'nwickwarjr@businessinsider.com', 'F', '1989-02-26', '47426453599', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Elihu', 'Pichmann', 'epichmannjs@bloglines.com', 'M', '1982-03-05', '64390895877', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gilli', 'Haylor', 'ghaylorjt@accuweather.com', 'F', '1980-05-09', '13865447288', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rudolf', 'Selkirk', 'rselkirkju@gnu.org', 'M', '1990-04-09', '79223022588', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bill', 'Wardell', 'bwardelljv@hhs.gov', 'F', '1983-01-08', '66997385699', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hewett', 'Griffen', 'hgriffenjw@blogs.com', 'M', '1990-01-30', '69021543766', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nanete', 'MacGlory', 'nmacgloryjx@webnode.com', 'F', '1971-02-06', '53040346511', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Katheryn', 'Lawles', 'klawlesjy@si.edu', 'F', '1989-11-19', '69051099166', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dione', 'Schmidt', 'dschmidtjz@nsw.gov.au', 'F', '1972-03-09', '62078580699', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hulda', 'Tybalt', 'htybaltk0@aol.com', 'F', '1977-08-11', '53661815699', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Waverley', 'Semark', 'wsemarkk1@omniture.com', 'M', '1980-10-13', '13719639088', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Barn', 'Gunstone', 'bgunstonek2@statcounter.com', 'M', '1982-07-21', '84711340477', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Valaree', 'Shearstone', 'vshearstonek3@harvard.edu', 'F', '1982-02-08', '89072334033', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jonathan', 'Hanretty', 'jhanrettyk4@pbs.org', 'M', '1974-09-18', '96284488466', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Thayne', 'Quilter', 'tquilterk5@odnoklassniki.ru', 'M', '1970-02-13', '82236625822', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Michaela', 'Gavan', 'mgavank6@livejournal.com', 'F', '1978-09-06', '38742781233', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Leigh', 'Manilow', 'lmanilowk7@alibaba.com', 'F', '1976-06-06', '93244170377', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Pierre', 'Reimer', 'preimerk8@cbsnews.com', 'M', '1981-01-11', '23773362211', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cort', 'Seely', 'cseelyk9@yelp.com', 'M', '1986-09-27', '27857122188', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Audrie', 'Phalip', 'aphalipka@adobe.com', 'F', '1972-10-26', '79349242166', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Amii', 'Rubbert', 'arubbertkb@narod.ru', 'F', '1976-01-02', '29245452699', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Elena', 'Mustchin', 'emustchinkc@google.com', 'F', '1976-04-24', '75514757022', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sergent', 'Heinel', 'sheinelkd@ovh.net', 'M', '1979-10-17', '57602416488', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mikol', 'Du Plantier', 'mduplantierke@upenn.edu', 'M', '1986-09-08', '63113492722', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lynne', 'Lorraine', 'llorrainekf@sciencedaily.com', 'F', '1990-04-13', '48227386711', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sigrid', 'Jachimak', 'sjachimakkg@google.co.uk', 'F', '1985-06-28', '06860193422', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Shirley', 'Haborn', 'shabornkh@cafepress.com', 'F', '1971-10-18', '63978084400', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Osbourne', 'M''Chirrie', 'omchirrieki@yellowpages.com', 'M', '1981-09-09', '89070202488', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kelbee', 'Aulds', 'kauldskj@com.com', 'M', '1979-11-25', '56919502588', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Pebrook', 'Thunnercliff', 'pthunnercliffkk@eepurl.com', 'M', '1990-02-16', '33158869700', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ernestine', 'Spadaro', 'espadarokl@nba.com', 'F', '1978-07-15', '93867073144', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tuesday', 'Talboy', 'ttalboykm@mac.com', 'F', '1979-07-01', '87540450299', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Julian', 'Dax', 'jdaxkn@mayoclinic.com', 'M', '1970-12-20', '77392790999', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Vivian', 'Trusdale', 'vtrusdaleko@ezinearticles.com', 'F', '1990-03-03', '67921142866', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Wendell', 'Adkin', 'wadkinkp@youku.com', 'M', '1984-06-16', '67820780311', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Basilio', 'Matula', 'bmatulakq@people.com.cn', 'M', '1982-01-02', '58179354655', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Luigi', 'Qusklay', 'lqusklaykr@acquirethisname.com', 'M', '1985-02-17', '36479767411', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Franky', 'Turfs', 'fturfsks@tinyurl.com', 'F', '1981-02-10', '20719474011', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jerome', 'Maltman', 'jmaltmankt@ning.com', 'M', '1979-09-06', '00558704300', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Thornie', 'Chellam', 'tchellamku@upenn.edu', 'M', '1983-04-30', '11294259911', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carl', 'Burns', 'cburnskv@instagram.com', 'M', '1984-01-03', '59886570955', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kare', 'Lehr', 'klehrkw@reverbnation.com', 'F', '1975-06-15', '21938530888', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ettie', 'Uden', 'eudenkx@ustream.tv', 'F', '1979-02-22', '03530141255', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Vanda', 'Sturdey', 'vsturdeyky@friendfeed.com', 'F', '1972-10-29', '75913026477', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Aggie', 'Reuven', 'areuvenkz@simplemachines.org', 'F', '1978-05-31', '79387556211', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cordy', 'Attridge', 'cattridgel0@sakura.ne.jp', 'F', '1990-11-06', '00033902688', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Desi', 'Vosper', 'dvosperl1@ycombinator.com', 'M', '1989-01-15', '86427943488', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Derrik', 'Shakelade', 'dshakeladel2@miitbeian.gov.cn', 'M', '1980-10-23', '16287322611', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Elmore', 'Harlowe', 'eharlowel3@webnode.com', 'M', '1984-04-01', '49168057044', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bastian', 'Boakes', 'bboakesl4@psu.edu', 'M', '1975-11-15', '99321345544', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Skipton', 'Kira', 'skiral5@umn.edu', 'M', '1990-08-30', '04583360922', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carmelia', 'Steagall', 'csteagalll6@chron.com', 'F', '1978-07-16', '55538707477', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rabbi', 'Mc Combe', 'rmccombel7@princeton.edu', 'M', '1982-01-15', '70797088422', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dalston', 'Lamplough', 'dlamploughl8@about.me', 'M', '1977-04-27', '38221762811', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Calv', 'Ashworth', 'cashworthl9@deviantart.com', 'M', '1975-06-29', '06289065600', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Vladimir', 'Foat', 'vfoatla@linkedin.com', 'M', '1983-08-11', '14872277288', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Clarita', 'Kinnach', 'ckinnachlb@amazon.co.uk', 'F', '1976-02-07', '42155508077', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Angelika', 'Hulle', 'ahullelc@cocolog-nifty.com', 'F', '1988-06-19', '38741112966', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Daron', 'Roust', 'droustld@trellian.com', 'M', '1975-07-25', '25315795088', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Wyatt', 'Battison', 'wbattisonle@squidoo.com', 'M', '1981-10-06', '57272085800', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Andra', 'Laurentin', 'alaurentinlf@walmart.com', 'F', '1972-06-28', '75676297711', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marillin', 'Karolewski', 'mkarolewskilg@google.ca', 'F', '1971-02-27', '69987440211', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jo-ann', 'Olekhov', 'jolekhovlh@google.ca', 'F', '1987-06-05', '12878803633', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gerri', 'Martschke', 'gmartschkeli@aol.com', 'F', '1987-11-13', '29249244211', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Clemente', 'Forst', 'cforstlj@aboutads.info', 'M', '1979-09-06', '13136514277', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hervey', 'Passby', 'hpassbylk@harvard.edu', 'M', '1971-04-25', '26469230666', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dante', 'Moles', 'dmolesll@mit.edu', 'M', '1975-10-28', '66167306388', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Moise', 'Clymer', 'mclymerlm@toplist.cz', 'M', '1978-08-14', '61440517088', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jean', 'Bruhke', 'jbruhkeln@ibm.com', 'F', '1975-09-10', '92949578966', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Giacobo', 'Wallicker', 'gwallickerlo@squarespace.com', 'M', '1971-08-19', '53179102777', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Abbie', 'Cheke', 'achekelp@cisco.com', 'F', '1987-12-18', '61604638455', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nanette', 'Howick', 'nhowicklq@vk.com', 'F', '1982-02-09', '47069567144', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Claudine', 'Figgess', 'cfiggesslr@tiny.cc', 'F', '1976-03-21', '60290602955', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lowell', 'Brodbin', 'lbrodbinls@auda.org.au', 'M', '1984-07-10', '84854894977', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Viv', 'Blamire', 'vblamirelt@intel.com', 'F', '1983-01-20', '83066670188', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lotte', 'Bish', 'lbishlu@msn.com', 'F', '1971-09-19', '02809374311', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Guglielmo', 'Daouse', 'gdaouselv@g.co', 'M', '1983-08-26', '25177644411', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marianne', 'Keay', 'mkeaylw@quantcast.com', 'F', '1980-03-14', '80935892600', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carmelina', 'Thews', 'cthewslx@ox.ac.uk', 'F', '1975-10-12', '74241325477', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Will', 'Lindl', 'wlindlly@howstuffworks.com', 'M', '1970-03-02', '51912134911', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Heddi', 'Dury', 'hdurylz@unicef.org', 'F', '1983-01-05', '20460006099', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sunshine', 'Heaseman', 'sheasemanm0@squarespace.com', 'F', '1986-10-05', '14185680900', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Alfonso', 'Cottier', 'acottierm1@zimbio.com', 'M', '1985-11-21', '91267787699', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kiah', 'Dewfall', 'kdewfallm2@dailymail.co.uk', 'F', '1975-02-21', '83103707922', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dawn', 'Tidswell', 'dtidswellm3@indiatimes.com', 'F', '1978-08-07', '22228211699', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kattie', 'Daingerfield', 'kdaingerfieldm4@tripadvisor.com', 'F', '1979-02-06', '51573320411', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Scotti', 'Brigstock', 'sbrigstockm5@japanpost.jp', 'M', '1974-03-04', '12989032622', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ashleigh', 'Van den Dael', 'avandendaelm6@wsj.com', 'F', '1975-04-10', '26980416922', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Trefor', 'Casaccia', 'tcasacciam7@imdb.com', 'M', '1977-05-30', '16328633755', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ade', 'Rostron', 'arostronm8@oaic.gov.au', 'M', '1989-09-03', '50727784600', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Samantha', 'Jouannot', 'sjouannotm9@altervista.org', 'F', '1979-07-25', '91973495344', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Conrado', 'Abdie', 'cabdiema@census.gov', 'M', '1984-05-25', '84252970288', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Darelle', 'Brownsey', 'dbrownseymb@wikimedia.org', 'F', '1972-06-05', '23821576233', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gillan', 'Worsalls', 'gworsallsmc@fc2.com', 'F', '1971-12-13', '58670232066', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nicoline', 'Hathorn', 'nhathornmd@examiner.com', 'F', '1982-09-05', '98649955377', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Verene', 'Steggles', 'vstegglesme@blogger.com', 'F', '1981-12-17', '17722610177', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sunny', 'Neylan', 'sneylanmf@ftc.gov', 'F', '1970-05-08', '36928782577', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bing', 'Petersen', 'bpetersenmg@nydailynews.com', 'M', '1981-05-11', '84866020844', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Giuditta', 'Cushelly', 'gcushellymh@youtu.be', 'F', '1972-10-26', '90697643344', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Alexine', 'Gillbee', 'agillbeemi@discuz.net', 'F', '1978-05-16', '42749547499', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Haskell', 'Rouby', 'hroubymj@amazon.de', 'M', '1986-07-10', '34813981077', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Glenine', 'Penniall', 'gpenniallmk@topsy.com', 'F', '1977-01-30', '20058310855', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Brenna', 'Trengrove', 'btrengroveml@jalbum.net', 'F', '1978-01-10', '44709246877', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nolan', 'Hadlee', 'nhadleemm@squarespace.com', 'M', '1982-12-21', '55629284500', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Anallese', 'Sinkinson', 'asinkinsonmn@tmall.com', 'F', '1976-11-18', '55923753011', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Shelli', 'Sokill', 'ssokillmo@reuters.com', 'F', '1976-09-13', '42882161333', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Darci', 'Oxburgh', 'doxburghmp@state.tx.us', 'F', '1975-09-27', '92631194144', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tommie', 'Crack', 'tcrackmq@oakley.com', 'M', '1973-05-17', '48607413900', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ajay', 'Midlane', 'amidlanemr@redcross.org', 'F', '1972-12-25', '46975449277', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nikolai', 'Buswell', 'nbuswellms@booking.com', 'M', '1972-07-03', '23977576211', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nigel', 'Fripps', 'nfrippsmt@clickbank.net', 'M', '1986-12-06', '54861160477', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Merwyn', 'Ottee', 'motteemu@va.gov', 'M', '1970-05-25', '60829719733', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rozele', 'Glisane', 'rglisanemv@newsvine.com', 'F', '1986-07-05', '33853035166', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tessa', 'Manuel', 'tmanuelmw@youtube.com', 'F', '1990-09-29', '18336917844', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Barron', 'Ewer', 'bewermx@businessinsider.com', 'M', '1987-11-19', '34545300755', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Pet', 'Meaking', 'pmeakingmy@nbcnews.com', 'F', '1978-01-17', '79713665744', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bancroft', 'Inkin', 'binkinmz@tamu.edu', 'M', '1990-09-05', '48097153299', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Robin', 'Amy', 'ramyn0@hao123.com', 'M', '1985-12-11', '03477053166', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Vallie', 'Kohlerman', 'vkohlermann1@bigcartel.com', 'F', '1970-08-16', '76322066122', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Zedekiah', 'Wayt', 'zwaytn2@ca.gov', 'M', '1982-06-17', '01791769199', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ede', 'Laughnan', 'elaughnann3@goodreads.com', 'F', '1990-11-29', '91185438044', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Theo', 'Chittem', 'tchittemn4@ning.com', 'F', '1988-12-08', '62444619755', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Matteo', 'Colebourne', 'mcolebournen5@wikimedia.org', 'M', '1988-03-12', '26445969988', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Asa', 'Sher', 'ashern6@cloudflare.com', 'M', '1973-04-26', '15658438866', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Wynn', 'Gretton', 'wgrettonn7@cnbc.com', 'M', '1989-04-01', '65185026144', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cele', 'Randales', 'crandalesn8@is.gd', 'F', '1970-04-21', '62944696788', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Noni', 'Malby', 'nmalbyn9@rakuten.co.jp', 'F', '1980-01-24', '95629250055', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Petronia', 'Childers', 'pchildersna@mayoclinic.com', 'F', '1975-02-10', '63526179722', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nadya', 'Walshaw', 'nwalshawnb@archive.org', 'F', '1971-07-09', '20967061499', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kaleb', 'Neild', 'kneildnc@mysql.com', 'M', '1979-04-06', '83605802355', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Patin', 'Gerred', 'pgerrednd@acquirethisname.com', 'M', '1974-08-06', '76585820188', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Wilmer', 'Kraut', 'wkrautne@ehow.com', 'M', '1976-03-22', '83311606733', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Moshe', 'Wragg', 'mwraggnf@xrea.com', 'M', '1972-04-27', '48309916077', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Linoel', 'Ewbanke', 'lewbankeng@blogtalkradio.com', 'M', '1978-01-09', '30048328366', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Elberta', 'Rikkard', 'erikkardnh@ask.com', 'F', '1987-01-17', '61293338977', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cyndia', 'Swindell', 'cswindellni@ed.gov', 'F', '1988-10-01', '76569492677', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Barris', 'Grocott', 'bgrocottnj@chicagotribune.com', 'M', '1972-06-14', '28383515088', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rosmunda', 'Sarton', 'rsartonnk@digg.com', 'F', '1976-03-23', '28399271522', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rudiger', 'Wellings', 'rwellingsnl@wufoo.com', 'M', '1980-02-05', '18884224088', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Maegan', 'Raye', 'mrayenm@tripadvisor.com', 'F', '1982-10-05', '69768790722', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kurtis', 'Duferie', 'kduferienn@myspace.com', 'M', '1988-04-01', '50446878711', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hans', 'Costa', 'hcostano@state.tx.us', 'M', '1971-07-11', '02358699888', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Wilhelmine', 'Ramiro', 'wramironp@liveinternet.ru', 'F', '1972-02-03', '96774641677', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Toddy', 'Chown', 'tchownnq@adobe.com', 'M', '1982-02-08', '47510168300', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Janeva', 'Cheak', 'jcheaknr@etsy.com', 'F', '1987-07-01', '68620039099', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tania', 'Arundel', 'tarundelns@spiegel.de', 'F', '1978-01-11', '41599460466', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Willi', 'Matschuk', 'wmatschuknt@buzzfeed.com', 'M', '1983-11-24', '32952586511', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Worthy', 'Hebbron', 'whebbronnu@163.com', 'M', '1989-08-26', '47405800555', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Rina', 'Paynter', 'rpaynternv@stumbleupon.com', 'F', '1990-11-15', '12385302222', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gerardo', 'Mackness', 'gmacknessnw@examiner.com', 'M', '1977-05-03', '12000093555', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ferdinand', 'McDougall', 'fmcdougallnx@virginia.edu', 'M', '1985-02-01', '09407448488', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hynda', 'Genge', 'hgengeny@telegraph.co.uk', 'F', '1985-02-14', '07786669999', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ninette', 'Espinas', 'nespinasnz@weebly.com', 'F', '1971-03-10', '69913480822', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carlie', 'Haistwell', 'chaistwello0@businessweek.com', 'M', '1977-06-11', '35193186366', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Darby', 'Messenbird', 'dmessenbirdo1@microsoft.com', 'F', '1978-02-27', '17976883599', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carter', 'Dunkerley', 'cdunkerleyo2@a8.net', 'M', '1976-11-21', '68022476233', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Giff', 'Cobain', 'gcobaino3@com.com', 'M', '1970-11-09', '69227362144', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Barnabas', 'Chedgey', 'bchedgeyo4@mayoclinic.com', 'M', '1975-11-12', '25323255933', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bellina', 'Gudgen', 'bgudgeno5@usa.gov', 'F', '1990-07-15', '84814543899', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Willy', 'Drewson', 'wdrewsono6@yolasite.com', 'M', '1983-05-15', '62737181566', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Archambault', 'Van Haeften', 'avanhaefteno7@weibo.com', 'M', '1980-01-17', '82569421266', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Georges', 'Kristufek', 'gkristufeko8@yellowpages.com', 'M', '1973-05-15', '54094161200', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Earle', 'Conlaund', 'econlaundo9@va.gov', 'M', '1970-02-14', '63444965333', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Meredith', 'Kydd', 'mkyddoa@ycombinator.com', 'M', '1972-07-16', '86257689544', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hakeem', 'Threader', 'hthreaderob@pbs.org', 'M', '1970-03-07', '47119167333', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cullin', 'Sandercroft', 'csandercroftoc@github.io', 'M', '1977-12-09', '27235691877', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jackqueline', 'Sayers', 'jsayersod@reference.com', 'F', '1978-07-18', '05718094055', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Christophe', 'Lumly', 'clumlyoe@whitehouse.gov', 'M', '1971-07-03', '97301584011', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Erek', 'Bamford', 'ebamfordof@sourceforge.net', 'M', '1990-10-18', '73571457944', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Chase', 'Chavey', 'cchaveyog@marketwatch.com', 'M', '1988-12-04', '00412834144', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bailie', 'Charker', 'bcharkeroh@thetimes.co.uk', 'M', '1987-12-22', '12415491177', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Orville', 'McBrier', 'omcbrieroi@feedburner.com', 'M', '1977-01-23', '01528074033', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Moss', 'O''Keaveny', 'mokeavenyoj@cornell.edu', 'M', '1990-03-11', '82412897900', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gilberta', 'Tyers', 'gtyersok@yahoo.com', 'F', '1978-08-26', '62781331800', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lara', 'Windress', 'lwindressol@cpanel.net', 'F', '1988-11-02', '30848402100', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Yorgos', 'Blackstock', 'yblackstockom@nytimes.com', 'M', '1979-04-03', '55285276866', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gram', 'Patsall', 'gpatsallon@china.com.cn', 'M', '1972-05-03', '85488811199', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Cinderella', 'Roelvink', 'croelvinkoo@ezinearticles.com', 'F', '1981-02-17', '81421984366', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Terry', 'De Giorgio', 'tdegiorgioop@google.cn', 'M', '1985-01-06', '13684614177', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Stanwood', 'Rorke', 'srorkeoq@live.com', 'M', '1978-05-16', '72215611333', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bailie', 'Parkyns', 'bparkynsor@scientificamerican.com', 'M', '1975-09-11', '71537826722', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Whit', 'Wonter', 'wwonteros@cmu.edu', 'M', '1979-10-29', '75219469522', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Beitris', 'Ballsdon', 'bballsdonot@netscape.com', 'F', '1974-05-11', '37872366866', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Frank', 'Divill', 'fdivillou@wisc.edu', 'M', '1981-11-03', '31026646877', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carlen', 'Bohea', 'cboheaov@opensource.org', 'F', '1990-11-14', '59964553822', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Myrtice', 'Petche', 'mpetcheow@prlog.org', 'F', '1986-01-03', '42018575811', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Tadeo', 'Neathway', 'tneathwayox@dot.gov', 'M', '1983-10-29', '96184344433', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bidget', 'Jansa', 'bjansaoy@microsoft.com', 'F', '1971-03-07', '80048929577', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Orion', 'Coaker', 'ocoakeroz@samsung.com', 'M', '1981-01-17', '31110649488', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Belia', 'Depke', 'bdepkep0@clickbank.net', 'F', '1980-10-31', '85865302200', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Olimpia', 'Dobey', 'odobeyp1@mit.edu', 'F', '1972-03-24', '54572608600', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Seana', 'Latchmore', 'slatchmorep2@netlog.com', 'F', '1973-02-25', '20674566799', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Vilma', 'Normanville', 'vnormanvillep3@mail.ru', 'F', '1988-07-31', '17700534411', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Shay', 'Ebbrell', 'sebbrellp4@4shared.com', 'F', '1971-09-11', '82558507599', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carly', 'Dorant', 'cdorantp5@home.pl', 'M', '1982-12-07', '30984648877', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Myrtice', 'Moehler', 'mmoehlerp6@webeden.co.uk', 'F', '1970-06-20', '25712718144', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Caldwell', 'Fratczak', 'cfratczakp7@sohu.com', 'M', '1979-12-23', '16639437966', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carmelle', 'Guyot', 'cguyotp8@house.gov', 'F', '1985-05-12', '24613333944', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carolynn', 'Dadds', 'cdaddsp9@fotki.com', 'F', '1979-02-14', '80427989388', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Maurita', 'Ugolotti', 'mugolottipa@dell.com', 'F', '1984-02-26', '69515376077', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gothart', 'Tattersill', 'gtattersillpb@vkontakte.ru', 'M', '1976-05-24', '49094393155', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Theodore', 'Laba', 'tlabapc@e-recht24.de', 'M', '1985-08-09', '29508277055', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Evered', 'Pelosi', 'epelosipd@smh.com.au', 'M', '1980-03-08', '59075491577', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Emery', 'Collymore', 'ecollymorepe@bigcartel.com', 'M', '1987-12-21', '82700692055', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Aarika', 'Vsanelli', 'avsanellipf@angelfire.com', 'F', '1979-10-08', '98680372399', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Giusto', 'Le Gallo', 'glegallopg@blogspot.com', 'M', '1972-09-21', '50791833222', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Raymund', 'Chadney', 'rchadneyph@yolasite.com', 'M', '1982-12-16', '25155911911', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Royce', 'O'' Donohoe', 'rodonohoepi@pagesperso-orange.fr', 'M', '1989-06-08', '00254170611', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Borden', 'Stepney', 'bstepneypj@t-online.de', 'M', '1973-02-08', '91799656955', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Evvy', 'Lomond', 'elomondpk@shinystat.com', 'F', '1976-12-30', '37789349455', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ramsey', 'Sepey', 'rsepeypl@technorati.com', 'M', '1971-05-06', '83537769600', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Malissia', 'Denson', 'mdensonpm@ihg.com', 'F', '1985-07-09', '60273845499', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Aliza', 'Whiston', 'awhistonpn@mysql.com', 'F', '1974-01-26', '78942301899', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Jedidiah', 'Empson', 'jempsonpo@fc2.com', 'M', '1984-06-10', '82689061111', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Artemis', 'Burrel', 'aburrelpp@taobao.com', 'M', '1971-07-09', '04112419900', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Britt', 'Vasilenko', 'bvasilenkopq@moonfruit.com', 'F', '1989-10-31', '16113866755', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Violet', 'Woolland', 'vwoollandpr@dedecms.com', 'F', '1983-06-15', '50807748000', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Berkie', 'Foro', 'bforops@diigo.com', 'M', '1988-09-15', '85060664177', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Stanfield', 'Setterington', 'ssetteringtonpt@about.me', 'M', '1979-03-08', '81014977577', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hayden', 'Saggs', 'hsaggspu@blogtalkradio.com', 'M', '1985-01-28', '42618051388', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Raynor', 'Penas', 'rpenaspv@gov.uk', 'M', '1970-09-23', '90484748688', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Phillida', 'Jotham', 'pjothampw@liveinternet.ru', 'F', '1986-11-28', '73913891455', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gillian', 'Wile', 'gwilepx@vimeo.com', 'F', '1978-08-27', '26290863055', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Alejoa', 'Oleksinski', 'aoleksinskipy@dailymail.co.uk', 'M', '1977-04-18', '49598106888', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Putnem', 'Tilt', 'ptiltpz@amazonaws.com', 'M', '1973-02-21', '91223844999', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sianna', 'Zuanelli', 'szuanelliq0@symantec.com', 'F', '1985-03-26', '67975061311', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Enrico', 'Sowden', 'esowdenq1@ezinearticles.com', 'M', '1974-03-21', '87443075433', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Richmound', 'Gabbott', 'rgabbottq2@dropbox.com', 'M', '1987-09-12', '86628904155', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Waylen', 'Stubbe', 'wstubbeq3@deliciousdays.com', 'M', '1979-07-08', '34687705966', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mata', 'Fry', 'mfryq4@vk.com', 'M', '1988-12-12', '05748928777', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hugo', 'Ship', 'hshipq5@gizmodo.com', 'M', '1990-10-15', '98806134655', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ayn', 'MacAindreis', 'amacaindreisq6@amazon.co.jp', 'F', '1987-10-28', '25040319122', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mitchael', 'Spellworth', 'mspellworthq7@issuu.com', 'M', '1972-01-19', '90911486911', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kiel', 'Ecclestone', 'kecclestoneq8@springer.com', 'M', '1985-08-28', '89111312377', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Nady', 'Riseley', 'nriseleyq9@etsy.com', 'F', '1973-09-17', '71942086600', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Vi', 'Clotworthy', 'vclotworthyqa@newyorker.com', 'F', '1987-06-14', '03876481433', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Forest', 'Escolme', 'fescolmeqb@deviantart.com', 'M', '1979-07-08', '54093140266', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dorian', 'Duggon', 'dduggonqc@ocn.ne.jp', 'F', '1979-08-29', '57161525899', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Conny', 'Beardshaw', 'cbeardshawqd@pcworld.com', 'F', '1975-08-25', '22057824522', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Amye', 'Tumini', 'atuminiqe@plala.or.jp', 'F', '1980-11-21', '48276110688', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sapphira', 'Order', 'sorderqf@guardian.co.uk', 'F', '1971-07-25', '74707248777', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Base', 'Labuschagne', 'blabuschagneqg@google.com.br', 'M', '1986-10-29', '88094638111', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Karoline', 'Wickwarth', 'kwickwarthqh@barnesandnoble.com', 'F', '1970-09-08', '44585892611', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Merill', 'Gorgl', 'mgorglqi@umich.edu', 'M', '1983-03-01', '82354930122', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lianna', 'Surman-Wells', 'lsurmanwellsqj@usda.gov', 'F', '1989-06-29', '68078908855', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Franny', 'Ivkovic', 'fivkovicqk@ehow.com', 'M', '1973-12-26', '74805687899', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Clayton', 'Barabisch', 'cbarabischql@clickbank.net', 'M', '1979-09-27', '03542003644', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Wyn', 'Twoohy', 'wtwoohyqm@marketwatch.com', 'M', '1979-07-14', '02926717099', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Benedikta', 'Mitchelson', 'bmitchelsonqn@soup.io', 'F', '1985-08-02', '92129821744', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Addia', 'Tyght', 'atyghtqo@tumblr.com', 'F', '1980-04-06', '88331747000', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Prudi', 'Barrington', 'pbarringtonqp@google.com.br', 'F', '1974-11-18', '35325721333', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Netti', 'Badgers', 'nbadgersqq@spiegel.de', 'F', '1975-05-12', '76760047999', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Anneliese', 'Welling', 'awellingqr@home.pl', 'F', '1972-11-14', '35579978122', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Karna', 'Shieldon', 'kshieldonqs@patch.com', 'F', '1983-11-05', '32903594922', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Terrijo', 'Coryndon', 'tcoryndonqt@furl.net', 'F', '1973-12-02', '91741594611', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Brnaby', 'Huyton', 'bhuytonqu@berkeley.edu', 'M', '1985-12-12', '06239685333', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Vasily', 'Weld', 'vweldqv@ameblo.jp', 'M', '1982-07-17', '32315648088', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kelby', 'Placido', 'kplacidoqw@reuters.com', 'M', '1973-01-27', '56859960122', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Alonzo', 'Hannibal', 'ahannibalqx@miitbeian.gov.cn', 'M', '1986-10-18', '70277004411', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Marylee', 'Barten', 'mbartenqy@is.gd', 'F', '1987-01-26', '46135052755', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Feliks', 'Bowry', 'fbowryqz@prweb.com', 'M', '1986-08-10', '02405560033', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Forbes', 'Servis', 'fservisr0@fastcompany.com', 'M', '1975-09-17', '29938510200', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Lilyan', 'Bodleigh', 'lbodleighr1@seattletimes.com', 'F', '1990-04-19', '39029155288', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Hernando', 'Cusiter', 'hcusiterr2@delicious.com', 'M', '1976-10-07', '07094619177', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Leilah', 'Sygroves', 'lsygrovesr3@spiegel.de', 'F', '1988-01-27', '02397576455', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Huntington', 'Doody', 'hdoodyr4@google.nl', 'M', '1981-03-09', '75992418688', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Galvan', 'Carl', 'gcarlr5@vk.com', 'M', '1981-06-02', '41566976300', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Burnard', 'Lowey', 'bloweyr6@acquirethisname.com', 'M', '1977-06-11', '36514567144', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Fairfax', 'Pinkerton', 'fpinkertonr7@pagesperso-orange.fr', 'M', '1976-05-08', '32186946122', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Dela', 'Sprull', 'dsprullr8@imgur.com', 'F', '1972-08-06', '98848125433', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mayer', 'Capsey', 'mcapseyr9@mac.com', 'M', '1972-10-30', '60529960722', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Eustacia', 'Hudel', 'ehudelra@slideshare.net', 'F', '1973-04-16', '19554040544', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Walden', 'O''Gavin', 'wogavinrb@nih.gov', 'M', '1978-08-23', '23441482488', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Elisabetta', 'Appleton', 'eappletonrc@desdev.cn', 'F', '1986-07-10', '29646821866', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Mamie', 'McGrudder', 'mmcgrudderrd@goodreads.com', 'F', '1983-04-03', '89223669588', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Annabell', 'Persey', 'aperseyre@studiopress.com', 'F', '1987-03-05', '22679796677', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Diana', 'Burnsides', 'dburnsidesrf@ustream.tv', 'F', '1990-08-29', '55390772533', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Ive', 'Bracknell', 'ibracknellrg@ezinearticles.com', 'M', '1987-07-13', '06207408255', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Shanie', 'Drover', 'sdroverrh@ebay.com', 'F', '1984-01-08', '18892271022', '4');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Arthur', 'Guyonneau', 'aguyonneauri@goo.gl', 'M', '1988-11-30', '35765122333', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Kaitlyn', 'Shanks', 'kshanksrj@wsj.com', 'F', '1985-10-30', '54620050677', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Bambie', 'Luff', 'bluffrk@va.gov', 'F', '1980-04-23', '07605701833', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Carlotta', 'Harmar', 'charmarrl@wikipedia.org', 'F', '1988-01-23', '63642576311', '5');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Sandy', 'Petracek', 'spetracekrm@soundcloud.com', 'F', '1981-12-11', '81323014633', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Myriam', 'Guswell', 'mguswellrn@quantcast.com', 'F', '1970-05-19', '53610136411', '1');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Vanna', 'Hutable', 'vhutablero@tmall.com', 'F', '1984-10-13', '05776528344', '3');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Gawain', 'Kemm', 'gkemmrp@dailymotion.com', 'M', '1974-12-20', '01046786077', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Virgilio', 'Ettridge', 'vettridgerq@ezinearticles.com', 'M', '1973-12-29', '35351928033', '2');
insert into Socio (Nombre, Apellido, EMail, Sexo, FechaNacimiento, CUIL, CodCategoria) values ('Juline', 'Keely', 'jkeelyrr@oakley.com', 'F', '1979-02-08', '30816977788', '3');
GO

CREATE PROCEDURE DBO.CargarPractica @CodSocio int, @CodDeporte int AS

	if not exists (select * from Practica where CodSocio = @CodSocio and CodDeporte = @CodDeporte)
		insert into Practica (CodSocio, CodDeporte)
		values (@CodSocio, @CodDeporte)
GO

exec DBO.CargarPractica 714, 27
exec DBO.CargarPractica 118, 9
exec DBO.CargarPractica 464, 25
exec DBO.CargarPractica 441, 32
exec DBO.CargarPractica 273, 15
exec DBO.CargarPractica 843, 34
exec DBO.CargarPractica 805, 16
exec DBO.CargarPractica 203, 37
exec DBO.CargarPractica 60, 20
exec DBO.CargarPractica 591, 3
exec DBO.CargarPractica 245, 19
exec DBO.CargarPractica 652, 18
exec DBO.CargarPractica 753, 39
exec DBO.CargarPractica 473, 19
exec DBO.CargarPractica 401, 35
exec DBO.CargarPractica 868, 26
exec DBO.CargarPractica 126, 39
exec DBO.CargarPractica 450, 32
exec DBO.CargarPractica 209, 2
exec DBO.CargarPractica 630, 29
exec DBO.CargarPractica 23, 10
exec DBO.CargarPractica 454, 11
exec DBO.CargarPractica 514, 35
exec DBO.CargarPractica 886, 21
exec DBO.CargarPractica 942, 22
exec DBO.CargarPractica 237, 30
exec DBO.CargarPractica 909, 19
exec DBO.CargarPractica 733, 33
exec DBO.CargarPractica 442, 13
exec DBO.CargarPractica 500, 36
exec DBO.CargarPractica 284, 3
exec DBO.CargarPractica 109, 6
exec DBO.CargarPractica 323, 21
exec DBO.CargarPractica 538, 8
exec DBO.CargarPractica 359, 9
exec DBO.CargarPractica 427, 16
exec DBO.CargarPractica 956, 23
exec DBO.CargarPractica 45, 25
exec DBO.CargarPractica 1000, 4
exec DBO.CargarPractica 571, 7
exec DBO.CargarPractica 936, 22
exec DBO.CargarPractica 445, 30
exec DBO.CargarPractica 298, 40
exec DBO.CargarPractica 431, 32
exec DBO.CargarPractica 131, 16
exec DBO.CargarPractica 736, 23
exec DBO.CargarPractica 642, 29
exec DBO.CargarPractica 474, 18
exec DBO.CargarPractica 170, 30
exec DBO.CargarPractica 499, 17
exec DBO.CargarPractica 121, 25
exec DBO.CargarPractica 497, 11
exec DBO.CargarPractica 770, 31
exec DBO.CargarPractica 897, 11
exec DBO.CargarPractica 71, 28
exec DBO.CargarPractica 338, 13
exec DBO.CargarPractica 589, 20
exec DBO.CargarPractica 775, 2
exec DBO.CargarPractica 215, 19
exec DBO.CargarPractica 533, 31
exec DBO.CargarPractica 466, 5
exec DBO.CargarPractica 689, 2
exec DBO.CargarPractica 858, 8
exec DBO.CargarPractica 887, 37
exec DBO.CargarPractica 456, 26
exec DBO.CargarPractica 740, 32
exec DBO.CargarPractica 93, 40
exec DBO.CargarPractica 290, 22
exec DBO.CargarPractica 948, 30
exec DBO.CargarPractica 479, 31
exec DBO.CargarPractica 189, 5
exec DBO.CargarPractica 789, 17
exec DBO.CargarPractica 876, 23
exec DBO.CargarPractica 269, 27
exec DBO.CargarPractica 574, 19
exec DBO.CargarPractica 421, 11
exec DBO.CargarPractica 481, 12
exec DBO.CargarPractica 720, 17
exec DBO.CargarPractica 985, 12
exec DBO.CargarPractica 318, 27
exec DBO.CargarPractica 127, 26
exec DBO.CargarPractica 5, 18
exec DBO.CargarPractica 334, 36
exec DBO.CargarPractica 717, 26
exec DBO.CargarPractica 564, 1
exec DBO.CargarPractica 359, 10
exec DBO.CargarPractica 361, 36
exec DBO.CargarPractica 52, 6
exec DBO.CargarPractica 429, 1
exec DBO.CargarPractica 995, 33
exec DBO.CargarPractica 983, 13
exec DBO.CargarPractica 412, 3
exec DBO.CargarPractica 498, 23
exec DBO.CargarPractica 762, 29
exec DBO.CargarPractica 803, 26
exec DBO.CargarPractica 662, 33
exec DBO.CargarPractica 953, 15
exec DBO.CargarPractica 17, 16
exec DBO.CargarPractica 100, 33
exec DBO.CargarPractica 749, 2
exec DBO.CargarPractica 885, 34
exec DBO.CargarPractica 573, 7
exec DBO.CargarPractica 113, 7
exec DBO.CargarPractica 982, 17
exec DBO.CargarPractica 544, 37
exec DBO.CargarPractica 385, 37
exec DBO.CargarPractica 66, 24
exec DBO.CargarPractica 970, 38
exec DBO.CargarPractica 160, 33
exec DBO.CargarPractica 298, 19
exec DBO.CargarPractica 482, 38
exec DBO.CargarPractica 229, 14
exec DBO.CargarPractica 283, 7
exec DBO.CargarPractica 585, 3
exec DBO.CargarPractica 983, 33
exec DBO.CargarPractica 557, 28
exec DBO.CargarPractica 941, 14
exec DBO.CargarPractica 766, 16
exec DBO.CargarPractica 394, 11
exec DBO.CargarPractica 627, 14
exec DBO.CargarPractica 820, 33
exec DBO.CargarPractica 723, 9
exec DBO.CargarPractica 32, 30
exec DBO.CargarPractica 729, 40
exec DBO.CargarPractica 227, 40
exec DBO.CargarPractica 521, 19
exec DBO.CargarPractica 10, 37
exec DBO.CargarPractica 736, 12
exec DBO.CargarPractica 223, 24
exec DBO.CargarPractica 694, 31
exec DBO.CargarPractica 826, 35
exec DBO.CargarPractica 826, 30
exec DBO.CargarPractica 101, 40
exec DBO.CargarPractica 588, 12
exec DBO.CargarPractica 773, 37
exec DBO.CargarPractica 889, 34
exec DBO.CargarPractica 383, 28
exec DBO.CargarPractica 217, 17
exec DBO.CargarPractica 545, 18
exec DBO.CargarPractica 591, 7
exec DBO.CargarPractica 573, 19
exec DBO.CargarPractica 53, 8
exec DBO.CargarPractica 47, 1
exec DBO.CargarPractica 468, 14
exec DBO.CargarPractica 972, 1
exec DBO.CargarPractica 663, 7
exec DBO.CargarPractica 151, 37
exec DBO.CargarPractica 766, 13
exec DBO.CargarPractica 359, 3
exec DBO.CargarPractica 934, 9
exec DBO.CargarPractica 927, 40
exec DBO.CargarPractica 961, 28
exec DBO.CargarPractica 489, 36
exec DBO.CargarPractica 405, 40
exec DBO.CargarPractica 685, 20
exec DBO.CargarPractica 853, 20
exec DBO.CargarPractica 530, 39
exec DBO.CargarPractica 90, 32
exec DBO.CargarPractica 851, 32
exec DBO.CargarPractica 24, 30
exec DBO.CargarPractica 662, 17
exec DBO.CargarPractica 534, 20
exec DBO.CargarPractica 908, 24
exec DBO.CargarPractica 83, 14
exec DBO.CargarPractica 992, 18
exec DBO.CargarPractica 949, 38
exec DBO.CargarPractica 538, 12
exec DBO.CargarPractica 859, 32
exec DBO.CargarPractica 330, 19
exec DBO.CargarPractica 953, 1
exec DBO.CargarPractica 661, 23
exec DBO.CargarPractica 493, 29
exec DBO.CargarPractica 879, 26
exec DBO.CargarPractica 274, 40
exec DBO.CargarPractica 269, 39
exec DBO.CargarPractica 409, 14
exec DBO.CargarPractica 880, 19
exec DBO.CargarPractica 488, 2
exec DBO.CargarPractica 385, 32
exec DBO.CargarPractica 660, 18
exec DBO.CargarPractica 857, 37
exec DBO.CargarPractica 499, 22
exec DBO.CargarPractica 519, 25
exec DBO.CargarPractica 12, 8
exec DBO.CargarPractica 104, 35
exec DBO.CargarPractica 81, 20
exec DBO.CargarPractica 411, 10
exec DBO.CargarPractica 456, 17
exec DBO.CargarPractica 608, 39
exec DBO.CargarPractica 673, 16
exec DBO.CargarPractica 530, 11
exec DBO.CargarPractica 674, 5
exec DBO.CargarPractica 995, 20
exec DBO.CargarPractica 979, 37
exec DBO.CargarPractica 254, 26
exec DBO.CargarPractica 66, 20
exec DBO.CargarPractica 966, 13
exec DBO.CargarPractica 896, 20
exec DBO.CargarPractica 865, 1
exec DBO.CargarPractica 713, 35
exec DBO.CargarPractica 322, 25
exec DBO.CargarPractica 712, 11
exec DBO.CargarPractica 85, 19
exec DBO.CargarPractica 973, 26
exec DBO.CargarPractica 99, 10
exec DBO.CargarPractica 590, 23
exec DBO.CargarPractica 363, 2
exec DBO.CargarPractica 856, 13
exec DBO.CargarPractica 322, 36
exec DBO.CargarPractica 868, 29
exec DBO.CargarPractica 573, 14
exec DBO.CargarPractica 30, 39
exec DBO.CargarPractica 225, 7
exec DBO.CargarPractica 867, 24
exec DBO.CargarPractica 623, 22
exec DBO.CargarPractica 389, 10
exec DBO.CargarPractica 983, 12
exec DBO.CargarPractica 651, 32
exec DBO.CargarPractica 970, 11
exec DBO.CargarPractica 711, 7
exec DBO.CargarPractica 382, 21
exec DBO.CargarPractica 226, 32
exec DBO.CargarPractica 45, 24
exec DBO.CargarPractica 199, 28
exec DBO.CargarPractica 64, 3
exec DBO.CargarPractica 220, 38
exec DBO.CargarPractica 633, 8
exec DBO.CargarPractica 981, 27
exec DBO.CargarPractica 895, 2
exec DBO.CargarPractica 929, 10
exec DBO.CargarPractica 418, 12
exec DBO.CargarPractica 333, 3
exec DBO.CargarPractica 77, 26
exec DBO.CargarPractica 393, 32
exec DBO.CargarPractica 268, 9
exec DBO.CargarPractica 231, 27
exec DBO.CargarPractica 349, 23
exec DBO.CargarPractica 372, 13
exec DBO.CargarPractica 320, 27
exec DBO.CargarPractica 620, 5
exec DBO.CargarPractica 471, 5
exec DBO.CargarPractica 10, 9
exec DBO.CargarPractica 769, 26
exec DBO.CargarPractica 108, 34
exec DBO.CargarPractica 264, 27
exec DBO.CargarPractica 411, 2
exec DBO.CargarPractica 588, 31
exec DBO.CargarPractica 660, 2
exec DBO.CargarPractica 707, 20
exec DBO.CargarPractica 983, 7
exec DBO.CargarPractica 83, 31
exec DBO.CargarPractica 539, 4
exec DBO.CargarPractica 116, 19
exec DBO.CargarPractica 320, 26
exec DBO.CargarPractica 718, 37
exec DBO.CargarPractica 690, 8
exec DBO.CargarPractica 245, 6
exec DBO.CargarPractica 735, 15
exec DBO.CargarPractica 527, 35
exec DBO.CargarPractica 855, 7
exec DBO.CargarPractica 141, 20
exec DBO.CargarPractica 584, 2
exec DBO.CargarPractica 979, 30
exec DBO.CargarPractica 468, 29
exec DBO.CargarPractica 309, 25
exec DBO.CargarPractica 183, 11
exec DBO.CargarPractica 426, 39
exec DBO.CargarPractica 785, 25
exec DBO.CargarPractica 489, 2
exec DBO.CargarPractica 243, 31
exec DBO.CargarPractica 758, 25
exec DBO.CargarPractica 907, 17
exec DBO.CargarPractica 783, 38
exec DBO.CargarPractica 249, 10
exec DBO.CargarPractica 309, 18
exec DBO.CargarPractica 76, 18
exec DBO.CargarPractica 603, 22
exec DBO.CargarPractica 847, 11
exec DBO.CargarPractica 26, 8
exec DBO.CargarPractica 556, 7
exec DBO.CargarPractica 936, 4
exec DBO.CargarPractica 843, 7
exec DBO.CargarPractica 536, 9
exec DBO.CargarPractica 650, 16
exec DBO.CargarPractica 126, 1
exec DBO.CargarPractica 835, 6
exec DBO.CargarPractica 794, 39
exec DBO.CargarPractica 509, 23
exec DBO.CargarPractica 776, 12
exec DBO.CargarPractica 590, 30
exec DBO.CargarPractica 21, 15
exec DBO.CargarPractica 844, 36
exec DBO.CargarPractica 493, 25
exec DBO.CargarPractica 328, 15
exec DBO.CargarPractica 836, 33
exec DBO.CargarPractica 524, 32
exec DBO.CargarPractica 836, 39
exec DBO.CargarPractica 494, 10
exec DBO.CargarPractica 143, 15
exec DBO.CargarPractica 57, 30
exec DBO.CargarPractica 269, 16
exec DBO.CargarPractica 156, 1
exec DBO.CargarPractica 612, 38
exec DBO.CargarPractica 279, 8
exec DBO.CargarPractica 133, 12
exec DBO.CargarPractica 502, 14
exec DBO.CargarPractica 86, 7
exec DBO.CargarPractica 337, 7
exec DBO.CargarPractica 178, 33
exec DBO.CargarPractica 452, 27
exec DBO.CargarPractica 378, 14
exec DBO.CargarPractica 436, 8
exec DBO.CargarPractica 314, 4
exec DBO.CargarPractica 34, 28
exec DBO.CargarPractica 761, 13
exec DBO.CargarPractica 17, 31
exec DBO.CargarPractica 569, 2
exec DBO.CargarPractica 821, 35
exec DBO.CargarPractica 657, 26
exec DBO.CargarPractica 479, 10
exec DBO.CargarPractica 173, 14
exec DBO.CargarPractica 975, 19
exec DBO.CargarPractica 870, 23
exec DBO.CargarPractica 335, 21
exec DBO.CargarPractica 508, 29
exec DBO.CargarPractica 934, 29
exec DBO.CargarPractica 64, 20
exec DBO.CargarPractica 714, 33
exec DBO.CargarPractica 681, 24
exec DBO.CargarPractica 781, 3
exec DBO.CargarPractica 722, 11
exec DBO.CargarPractica 326, 31
exec DBO.CargarPractica 889, 30
exec DBO.CargarPractica 84, 18
exec DBO.CargarPractica 226, 3
exec DBO.CargarPractica 939, 20
exec DBO.CargarPractica 127, 28
exec DBO.CargarPractica 302, 25
exec DBO.CargarPractica 211, 2
exec DBO.CargarPractica 101, 17
exec DBO.CargarPractica 237, 23
exec DBO.CargarPractica 773, 5
exec DBO.CargarPractica 123, 5
exec DBO.CargarPractica 360, 16
exec DBO.CargarPractica 944, 21
exec DBO.CargarPractica 22, 39
exec DBO.CargarPractica 50, 15
exec DBO.CargarPractica 103, 24
exec DBO.CargarPractica 844, 28
exec DBO.CargarPractica 259, 38
exec DBO.CargarPractica 223, 26
exec DBO.CargarPractica 151, 15
exec DBO.CargarPractica 283, 10
exec DBO.CargarPractica 763, 37
exec DBO.CargarPractica 672, 33
exec DBO.CargarPractica 688, 15
exec DBO.CargarPractica 681, 30
exec DBO.CargarPractica 735, 32
exec DBO.CargarPractica 108, 33
exec DBO.CargarPractica 256, 16
exec DBO.CargarPractica 722, 31
exec DBO.CargarPractica 205, 16
exec DBO.CargarPractica 787, 38
exec DBO.CargarPractica 99, 14
exec DBO.CargarPractica 670, 4
exec DBO.CargarPractica 398, 11
exec DBO.CargarPractica 343, 1
exec DBO.CargarPractica 183, 38
exec DBO.CargarPractica 468, 20
exec DBO.CargarPractica 218, 36
exec DBO.CargarPractica 809, 17
exec DBO.CargarPractica 866, 7
exec DBO.CargarPractica 912, 13
exec DBO.CargarPractica 713, 27
exec DBO.CargarPractica 986, 10
exec DBO.CargarPractica 301, 16
exec DBO.CargarPractica 986, 6
exec DBO.CargarPractica 565, 18
exec DBO.CargarPractica 299, 34
exec DBO.CargarPractica 132, 15
exec DBO.CargarPractica 965, 38
exec DBO.CargarPractica 325, 39
exec DBO.CargarPractica 177, 21
exec DBO.CargarPractica 713, 7
exec DBO.CargarPractica 752, 6
exec DBO.CargarPractica 986, 39
exec DBO.CargarPractica 644, 2
exec DBO.CargarPractica 755, 9
exec DBO.CargarPractica 478, 31
exec DBO.CargarPractica 642, 40
exec DBO.CargarPractica 177, 29
exec DBO.CargarPractica 831, 36
exec DBO.CargarPractica 82, 5
exec DBO.CargarPractica 747, 40
exec DBO.CargarPractica 619, 27
exec DBO.CargarPractica 757, 19
exec DBO.CargarPractica 91, 1
exec DBO.CargarPractica 470, 13
exec DBO.CargarPractica 47, 6
exec DBO.CargarPractica 118, 40
exec DBO.CargarPractica 157, 4
exec DBO.CargarPractica 785, 38
exec DBO.CargarPractica 470, 6
exec DBO.CargarPractica 673, 13
exec DBO.CargarPractica 385, 14
exec DBO.CargarPractica 466, 23
exec DBO.CargarPractica 246, 31
exec DBO.CargarPractica 102, 13
exec DBO.CargarPractica 778, 40
exec DBO.CargarPractica 582, 38
exec DBO.CargarPractica 754, 28
exec DBO.CargarPractica 808, 12
exec DBO.CargarPractica 182, 11
exec DBO.CargarPractica 484, 32
exec DBO.CargarPractica 565, 12
exec DBO.CargarPractica 965, 9
exec DBO.CargarPractica 292, 32
exec DBO.CargarPractica 469, 35
exec DBO.CargarPractica 872, 29
exec DBO.CargarPractica 299, 4
exec DBO.CargarPractica 459, 21
exec DBO.CargarPractica 599, 26
exec DBO.CargarPractica 268, 6
exec DBO.CargarPractica 684, 22
exec DBO.CargarPractica 658, 40
exec DBO.CargarPractica 984, 30
exec DBO.CargarPractica 775, 14
exec DBO.CargarPractica 348, 5
exec DBO.CargarPractica 977, 25
exec DBO.CargarPractica 361, 27
exec DBO.CargarPractica 707, 13
exec DBO.CargarPractica 46, 3
exec DBO.CargarPractica 327, 30
exec DBO.CargarPractica 912, 32
exec DBO.CargarPractica 417, 26
exec DBO.CargarPractica 277, 33
exec DBO.CargarPractica 706, 4
exec DBO.CargarPractica 167, 11
exec DBO.CargarPractica 438, 30
exec DBO.CargarPractica 653, 9
exec DBO.CargarPractica 49, 5
exec DBO.CargarPractica 466, 30
exec DBO.CargarPractica 694, 22
exec DBO.CargarPractica 504, 16
exec DBO.CargarPractica 147, 40
exec DBO.CargarPractica 720, 31
exec DBO.CargarPractica 765, 7
exec DBO.CargarPractica 196, 30
exec DBO.CargarPractica 544, 28
exec DBO.CargarPractica 430, 40
exec DBO.CargarPractica 241, 21
exec DBO.CargarPractica 986, 2
exec DBO.CargarPractica 94, 27
exec DBO.CargarPractica 25, 24
exec DBO.CargarPractica 129, 5
exec DBO.CargarPractica 763, 16
exec DBO.CargarPractica 836, 18
exec DBO.CargarPractica 973, 11
exec DBO.CargarPractica 190, 11
exec DBO.CargarPractica 9, 11
exec DBO.CargarPractica 936, 33
exec DBO.CargarPractica 457, 37
exec DBO.CargarPractica 988, 18
exec DBO.CargarPractica 851, 23
exec DBO.CargarPractica 230, 8
exec DBO.CargarPractica 299, 10
exec DBO.CargarPractica 230, 25
exec DBO.CargarPractica 452, 26
exec DBO.CargarPractica 845, 15
exec DBO.CargarPractica 372, 11
exec DBO.CargarPractica 680, 11
exec DBO.CargarPractica 550, 26
exec DBO.CargarPractica 281, 13
exec DBO.CargarPractica 915, 39
exec DBO.CargarPractica 335, 32
exec DBO.CargarPractica 35, 38
exec DBO.CargarPractica 702, 38
exec DBO.CargarPractica 226, 12
exec DBO.CargarPractica 220, 1
exec DBO.CargarPractica 932, 30
exec DBO.CargarPractica 897, 5
exec DBO.CargarPractica 122, 14
exec DBO.CargarPractica 415, 27
exec DBO.CargarPractica 863, 27
exec DBO.CargarPractica 249, 9
exec DBO.CargarPractica 606, 12
exec DBO.CargarPractica 703, 35
exec DBO.CargarPractica 774, 39
exec DBO.CargarPractica 641, 8
exec DBO.CargarPractica 448, 11
exec DBO.CargarPractica 893, 31
exec DBO.CargarPractica 945, 10
exec DBO.CargarPractica 920, 32
exec DBO.CargarPractica 409, 1
exec DBO.CargarPractica 705, 9
exec DBO.CargarPractica 960, 7
exec DBO.CargarPractica 189, 19
exec DBO.CargarPractica 556, 35
exec DBO.CargarPractica 290, 25
exec DBO.CargarPractica 781, 16
exec DBO.CargarPractica 930, 14
exec DBO.CargarPractica 656, 30
exec DBO.CargarPractica 740, 26
exec DBO.CargarPractica 380, 33
exec DBO.CargarPractica 247, 31
exec DBO.CargarPractica 338, 25
exec DBO.CargarPractica 125, 27
exec DBO.CargarPractica 784, 4
exec DBO.CargarPractica 178, 26
exec DBO.CargarPractica 854, 32
exec DBO.CargarPractica 368, 34
exec DBO.CargarPractica 844, 3
exec DBO.CargarPractica 622, 23
exec DBO.CargarPractica 347, 37
exec DBO.CargarPractica 626, 14
exec DBO.CargarPractica 171, 18
exec DBO.CargarPractica 961, 13
exec DBO.CargarPractica 995, 1
exec DBO.CargarPractica 213, 6
exec DBO.CargarPractica 644, 8
exec DBO.CargarPractica 151, 5
exec DBO.CargarPractica 766, 32
exec DBO.CargarPractica 591, 1
exec DBO.CargarPractica 296, 7
exec DBO.CargarPractica 534, 38
exec DBO.CargarPractica 880, 20
exec DBO.CargarPractica 904, 15
exec DBO.CargarPractica 972, 26
exec DBO.CargarPractica 224, 36
exec DBO.CargarPractica 928, 14
exec DBO.CargarPractica 222, 19
exec DBO.CargarPractica 804, 35
exec DBO.CargarPractica 402, 13
exec DBO.CargarPractica 706, 10
exec DBO.CargarPractica 674, 36
exec DBO.CargarPractica 592, 11
exec DBO.CargarPractica 537, 16
exec DBO.CargarPractica 702, 39
exec DBO.CargarPractica 790, 6
exec DBO.CargarPractica 160, 23
exec DBO.CargarPractica 103, 16
exec DBO.CargarPractica 249, 39
exec DBO.CargarPractica 621, 40
exec DBO.CargarPractica 438, 39
exec DBO.CargarPractica 663, 8
exec DBO.CargarPractica 869, 20
exec DBO.CargarPractica 486, 38
exec DBO.CargarPractica 358, 26
exec DBO.CargarPractica 413, 3
exec DBO.CargarPractica 917, 25
exec DBO.CargarPractica 698, 1
exec DBO.CargarPractica 48, 7
exec DBO.CargarPractica 83, 22
exec DBO.CargarPractica 73, 25
exec DBO.CargarPractica 249, 27
exec DBO.CargarPractica 712, 8
exec DBO.CargarPractica 599, 20
exec DBO.CargarPractica 184, 10
exec DBO.CargarPractica 62, 14
exec DBO.CargarPractica 400, 1
exec DBO.CargarPractica 505, 20
exec DBO.CargarPractica 753, 8
exec DBO.CargarPractica 542, 5
exec DBO.CargarPractica 856, 35
exec DBO.CargarPractica 688, 40
exec DBO.CargarPractica 627, 10
exec DBO.CargarPractica 591, 12
exec DBO.CargarPractica 337, 8
exec DBO.CargarPractica 653, 6
exec DBO.CargarPractica 341, 37
exec DBO.CargarPractica 399, 4
exec DBO.CargarPractica 248, 15
exec DBO.CargarPractica 975, 21
exec DBO.CargarPractica 366, 32
exec DBO.CargarPractica 370, 1
exec DBO.CargarPractica 201, 18
exec DBO.CargarPractica 354, 34
exec DBO.CargarPractica 23, 16
exec DBO.CargarPractica 291, 40
exec DBO.CargarPractica 480, 40
exec DBO.CargarPractica 461, 10
exec DBO.CargarPractica 140, 39
exec DBO.CargarPractica 727, 26
exec DBO.CargarPractica 87, 8
exec DBO.CargarPractica 982, 18
exec DBO.CargarPractica 383, 31
exec DBO.CargarPractica 184, 33
exec DBO.CargarPractica 149, 26
exec DBO.CargarPractica 361, 35
exec DBO.CargarPractica 405, 26
exec DBO.CargarPractica 728, 23
exec DBO.CargarPractica 344, 19
exec DBO.CargarPractica 692, 24
exec DBO.CargarPractica 426, 25
exec DBO.CargarPractica 269, 3
exec DBO.CargarPractica 824, 14
exec DBO.CargarPractica 989, 22
exec DBO.CargarPractica 381, 6
exec DBO.CargarPractica 712, 19
exec DBO.CargarPractica 261, 16
exec DBO.CargarPractica 353, 4
exec DBO.CargarPractica 768, 18
exec DBO.CargarPractica 764, 5
exec DBO.CargarPractica 38, 12
exec DBO.CargarPractica 632, 19
exec DBO.CargarPractica 103, 27
exec DBO.CargarPractica 122, 9
exec DBO.CargarPractica 458, 37
exec DBO.CargarPractica 832, 39
exec DBO.CargarPractica 435, 16
exec DBO.CargarPractica 472, 22
exec DBO.CargarPractica 684, 17
exec DBO.CargarPractica 202, 17
exec DBO.CargarPractica 433, 21
exec DBO.CargarPractica 16, 26
exec DBO.CargarPractica 934, 20
exec DBO.CargarPractica 527, 33
exec DBO.CargarPractica 9, 4
exec DBO.CargarPractica 883, 32
exec DBO.CargarPractica 677, 40
exec DBO.CargarPractica 841, 40
exec DBO.CargarPractica 194, 39
exec DBO.CargarPractica 866, 30
exec DBO.CargarPractica 185, 29
exec DBO.CargarPractica 115, 2
exec DBO.CargarPractica 154, 1
exec DBO.CargarPractica 246, 20
exec DBO.CargarPractica 969, 34
exec DBO.CargarPractica 935, 4
exec DBO.CargarPractica 729, 25
exec DBO.CargarPractica 56, 21
exec DBO.CargarPractica 870, 34
exec DBO.CargarPractica 281, 20
exec DBO.CargarPractica 671, 36
exec DBO.CargarPractica 10, 6
exec DBO.CargarPractica 392, 37
exec DBO.CargarPractica 789, 12
exec DBO.CargarPractica 342, 9
exec DBO.CargarPractica 237, 37
exec DBO.CargarPractica 269, 12
exec DBO.CargarPractica 106, 2
exec DBO.CargarPractica 384, 15
exec DBO.CargarPractica 312, 22
exec DBO.CargarPractica 870, 38
exec DBO.CargarPractica 276, 8
exec DBO.CargarPractica 883, 11
exec DBO.CargarPractica 295, 8
exec DBO.CargarPractica 466, 25
exec DBO.CargarPractica 138, 14
exec DBO.CargarPractica 108, 4
exec DBO.CargarPractica 12, 25
exec DBO.CargarPractica 955, 12
exec DBO.CargarPractica 305, 7
exec DBO.CargarPractica 139, 2
exec DBO.CargarPractica 951, 22
exec DBO.CargarPractica 219, 31
exec DBO.CargarPractica 202, 7
exec DBO.CargarPractica 414, 11
exec DBO.CargarPractica 915, 15
exec DBO.CargarPractica 295, 5
exec DBO.CargarPractica 417, 8
exec DBO.CargarPractica 544, 2
exec DBO.CargarPractica 997, 40
exec DBO.CargarPractica 977, 20
exec DBO.CargarPractica 722, 18
exec DBO.CargarPractica 650, 32
exec DBO.CargarPractica 198, 35
exec DBO.CargarPractica 41, 29
exec DBO.CargarPractica 774, 40
exec DBO.CargarPractica 502, 23
exec DBO.CargarPractica 833, 14
exec DBO.CargarPractica 693, 30
exec DBO.CargarPractica 889, 13
exec DBO.CargarPractica 626, 4
exec DBO.CargarPractica 795, 22
exec DBO.CargarPractica 258, 21
exec DBO.CargarPractica 814, 30
exec DBO.CargarPractica 263, 11
exec DBO.CargarPractica 951, 1
exec DBO.CargarPractica 453, 4
exec DBO.CargarPractica 152, 17
exec DBO.CargarPractica 11, 4
exec DBO.CargarPractica 332, 22
exec DBO.CargarPractica 937, 16
exec DBO.CargarPractica 428, 11
exec DBO.CargarPractica 740, 12
exec DBO.CargarPractica 707, 8
exec DBO.CargarPractica 278, 37
exec DBO.CargarPractica 713, 29
exec DBO.CargarPractica 913, 1
exec DBO.CargarPractica 904, 16
exec DBO.CargarPractica 61, 7
exec DBO.CargarPractica 98, 39
exec DBO.CargarPractica 904, 25
exec DBO.CargarPractica 112, 23
exec DBO.CargarPractica 413, 17
exec DBO.CargarPractica 815, 1
exec DBO.CargarPractica 1, 18
exec DBO.CargarPractica 136, 30
exec DBO.CargarPractica 672, 4
exec DBO.CargarPractica 351, 29
exec DBO.CargarPractica 908, 19
exec DBO.CargarPractica 585, 1
exec DBO.CargarPractica 175, 26
exec DBO.CargarPractica 435, 35
exec DBO.CargarPractica 448, 20
exec DBO.CargarPractica 447, 22
exec DBO.CargarPractica 844, 11
exec DBO.CargarPractica 387, 19
exec DBO.CargarPractica 604, 16
exec DBO.CargarPractica 573, 34
exec DBO.CargarPractica 726, 11
exec DBO.CargarPractica 730, 1
exec DBO.CargarPractica 616, 18
exec DBO.CargarPractica 611, 3
exec DBO.CargarPractica 668, 30
exec DBO.CargarPractica 656, 36
exec DBO.CargarPractica 282, 34
exec DBO.CargarPractica 779, 12
exec DBO.CargarPractica 881, 12
exec DBO.CargarPractica 967, 9
exec DBO.CargarPractica 382, 3
exec DBO.CargarPractica 259, 35
exec DBO.CargarPractica 784, 25
exec DBO.CargarPractica 757, 9
exec DBO.CargarPractica 454, 1
exec DBO.CargarPractica 660, 28
exec DBO.CargarPractica 225, 3
exec DBO.CargarPractica 805, 36
exec DBO.CargarPractica 336, 7
exec DBO.CargarPractica 271, 32
exec DBO.CargarPractica 286, 37
exec DBO.CargarPractica 432, 19
exec DBO.CargarPractica 902, 38
exec DBO.CargarPractica 22, 22
exec DBO.CargarPractica 599, 18
exec DBO.CargarPractica 753, 39
exec DBO.CargarPractica 263, 6
exec DBO.CargarPractica 453, 4
exec DBO.CargarPractica 164, 17
exec DBO.CargarPractica 876, 38
exec DBO.CargarPractica 280, 28
exec DBO.CargarPractica 226, 14
exec DBO.CargarPractica 301, 10
exec DBO.CargarPractica 351, 39
exec DBO.CargarPractica 684, 14
exec DBO.CargarPractica 684, 17
exec DBO.CargarPractica 369, 30
exec DBO.CargarPractica 912, 27
exec DBO.CargarPractica 130, 39
exec DBO.CargarPractica 67, 38
exec DBO.CargarPractica 511, 15
exec DBO.CargarPractica 279, 34
exec DBO.CargarPractica 556, 7
exec DBO.CargarPractica 434, 27
exec DBO.CargarPractica 278, 10
exec DBO.CargarPractica 130, 20
exec DBO.CargarPractica 238, 1
exec DBO.CargarPractica 385, 17
exec DBO.CargarPractica 42, 39
exec DBO.CargarPractica 497, 6
exec DBO.CargarPractica 245, 5
exec DBO.CargarPractica 879, 13
exec DBO.CargarPractica 186, 28
exec DBO.CargarPractica 35, 27
exec DBO.CargarPractica 369, 1
exec DBO.CargarPractica 712, 12
exec DBO.CargarPractica 827, 16
exec DBO.CargarPractica 668, 9
exec DBO.CargarPractica 176, 16
exec DBO.CargarPractica 173, 36
exec DBO.CargarPractica 144, 32
exec DBO.CargarPractica 704, 40
exec DBO.CargarPractica 14, 23
exec DBO.CargarPractica 583, 18
exec DBO.CargarPractica 742, 40
exec DBO.CargarPractica 117, 10
exec DBO.CargarPractica 613, 1
exec DBO.CargarPractica 553, 34
exec DBO.CargarPractica 300, 23
exec DBO.CargarPractica 514, 33
exec DBO.CargarPractica 128, 26
exec DBO.CargarPractica 916, 8
exec DBO.CargarPractica 77, 2
exec DBO.CargarPractica 219, 37
exec DBO.CargarPractica 17, 37
exec DBO.CargarPractica 359, 24
exec DBO.CargarPractica 873, 18
exec DBO.CargarPractica 259, 17
exec DBO.CargarPractica 526, 21
exec DBO.CargarPractica 504, 5
exec DBO.CargarPractica 248, 31
exec DBO.CargarPractica 894, 39
exec DBO.CargarPractica 492, 36
exec DBO.CargarPractica 971, 34
exec DBO.CargarPractica 307, 15
exec DBO.CargarPractica 569, 22
exec DBO.CargarPractica 531, 19
exec DBO.CargarPractica 441, 18
exec DBO.CargarPractica 755, 9
exec DBO.CargarPractica 309, 9
exec DBO.CargarPractica 37, 26
exec DBO.CargarPractica 677, 8
exec DBO.CargarPractica 272, 1
exec DBO.CargarPractica 31, 3
exec DBO.CargarPractica 457, 39
exec DBO.CargarPractica 418, 2
exec DBO.CargarPractica 225, 11
exec DBO.CargarPractica 947, 2
exec DBO.CargarPractica 131, 6
exec DBO.CargarPractica 125, 37
exec DBO.CargarPractica 778, 25
exec DBO.CargarPractica 442, 2
exec DBO.CargarPractica 24, 17
exec DBO.CargarPractica 290, 32
exec DBO.CargarPractica 674, 24
exec DBO.CargarPractica 37, 12
exec DBO.CargarPractica 500, 3
exec DBO.CargarPractica 964, 23
exec DBO.CargarPractica 73, 13
exec DBO.CargarPractica 370, 33
exec DBO.CargarPractica 637, 10
exec DBO.CargarPractica 799, 4
exec DBO.CargarPractica 679, 1
exec DBO.CargarPractica 368, 30
exec DBO.CargarPractica 337, 6
exec DBO.CargarPractica 947, 31
exec DBO.CargarPractica 737, 1
exec DBO.CargarPractica 365, 40
exec DBO.CargarPractica 586, 4
exec DBO.CargarPractica 475, 26
exec DBO.CargarPractica 754, 25
exec DBO.CargarPractica 331, 16
exec DBO.CargarPractica 968, 22
exec DBO.CargarPractica 759, 23
exec DBO.CargarPractica 430, 35
exec DBO.CargarPractica 196, 1
exec DBO.CargarPractica 585, 40
exec DBO.CargarPractica 349, 7
exec DBO.CargarPractica 823, 20
exec DBO.CargarPractica 833, 5
exec DBO.CargarPractica 591, 7
exec DBO.CargarPractica 399, 20
exec DBO.CargarPractica 399, 13
exec DBO.CargarPractica 1, 20
exec DBO.CargarPractica 422, 38
exec DBO.CargarPractica 848, 15
exec DBO.CargarPractica 176, 34
exec DBO.CargarPractica 580, 34
exec DBO.CargarPractica 186, 34
exec DBO.CargarPractica 927, 29
exec DBO.CargarPractica 373, 10
exec DBO.CargarPractica 825, 17
exec DBO.CargarPractica 540, 18
exec DBO.CargarPractica 28, 13
exec DBO.CargarPractica 703, 1
exec DBO.CargarPractica 662, 6
exec DBO.CargarPractica 210, 11
exec DBO.CargarPractica 811, 7
exec DBO.CargarPractica 862, 29
exec DBO.CargarPractica 93, 11
exec DBO.CargarPractica 44, 35
exec DBO.CargarPractica 365, 21
exec DBO.CargarPractica 378, 32
exec DBO.CargarPractica 371, 6
exec DBO.CargarPractica 870, 31
exec DBO.CargarPractica 70, 10
exec DBO.CargarPractica 120, 32
exec DBO.CargarPractica 238, 7
exec DBO.CargarPractica 832, 37
exec DBO.CargarPractica 26, 27
exec DBO.CargarPractica 255, 26
exec DBO.CargarPractica 829, 39
exec DBO.CargarPractica 760, 26
exec DBO.CargarPractica 381, 13
exec DBO.CargarPractica 383, 20
exec DBO.CargarPractica 397, 21
exec DBO.CargarPractica 315, 9
exec DBO.CargarPractica 437, 32
exec DBO.CargarPractica 292, 26
exec DBO.CargarPractica 461, 8
exec DBO.CargarPractica 790, 32
exec DBO.CargarPractica 655, 33
exec DBO.CargarPractica 356, 38
exec DBO.CargarPractica 5, 18
exec DBO.CargarPractica 852, 28
exec DBO.CargarPractica 619, 37
exec DBO.CargarPractica 846, 4
exec DBO.CargarPractica 508, 25
exec DBO.CargarPractica 21, 28
exec DBO.CargarPractica 346, 36
exec DBO.CargarPractica 261, 37
exec DBO.CargarPractica 159, 10
exec DBO.CargarPractica 390, 18
exec DBO.CargarPractica 5, 8
exec DBO.CargarPractica 704, 13
exec DBO.CargarPractica 952, 11
exec DBO.CargarPractica 279, 25
exec DBO.CargarPractica 602, 24
exec DBO.CargarPractica 646, 13
exec DBO.CargarPractica 418, 40
exec DBO.CargarPractica 751, 34
exec DBO.CargarPractica 646, 18
exec DBO.CargarPractica 994, 40
exec DBO.CargarPractica 246, 5
exec DBO.CargarPractica 277, 18
exec DBO.CargarPractica 901, 40
exec DBO.CargarPractica 523, 12
exec DBO.CargarPractica 597, 2
exec DBO.CargarPractica 251, 35
exec DBO.CargarPractica 936, 17
exec DBO.CargarPractica 735, 6
exec DBO.CargarPractica 517, 30
exec DBO.CargarPractica 307, 26
exec DBO.CargarPractica 91, 37
exec DBO.CargarPractica 294, 23
exec DBO.CargarPractica 15, 31
exec DBO.CargarPractica 557, 35
exec DBO.CargarPractica 227, 19
exec DBO.CargarPractica 673, 28
exec DBO.CargarPractica 439, 21
exec DBO.CargarPractica 961, 4
exec DBO.CargarPractica 179, 5
exec DBO.CargarPractica 356, 3
exec DBO.CargarPractica 926, 37
exec DBO.CargarPractica 795, 25
exec DBO.CargarPractica 842, 34
exec DBO.CargarPractica 802, 3
exec DBO.CargarPractica 470, 34
exec DBO.CargarPractica 501, 32
exec DBO.CargarPractica 226, 32
exec DBO.CargarPractica 940, 14
exec DBO.CargarPractica 933, 25
exec DBO.CargarPractica 312, 14
exec DBO.CargarPractica 245, 40
exec DBO.CargarPractica 265, 29
exec DBO.CargarPractica 129, 11
exec DBO.CargarPractica 424, 38
exec DBO.CargarPractica 882, 35
exec DBO.CargarPractica 393, 6
exec DBO.CargarPractica 756, 33
exec DBO.CargarPractica 113, 12
exec DBO.CargarPractica 686, 21
exec DBO.CargarPractica 865, 13
exec DBO.CargarPractica 223, 7
exec DBO.CargarPractica 58, 24
exec DBO.CargarPractica 417, 8
exec DBO.CargarPractica 91, 7
exec DBO.CargarPractica 296, 40
exec DBO.CargarPractica 921, 23
exec DBO.CargarPractica 501, 27
exec DBO.CargarPractica 496, 35
exec DBO.CargarPractica 487, 40
exec DBO.CargarPractica 761, 5
exec DBO.CargarPractica 18, 18
exec DBO.CargarPractica 654, 35
exec DBO.CargarPractica 671, 13
exec DBO.CargarPractica 459, 16
exec DBO.CargarPractica 594, 6
exec DBO.CargarPractica 977, 31
exec DBO.CargarPractica 216, 39
exec DBO.CargarPractica 749, 24
exec DBO.CargarPractica 897, 7
exec DBO.CargarPractica 448, 6
exec DBO.CargarPractica 240, 36
exec DBO.CargarPractica 418, 17
exec DBO.CargarPractica 802, 5
exec DBO.CargarPractica 3, 15
exec DBO.CargarPractica 404, 28
exec DBO.CargarPractica 129, 32
exec DBO.CargarPractica 525, 31
exec DBO.CargarPractica 437, 1
exec DBO.CargarPractica 666, 37
exec DBO.CargarPractica 564, 16
exec DBO.CargarPractica 578, 40
exec DBO.CargarPractica 47, 28
exec DBO.CargarPractica 632, 9
exec DBO.CargarPractica 717, 24
exec DBO.CargarPractica 849, 9
exec DBO.CargarPractica 230, 31
exec DBO.CargarPractica 31, 18
exec DBO.CargarPractica 487, 37
exec DBO.CargarPractica 219, 33
exec DBO.CargarPractica 518, 29
exec DBO.CargarPractica 893, 12
exec DBO.CargarPractica 16, 17
exec DBO.CargarPractica 465, 23
exec DBO.CargarPractica 173, 21
exec DBO.CargarPractica 634, 30
exec DBO.CargarPractica 837, 10
exec DBO.CargarPractica 666, 25
exec DBO.CargarPractica 701, 13
exec DBO.CargarPractica 285, 39
exec DBO.CargarPractica 320, 32
exec DBO.CargarPractica 888, 40
exec DBO.CargarPractica 106, 21
exec DBO.CargarPractica 772, 13
exec DBO.CargarPractica 886, 1
exec DBO.CargarPractica 397, 4
exec DBO.CargarPractica 140, 1
exec DBO.CargarPractica 129, 38
exec DBO.CargarPractica 102, 12
exec DBO.CargarPractica 337, 1
exec DBO.CargarPractica 247, 28
exec DBO.CargarPractica 607, 27
exec DBO.CargarPractica 871, 37
exec DBO.CargarPractica 656, 36
exec DBO.CargarPractica 239, 11
exec DBO.CargarPractica 496, 20
exec DBO.CargarPractica 884, 14
exec DBO.CargarPractica 744, 30
exec DBO.CargarPractica 625, 36
exec DBO.CargarPractica 774, 21
exec DBO.CargarPractica 390, 33
exec DBO.CargarPractica 853, 38
exec DBO.CargarPractica 572, 17
exec DBO.CargarPractica 498, 5
exec DBO.CargarPractica 769, 37
exec DBO.CargarPractica 683, 2
exec DBO.CargarPractica 271, 32
exec DBO.CargarPractica 867, 2
exec DBO.CargarPractica 905, 2
exec DBO.CargarPractica 55, 18
exec DBO.CargarPractica 867, 36
exec DBO.CargarPractica 868, 26
exec DBO.CargarPractica 372, 30
exec DBO.CargarPractica 335, 23
exec DBO.CargarPractica 579, 27
exec DBO.CargarPractica 13, 22
exec DBO.CargarPractica 755, 24
exec DBO.CargarPractica 9, 15
exec DBO.CargarPractica 803, 18
exec DBO.CargarPractica 3, 3
exec DBO.CargarPractica 16, 18
exec DBO.CargarPractica 763, 31
exec DBO.CargarPractica 963, 35
exec DBO.CargarPractica 156, 20
exec DBO.CargarPractica 129, 10
exec DBO.CargarPractica 809, 3
exec DBO.CargarPractica 788, 1
exec DBO.CargarPractica 574, 39
exec DBO.CargarPractica 439, 35
exec DBO.CargarPractica 785, 24
exec DBO.CargarPractica 716, 9
exec DBO.CargarPractica 421, 38
exec DBO.CargarPractica 666, 25
exec DBO.CargarPractica 299, 8
exec DBO.CargarPractica 871, 5
exec DBO.CargarPractica 362, 33
exec DBO.CargarPractica 673, 29
exec DBO.CargarPractica 289, 36
exec DBO.CargarPractica 896, 6
exec DBO.CargarPractica 974, 40
exec DBO.CargarPractica 166, 8
exec DBO.CargarPractica 403, 15
exec DBO.CargarPractica 721, 4
exec DBO.CargarPractica 503, 39
exec DBO.CargarPractica 640, 5
exec DBO.CargarPractica 985, 13
exec DBO.CargarPractica 393, 31
exec DBO.CargarPractica 294, 31
exec DBO.CargarPractica 864, 7
exec DBO.CargarPractica 376, 36
exec DBO.CargarPractica 850, 35
exec DBO.CargarPractica 724, 8
exec DBO.CargarPractica 306, 34
exec DBO.CargarPractica 336, 35
exec DBO.CargarPractica 622, 11
exec DBO.CargarPractica 47, 23
exec DBO.CargarPractica 717, 6
exec DBO.CargarPractica 831, 22
exec DBO.CargarPractica 439, 17
exec DBO.CargarPractica 336, 14
exec DBO.CargarPractica 924, 20
exec DBO.CargarPractica 17, 37
exec DBO.CargarPractica 10, 29
exec DBO.CargarPractica 72, 21
exec DBO.CargarPractica 43, 39
exec DBO.CargarPractica 141, 16
exec DBO.CargarPractica 164, 7
exec DBO.CargarPractica 485, 32
exec DBO.CargarPractica 416, 39
exec DBO.CargarPractica 660, 3
exec DBO.CargarPractica 521, 22
exec DBO.CargarPractica 712, 40
exec DBO.CargarPractica 137, 8
exec DBO.CargarPractica 693, 10
exec DBO.CargarPractica 898, 40
exec DBO.CargarPractica 27, 31
exec DBO.CargarPractica 278, 35
exec DBO.CargarPractica 643, 39
exec DBO.CargarPractica 974, 31
exec DBO.CargarPractica 155, 27
exec DBO.CargarPractica 810, 21
exec DBO.CargarPractica 284, 5
exec DBO.CargarPractica 125, 22
exec DBO.CargarPractica 180, 18
exec DBO.CargarPractica 840, 7
exec DBO.CargarPractica 439, 31
exec DBO.CargarPractica 32, 4
exec DBO.CargarPractica 823, 12
exec DBO.CargarPractica 646, 7
exec DBO.CargarPractica 389, 28
exec DBO.CargarPractica 779, 19
exec DBO.CargarPractica 137, 19
exec DBO.CargarPractica 335, 28
exec DBO.CargarPractica 360, 17
exec DBO.CargarPractica 463, 28
exec DBO.CargarPractica 268, 33
exec DBO.CargarPractica 731, 14
exec DBO.CargarPractica 105, 6
exec DBO.CargarPractica 539, 32
exec DBO.CargarPractica 533, 30
exec DBO.CargarPractica 666, 23
exec DBO.CargarPractica 995, 6
exec DBO.CargarPractica 272, 38
exec DBO.CargarPractica 124, 20
exec DBO.CargarPractica 336, 29
exec DBO.CargarPractica 398, 40
exec DBO.CargarPractica 66, 37
exec DBO.CargarPractica 317, 14
exec DBO.CargarPractica 567, 38
exec DBO.CargarPractica 11, 17
exec DBO.CargarPractica 670, 8
exec DBO.CargarPractica 708, 24
exec DBO.CargarPractica 190, 37
exec DBO.CargarPractica 988, 14
exec DBO.CargarPractica 805, 5
exec DBO.CargarPractica 495, 5
exec DBO.CargarPractica 468, 7
exec DBO.CargarPractica 115, 5
exec DBO.CargarPractica 150, 40
exec DBO.CargarPractica 472, 1
exec DBO.CargarPractica 713, 37
exec DBO.CargarPractica 433, 30
exec DBO.CargarPractica 746, 31
exec DBO.CargarPractica 772, 23
exec DBO.CargarPractica 579, 39
exec DBO.CargarPractica 321, 33
exec DBO.CargarPractica 247, 19
exec DBO.CargarPractica 478, 15
exec DBO.CargarPractica 718, 32
exec DBO.CargarPractica 585, 31
exec DBO.CargarPractica 574, 31
exec DBO.CargarPractica 452, 8
exec DBO.CargarPractica 953, 3
exec DBO.CargarPractica 363, 26
exec DBO.CargarPractica 404, 8
exec DBO.CargarPractica 799, 24
exec DBO.CargarPractica 437, 14
exec DBO.CargarPractica 18, 31
exec DBO.CargarPractica 224, 14
exec DBO.CargarPractica 733, 1
exec DBO.CargarPractica 364, 37
exec DBO.CargarPractica 272, 6
exec DBO.CargarPractica 428, 2
exec DBO.CargarPractica 338, 9
exec DBO.CargarPractica 2, 29
exec DBO.CargarPractica 160, 7
exec DBO.CargarPractica 522, 4
exec DBO.CargarPractica 858, 2
exec DBO.CargarPractica 348, 24
exec DBO.CargarPractica 706, 5
exec DBO.CargarPractica 251, 23
exec DBO.CargarPractica 722, 16
exec DBO.CargarPractica 710, 20
exec DBO.CargarPractica 487, 34
exec DBO.CargarPractica 650, 24
exec DBO.CargarPractica 642, 34
exec DBO.CargarPractica 408, 26
exec DBO.CargarPractica 888, 2
exec DBO.CargarPractica 757, 7
exec DBO.CargarPractica 861, 8
exec DBO.CargarPractica 630, 7
exec DBO.CargarPractica 659, 7
exec DBO.CargarPractica 245, 23
exec DBO.CargarPractica 369, 5
exec DBO.CargarPractica 218, 23
exec DBO.CargarPractica 483, 18
exec DBO.CargarPractica 802, 21
exec DBO.CargarPractica 573, 4
exec DBO.CargarPractica 421, 19
exec DBO.CargarPractica 640, 7
exec DBO.CargarPractica 900, 14
exec DBO.CargarPractica 26, 18
exec DBO.CargarPractica 210, 5
exec DBO.CargarPractica 275, 15
exec DBO.CargarPractica 292, 5
exec DBO.CargarPractica 975, 38
exec DBO.CargarPractica 664, 33
exec DBO.CargarPractica 764, 27
exec DBO.CargarPractica 767, 23
exec DBO.CargarPractica 777, 25
exec DBO.CargarPractica 293, 10
exec DBO.CargarPractica 636, 26
exec DBO.CargarPractica 405, 27
exec DBO.CargarPractica 47, 8
exec DBO.CargarPractica 699, 16
exec DBO.CargarPractica 138, 7
exec DBO.CargarPractica 877, 19
exec DBO.CargarPractica 40, 39
exec DBO.CargarPractica 464, 24
exec DBO.CargarPractica 681, 5
exec DBO.CargarPractica 81, 19
exec DBO.CargarPractica 295, 31
exec DBO.CargarPractica 436, 37
exec DBO.CargarPractica 469, 31
exec DBO.CargarPractica 414, 7
exec DBO.CargarPractica 331, 20
exec DBO.CargarPractica 37, 38
exec DBO.CargarPractica 646, 6
exec DBO.CargarPractica 620, 2
exec DBO.CargarPractica 393, 39
exec DBO.CargarPractica 790, 19
exec DBO.CargarPractica 884, 4
exec DBO.CargarPractica 227, 7
exec DBO.CargarPractica 865, 29
exec DBO.CargarPractica 525, 38
exec DBO.CargarPractica 757, 19
exec DBO.CargarPractica 654, 8
exec DBO.CargarPractica 131, 21
exec DBO.CargarPractica 992, 10
exec DBO.CargarPractica 185, 16
exec DBO.CargarPractica 99, 19
exec DBO.CargarPractica 19, 31
exec DBO.CargarPractica 91, 29
exec DBO.CargarPractica 596, 20
exec DBO.CargarPractica 915, 5
exec DBO.CargarPractica 252, 10
exec DBO.CargarPractica 656, 38
exec DBO.CargarPractica 602, 5
exec DBO.CargarPractica 153, 31
exec DBO.CargarPractica 853, 6
exec DBO.CargarPractica 421, 12
exec DBO.CargarPractica 947, 10
exec DBO.CargarPractica 9, 3
exec DBO.CargarPractica 619, 39
exec DBO.CargarPractica 632, 18
exec DBO.CargarPractica 922, 26
exec DBO.CargarPractica 823, 38
exec DBO.CargarPractica 760, 15
exec DBO.CargarPractica 644, 37
exec DBO.CargarPractica 178, 30
exec DBO.CargarPractica 225, 10
exec DBO.CargarPractica 192, 7
exec DBO.CargarPractica 108, 22
exec DBO.CargarPractica 344, 7
exec DBO.CargarPractica 186, 2
exec DBO.CargarPractica 739, 5
exec DBO.CargarPractica 784, 3
exec DBO.CargarPractica 679, 23
exec DBO.CargarPractica 75, 37
exec DBO.CargarPractica 480, 39
exec DBO.CargarPractica 642, 21
exec DBO.CargarPractica 558, 28
exec DBO.CargarPractica 326, 6
exec DBO.CargarPractica 641, 3
exec DBO.CargarPractica 308, 7
exec DBO.CargarPractica 316, 27
exec DBO.CargarPractica 790, 35
exec DBO.CargarPractica 180, 1
exec DBO.CargarPractica 301, 6
exec DBO.CargarPractica 231, 28
exec DBO.CargarPractica 609, 20
exec DBO.CargarPractica 950, 8
exec DBO.CargarPractica 258, 29
exec DBO.CargarPractica 942, 22
exec DBO.CargarPractica 170, 6
exec DBO.CargarPractica 978, 34
exec DBO.CargarPractica 13, 17
exec DBO.CargarPractica 517, 7
exec DBO.CargarPractica 620, 11
exec DBO.CargarPractica 827, 10
exec DBO.CargarPractica 48, 13
exec DBO.CargarPractica 250, 37
exec DBO.CargarPractica 900, 20
exec DBO.CargarPractica 725, 5
exec DBO.CargarPractica 279, 25
exec DBO.CargarPractica 523, 38
exec DBO.CargarPractica 226, 26
exec DBO.CargarPractica 781, 11
exec DBO.CargarPractica 993, 18
exec DBO.CargarPractica 706, 2
exec DBO.CargarPractica 671, 9
exec DBO.CargarPractica 253, 3
exec DBO.CargarPractica 971, 37
exec DBO.CargarPractica 348, 31
exec DBO.CargarPractica 60, 20
exec DBO.CargarPractica 710, 16
exec DBO.CargarPractica 849, 8
exec DBO.CargarPractica 695, 37
exec DBO.CargarPractica 25, 20
exec DBO.CargarPractica 231, 26
exec DBO.CargarPractica 96, 39
exec DBO.CargarPractica 611, 14
exec DBO.CargarPractica 138, 32
exec DBO.CargarPractica 400, 38
exec DBO.CargarPractica 775, 34
exec DBO.CargarPractica 441, 8
exec DBO.CargarPractica 332, 13
exec DBO.CargarPractica 217, 18
exec DBO.CargarPractica 316, 25
exec DBO.CargarPractica 454, 20
exec DBO.CargarPractica 190, 11
exec DBO.CargarPractica 191, 18
exec DBO.CargarPractica 872, 25
exec DBO.CargarPractica 213, 39
exec DBO.CargarPractica 338, 19
exec DBO.CargarPractica 832, 9
exec DBO.CargarPractica 572, 22
exec DBO.CargarPractica 509, 36
exec DBO.CargarPractica 642, 1
exec DBO.CargarPractica 179, 8
exec DBO.CargarPractica 32, 19
exec DBO.CargarPractica 234, 7
exec DBO.CargarPractica 581, 18
exec DBO.CargarPractica 277, 7
exec DBO.CargarPractica 9, 20
exec DBO.CargarPractica 34, 6
exec DBO.CargarPractica 489, 11
exec DBO.CargarPractica 528, 33
exec DBO.CargarPractica 60, 10
exec DBO.CargarPractica 901, 37
exec DBO.CargarPractica 380, 16
exec DBO.CargarPractica 674, 22
exec DBO.CargarPractica 581, 9
exec DBO.CargarPractica 599, 38
exec DBO.CargarPractica 580, 40
exec DBO.CargarPractica 394, 5
exec DBO.CargarPractica 798, 15
exec DBO.CargarPractica 667, 7
exec DBO.CargarPractica 648, 23
exec DBO.CargarPractica 891, 13
exec DBO.CargarPractica 144, 30
exec DBO.CargarPractica 988, 32
exec DBO.CargarPractica 827, 22
exec DBO.CargarPractica 790, 16
exec DBO.CargarPractica 629, 1
exec DBO.CargarPractica 50, 39
exec DBO.CargarPractica 737, 3
exec DBO.CargarPractica 33, 1
exec DBO.CargarPractica 907, 9
exec DBO.CargarPractica 630, 12
exec DBO.CargarPractica 689, 25
exec DBO.CargarPractica 229, 15
exec DBO.CargarPractica 196, 29
exec DBO.CargarPractica 102, 32
exec DBO.CargarPractica 598, 21
exec DBO.CargarPractica 741, 16
exec DBO.CargarPractica 196, 33
exec DBO.CargarPractica 405, 10
exec DBO.CargarPractica 268, 18
exec DBO.CargarPractica 753, 28
exec DBO.CargarPractica 811, 7
exec DBO.CargarPractica 333, 4
exec DBO.CargarPractica 280, 1
exec DBO.CargarPractica 590, 19
exec DBO.CargarPractica 944, 6
exec DBO.CargarPractica 787, 4
exec DBO.CargarPractica 58, 2
exec DBO.CargarPractica 96, 3
exec DBO.CargarPractica 280, 16
exec DBO.CargarPractica 997, 9
exec DBO.CargarPractica 738, 22
exec DBO.CargarPractica 491, 10
exec DBO.CargarPractica 725, 30
exec DBO.CargarPractica 248, 15
exec DBO.CargarPractica 799, 9
exec DBO.CargarPractica 47, 1
exec DBO.CargarPractica 465, 22
exec DBO.CargarPractica 343, 29
exec DBO.CargarPractica 574, 4
exec DBO.CargarPractica 799, 19
exec DBO.CargarPractica 763, 7
exec DBO.CargarPractica 787, 35
exec DBO.CargarPractica 314, 7
exec DBO.CargarPractica 811, 9
exec DBO.CargarPractica 243, 25
exec DBO.CargarPractica 832, 13
exec DBO.CargarPractica 689, 17
exec DBO.CargarPractica 556, 4
exec DBO.CargarPractica 366, 40
exec DBO.CargarPractica 579, 25
exec DBO.CargarPractica 438, 20
exec DBO.CargarPractica 902, 8
exec DBO.CargarPractica 532, 26
exec DBO.CargarPractica 67, 21
exec DBO.CargarPractica 372, 5
exec DBO.CargarPractica 293, 26
exec DBO.CargarPractica 390, 40
exec DBO.CargarPractica 371, 37
exec DBO.CargarPractica 252, 26
exec DBO.CargarPractica 676, 25
exec DBO.CargarPractica 601, 26
exec DBO.CargarPractica 987, 24
exec DBO.CargarPractica 254, 37
exec DBO.CargarPractica 955, 12
exec DBO.CargarPractica 368, 36
exec DBO.CargarPractica 46, 18

select *
from Socio s 
inner join Categoria c on (s.CodCategoria = c.CodCategoria)
inner join Practica p on (s.CodSocio = p.CodSocio)
inner join Deporte d on (p.CodDeporte = d.CodDeporte)

commit transaction
set xact_abort off
set nocount off

--select top 100 'dbContext.Socios.Add(new Socio { CodSocio = '+cast(codsocio as varchar)+', Nombre = "'+Nombre+'", Apellido = "'+Apellido+'", EMail = "'+email+'", Sexo = '''+Sexo+''', FechaNacimiento = new DateTime('+cast(year(FechaNacimiento) as varchar)+','+cast(month(FechaNacimiento) as varchar)+','+cast(day(FechaNacimiento) as varchar)+'), CUIL = "'+cuil+'", Categoria = new Categoria { CodCategoria = '+cast(codcategoria as varchar)+'} });' from Socio
--select top 150 'dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = '+cast(CodDeporte as varchar)+' }, Socio = new Socio { CodSocio = '+cast(CodSocio as varchar)+' } });' from Practica where CodSocio <= 100