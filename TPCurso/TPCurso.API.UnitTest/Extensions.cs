using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;
using TPCurso.API.Models;

namespace TPCurso.API.UnitTest
{
	public static class Extensions
	{
		public static Categoria GetCategoria(int codCategoria, DbSet<Categoria> categorias)
		{
			return categorias.FirstOrDefault(c => c.CodCategoria == codCategoria);
		}

		public static void Seed(this ClubDbContext dbContext)
		{
			#region Alta de categorias
			dbContext.Categorias.Add(new Categoria {
				CodCategoria = 1, 
				DesCategoria = "Activo Mayor"
			});

			dbContext.Categorias.Add(new Categoria
			{
				CodCategoria = 2,
				DesCategoria = "Activo Menor"
			});

			dbContext.Categorias.Add(new Categoria
			{
				CodCategoria = 3,
				DesCategoria = "Adherente"
			});

			dbContext.Categorias.Add(new Categoria
			{
				CodCategoria = 4,
				DesCategoria = "Honorarios"
			});

			dbContext.Categorias.Add(new Categoria
			{
				CodCategoria = 5,
				DesCategoria = "Vitalicio"
			});
			#endregion

			#region Alta de deportes
			dbContext.Deportes.Add(new Deporte
			{
				CodDeporte = 1,
				DesDeporte = "Atletismo"
			});

			dbContext.Deportes.Add(new Deporte
			{
				CodDeporte = 2,
				DesDeporte = "BMX"
			});

			dbContext.Deportes.Add(new Deporte
			{
				CodDeporte = 3,
				DesDeporte = "Baloncesto"
			});

			dbContext.Deportes.Add(new Deporte
			{
				CodDeporte = 4,
				DesDeporte = "Balonmano"
			});

			dbContext.Deportes.Add(new Deporte
			{
				CodDeporte = 5,
				DesDeporte = "Boxeo"
			});

			dbContext.Deportes.Add(new Deporte
			{
				CodDeporte = 6,
				DesDeporte = "Bádminton"
			});

			dbContext.Deportes.Add(new Deporte
			{
				CodDeporte = 7,
				DesDeporte = "Ciclismo"
			});

			dbContext.Deportes.Add(new Deporte
			{
				CodDeporte = 8,
				DesDeporte = "Deportes acuáticos"
			});

			dbContext.Deportes.Add(new Deporte
			{
				CodDeporte = 9,
				DesDeporte = "Equitación"
			});

			dbContext.Deportes.Add(new Deporte
			{
				CodDeporte = 10,
				DesDeporte = "Esgrima"
			});
			#endregion

			#region Alta de socios
			dbContext.Socios.Add(new Socio { CodSocio = 1, Nombre = "Helene", Apellido = "Posselt", EMail = "hposselt0@cpanel.net", Sexo = 'F', FechaNacimiento = new DateTime(1986, 7, 1), CUIL = "19485111666", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 2, Nombre = "Avery", Apellido = "Lambricht", EMail = "alambricht1@wsj.com", Sexo = 'M', FechaNacimiento = new DateTime(1988, 10, 2), CUIL = "60039092777", Categoria = new Categoria { CodCategoria = 5 } });
			dbContext.Socios.Add(new Socio { CodSocio = 3, Nombre = "Rosalinda", Apellido = "Quest", EMail = "rquest2@intel.com", Sexo = 'F', FechaNacimiento = new DateTime(1985, 2, 25), CUIL = "04369935466", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 4, Nombre = "Jaclin", Apellido = "Pollington", EMail = "jpollington3@deviantart.com", Sexo = 'F', FechaNacimiento = new DateTime(1976, 6, 21), CUIL = "26102131900", Categoria = new Categoria { CodCategoria = 5 } });
			dbContext.Socios.Add(new Socio { CodSocio = 5, Nombre = "Florence", Apellido = "Lilywhite", EMail = "flilywhite4@huffingtonpost.com", Sexo = 'F', FechaNacimiento = new DateTime(1989, 12, 13), CUIL = "39873521166", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 6, Nombre = "Weylin", Apellido = "Reina", EMail = "wreina5@cmu.edu", Sexo = 'M', FechaNacimiento = new DateTime(1981, 5, 13), CUIL = "38278266322", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 7, Nombre = "Rosella", Apellido = "Lawrance", EMail = "rlawrance6@samsung.com", Sexo = 'F', FechaNacimiento = new DateTime(1984, 7, 5), CUIL = "50089219088", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 8, Nombre = "Noe", Apellido = "Aylott", EMail = "naylott7@earthlink.net", Sexo = 'M', FechaNacimiento = new DateTime(1970, 2, 1), CUIL = "27132556866", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 9, Nombre = "Katti", Apellido = "Wilshin", EMail = "kwilshin8@indiegogo.com", Sexo = 'F', FechaNacimiento = new DateTime(1975, 1, 24), CUIL = "70456763877", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 10, Nombre = "Ashlee", Apellido = "Piddle", EMail = "apiddle9@mtv.com", Sexo = 'F', FechaNacimiento = new DateTime(1982, 8, 28), CUIL = "72055139955", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 11, Nombre = "Findley", Apellido = "Donovan", EMail = "fdonovana@telegraph.co.uk", Sexo = 'M', FechaNacimiento = new DateTime(1988, 8, 21), CUIL = "60808941577", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 12, Nombre = "Toiboid", Apellido = "Fawdry", EMail = "tfawdryb@tripadvisor.com", Sexo = 'M', FechaNacimiento = new DateTime(1971, 5, 21), CUIL = "81860801477", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 13, Nombre = "Mayor", Apellido = "Pawelek", EMail = "mpawelekc@loc.gov", Sexo = 'M', FechaNacimiento = new DateTime(1990, 11, 30), CUIL = "07283981255", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 14, Nombre = "Licha", Apellido = "Langwade", EMail = "llangwaded@buzzfeed.com", Sexo = 'F', FechaNacimiento = new DateTime(1973, 4, 12), CUIL = "33197923855", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 15, Nombre = "Christiano", Apellido = "Chesterton", EMail = "cchestertone@prweb.com", Sexo = 'M', FechaNacimiento = new DateTime(1977, 4, 23), CUIL = "76080640133", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 16, Nombre = "Marjie", Apellido = "Alejandre", EMail = "malejandref@gravatar.com", Sexo = 'F', FechaNacimiento = new DateTime(1986, 8, 4), CUIL = "25973278688", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 17, Nombre = "Fraze", Apellido = "Teulier", EMail = "fteulierg@opensource.org", Sexo = 'M', FechaNacimiento = new DateTime(1985, 4, 17), CUIL = "03979533722", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 18, Nombre = "Ephrayim", Apellido = "Shearme", EMail = "eshearmeh@usda.gov", Sexo = 'M', FechaNacimiento = new DateTime(1975, 8, 14), CUIL = "01628250133", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 19, Nombre = "Roddy", Apellido = "Tybalt", EMail = "rtybalti@nih.gov", Sexo = 'M', FechaNacimiento = new DateTime(1987, 3, 7), CUIL = "14376151044", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 20, Nombre = "Mac", Apellido = "MacGiany", EMail = "mmacgianyj@uol.com.br", Sexo = 'M', FechaNacimiento = new DateTime(1974, 3, 24), CUIL = "77889562011", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 21, Nombre = "Inesita", Apellido = "Elliot", EMail = "ielliotk@google.ca", Sexo = 'F', FechaNacimiento = new DateTime(1985, 7, 9), CUIL = "81689164099", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 22, Nombre = "Burr", Apellido = "Paton", EMail = "bpatonl@webeden.co.uk", Sexo = 'M', FechaNacimiento = new DateTime(1974, 2, 10), CUIL = "78164852122", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 23, Nombre = "Brendin", Apellido = "Benwell", EMail = "bbenwellm@blogger.com", Sexo = 'M', FechaNacimiento = new DateTime(1977, 1, 6), CUIL = "00563750933", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 24, Nombre = "Kimball", Apellido = "Stonhouse", EMail = "kstonhousen@chronoengine.com", Sexo = 'M', FechaNacimiento = new DateTime(1976, 10, 5), CUIL = "64822363166", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 25, Nombre = "Katrine", Apellido = "Whittlesea", EMail = "kwhittleseao@vistaprint.com", Sexo = 'F', FechaNacimiento = new DateTime(1975, 10, 4), CUIL = "80567902922", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 26, Nombre = "Kelcie", Apellido = "Bellenger", EMail = "kbellengerp@va.gov", Sexo = 'F', FechaNacimiento = new DateTime(1977, 11, 6), CUIL = "79823868733", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 27, Nombre = "Retha", Apellido = "Emeny", EMail = "remenyq@seesaa.net", Sexo = 'F', FechaNacimiento = new DateTime(1983, 5, 2), CUIL = "98342454833", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 28, Nombre = "Tally", Apellido = "Jewkes", EMail = "tjewkesr@businesswire.com", Sexo = 'M', FechaNacimiento = new DateTime(1972, 5, 14), CUIL = "53196088966", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 29, Nombre = "Mollee", Apellido = "Kleinstein", EMail = "mkleinsteins@webs.com", Sexo = 'F', FechaNacimiento = new DateTime(1987, 7, 7), CUIL = "51188635899", Categoria = new Categoria { CodCategoria = 5 } });
			dbContext.Socios.Add(new Socio { CodSocio = 30, Nombre = "Kellen", Apellido = "Vassay", EMail = "kvassayt@flickr.com", Sexo = 'M', FechaNacimiento = new DateTime(1979, 9, 12), CUIL = "91208817977", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 31, Nombre = "Regan", Apellido = "Matus", EMail = "rmatusu@infoseek.co.jp", Sexo = 'M', FechaNacimiento = new DateTime(1987, 4, 21), CUIL = "72948682044", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 32, Nombre = "Elysia", Apellido = "Maryet", EMail = "emaryetv@google.co.jp", Sexo = 'F', FechaNacimiento = new DateTime(1988, 2, 18), CUIL = "01581001233", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 33, Nombre = "Kippy", Apellido = "Tregensoe", EMail = "ktregensoew@youku.com", Sexo = 'M', FechaNacimiento = new DateTime(1970, 5, 21), CUIL = "85750935099", Categoria = new Categoria { CodCategoria = 5 } });
			dbContext.Socios.Add(new Socio { CodSocio = 34, Nombre = "Jamey", Apellido = "January 1st", EMail = "jjanuarystx@ezinearticles.com", Sexo = 'M', FechaNacimiento = new DateTime(1973, 7, 21), CUIL = "85140790188", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 35, Nombre = "Fitzgerald", Apellido = "Rosenshine", EMail = "frosenshiney@bloomberg.com", Sexo = 'M', FechaNacimiento = new DateTime(1973, 4, 5), CUIL = "07257333222", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 36, Nombre = "Huntley", Apellido = "Readett", EMail = "hreadettz@meetup.com", Sexo = 'M', FechaNacimiento = new DateTime(1976, 5, 15), CUIL = "09316201477", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 37, Nombre = "Neda", Apellido = "Nother", EMail = "nnother10@clickbank.net", Sexo = 'F', FechaNacimiento = new DateTime(1990, 6, 9), CUIL = "61539036655", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 38, Nombre = "Dulcinea", Apellido = "Barke", EMail = "dbarke11@aboutads.info", Sexo = 'F', FechaNacimiento = new DateTime(1990, 1, 2), CUIL = "56567461944", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 39, Nombre = "Jerry", Apellido = "de Tocqueville", EMail = "jdetocqueville12@aboutads.info", Sexo = 'M', FechaNacimiento = new DateTime(1985, 5, 3), CUIL = "14062819055", Categoria = new Categoria { CodCategoria = 5 } });
			dbContext.Socios.Add(new Socio { CodSocio = 40, Nombre = "Burk", Apellido = "Godber", EMail = "bgodber13@google.com.hk", Sexo = 'M', FechaNacimiento = new DateTime(1970, 5, 6), CUIL = "42633963244", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 41, Nombre = "Jessie", Apellido = "Petken", EMail = "jpetken14@last.fm", Sexo = 'F', FechaNacimiento = new DateTime(1970, 8, 2), CUIL = "91949848244", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 42, Nombre = "Adriane", Apellido = "Pichan", EMail = "apichan15@pcworld.com", Sexo = 'F', FechaNacimiento = new DateTime(1972, 3, 15), CUIL = "81457618166", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 43, Nombre = "Anatollo", Apellido = "Yakunchikov", EMail = "ayakunchikov16@bigcartel.com", Sexo = 'M', FechaNacimiento = new DateTime(1972, 11, 7), CUIL = "49303520611", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 44, Nombre = "Ertha", Apellido = "Clowney", EMail = "eclowney17@unc.edu", Sexo = 'F', FechaNacimiento = new DateTime(1976, 4, 3), CUIL = "09576086088", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 45, Nombre = "Kally", Apellido = "Sowley", EMail = "ksowley18@cocolog-nifty.com", Sexo = 'F', FechaNacimiento = new DateTime(1984, 2, 21), CUIL = "35505306844", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 46, Nombre = "Lorrin", Apellido = "Dartan", EMail = "ldartan19@ftc.gov", Sexo = 'F', FechaNacimiento = new DateTime(1989, 4, 14), CUIL = "24874422555", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 47, Nombre = "Maurizia", Apellido = "O'Hingerty", EMail = "mohingerty1a@cornell.edu", Sexo = 'F', FechaNacimiento = new DateTime(1984, 10, 17), CUIL = "91485397400", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 48, Nombre = "Jody", Apellido = "Bowstead", EMail = "jbowstead1b@imageshack.us", Sexo = 'F', FechaNacimiento = new DateTime(1987, 12, 5), CUIL = "01899676333", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 49, Nombre = "Eada", Apellido = "Lindermann", EMail = "elindermann1c@purevolume.com", Sexo = 'F', FechaNacimiento = new DateTime(1977, 11, 16), CUIL = "41898973455", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 50, Nombre = "Dreddy", Apellido = "Bernardot", EMail = "dbernardot1d@pcworld.com", Sexo = 'F', FechaNacimiento = new DateTime(1976, 6, 11), CUIL = "94551973166", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 51, Nombre = "Bay", Apellido = "Wansbury", EMail = "bwansbury1e@dell.com", Sexo = 'M', FechaNacimiento = new DateTime(1976, 6, 20), CUIL = "32991760488", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 52, Nombre = "Roscoe", Apellido = "Grima", EMail = "rgrima1f@nasa.gov", Sexo = 'M', FechaNacimiento = new DateTime(1990, 11, 16), CUIL = "42124791922", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 53, Nombre = "Buck", Apellido = "Baldam", EMail = "bbaldam1g@businessinsider.com", Sexo = 'M', FechaNacimiento = new DateTime(1986, 9, 25), CUIL = "39231261233", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 54, Nombre = "Michail", Apellido = "Perrat", EMail = "mperrat1h@networkadvertising.org", Sexo = 'M', FechaNacimiento = new DateTime(1973, 1, 21), CUIL = "92629921499", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 55, Nombre = "Hinda", Apellido = "Joscelin", EMail = "hjoscelin1i@storify.com", Sexo = 'F', FechaNacimiento = new DateTime(1982, 4, 30), CUIL = "97068457988", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 56, Nombre = "Jimmie", Apellido = "Drover", EMail = "jdrover1j@java.com", Sexo = 'M', FechaNacimiento = new DateTime(1986, 1, 6), CUIL = "06752735522", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 57, Nombre = "Arvy", Apellido = "Bolam", EMail = "abolam1k@live.com", Sexo = 'M', FechaNacimiento = new DateTime(1987, 10, 25), CUIL = "86460220722", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 58, Nombre = "Rosene", Apellido = "Truelove", EMail = "rtruelove1l@blinklist.com", Sexo = 'F', FechaNacimiento = new DateTime(1976, 11, 12), CUIL = "46646315888", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 59, Nombre = "Bernette", Apellido = "Kitney", EMail = "bkitney1m@hatena.ne.jp", Sexo = 'F', FechaNacimiento = new DateTime(1988, 4, 8), CUIL = "70230410877", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 60, Nombre = "Prescott", Apellido = "Loines", EMail = "ploines1n@amazon.co.uk", Sexo = 'M', FechaNacimiento = new DateTime(1989, 7, 10), CUIL = "25050962955", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 61, Nombre = "Karoly", Apellido = "Tisun", EMail = "ktisun1o@bizjournals.com", Sexo = 'M', FechaNacimiento = new DateTime(1985, 4, 3), CUIL = "48632775122", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 62, Nombre = "Liesa", Apellido = "O'Giany", EMail = "logiany1p@liveinternet.ru", Sexo = 'F', FechaNacimiento = new DateTime(1988, 9, 25), CUIL = "55639967944", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 63, Nombre = "Jeni", Apellido = "Ossipenko", EMail = "jossipenko1q@taobao.com", Sexo = 'F', FechaNacimiento = new DateTime(1978, 3, 7), CUIL = "34758169466", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 64, Nombre = "Merridie", Apellido = "Cardenosa", EMail = "mcardenosa1r@alibaba.com", Sexo = 'F', FechaNacimiento = new DateTime(1989, 10, 4), CUIL = "31956279811", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 65, Nombre = "Kare", Apellido = "Teodoro", EMail = "kteodoro1s@umn.edu", Sexo = 'F', FechaNacimiento = new DateTime(1988, 12, 30), CUIL = "64149464000", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 66, Nombre = "Marga", Apellido = "Chapiro", EMail = "mchapiro1t@seattletimes.com", Sexo = 'F', FechaNacimiento = new DateTime(1976, 10, 10), CUIL = "99449398899", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 67, Nombre = "Lombard", Apellido = "Brownlie", EMail = "lbrownlie1u@japanpost.jp", Sexo = 'M', FechaNacimiento = new DateTime(1974, 1, 7), CUIL = "98971291544", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 68, Nombre = "Gannon", Apellido = "Radbourne", EMail = "gradbourne1v@parallels.com", Sexo = 'M', FechaNacimiento = new DateTime(1977, 4, 18), CUIL = "09412479966", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 69, Nombre = "Stavros", Apellido = "Worsalls", EMail = "sworsalls1w@ask.com", Sexo = 'M', FechaNacimiento = new DateTime(1976, 2, 3), CUIL = "53419835722", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 70, Nombre = "Maisie", Apellido = "Pischoff", EMail = "mpischoff1x@g.co", Sexo = 'F', FechaNacimiento = new DateTime(1984, 7, 31), CUIL = "61007841577", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 71, Nombre = "Jesse", Apellido = "Probets", EMail = "jprobets1y@earthlink.net", Sexo = 'F', FechaNacimiento = new DateTime(1989, 4, 14), CUIL = "54163091800", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 72, Nombre = "Morissa", Apellido = "Garric", EMail = "mgarric1z@ow.ly", Sexo = 'F', FechaNacimiento = new DateTime(1977, 10, 10), CUIL = "03793653088", Categoria = new Categoria { CodCategoria = 5 } });
			dbContext.Socios.Add(new Socio { CodSocio = 73, Nombre = "Page", Apellido = "Wickenden", EMail = "pwickenden20@hugedomains.com", Sexo = 'M', FechaNacimiento = new DateTime(1974, 3, 21), CUIL = "33939298522", Categoria = new Categoria { CodCategoria = 5 } });
			dbContext.Socios.Add(new Socio { CodSocio = 74, Nombre = "Filmore", Apellido = "Yansons", EMail = "fyansons21@clickbank.net", Sexo = 'M', FechaNacimiento = new DateTime(1975, 9, 12), CUIL = "49542889755", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 75, Nombre = "Pepillo", Apellido = "Gillino", EMail = "pgillino22@chron.com", Sexo = 'M', FechaNacimiento = new DateTime(1980, 2, 2), CUIL = "35943517855", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 76, Nombre = "Nola", Apellido = "Stollsteimer", EMail = "nstollsteimer23@columbia.edu", Sexo = 'F', FechaNacimiento = new DateTime(1987, 7, 5), CUIL = "62976748688", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 77, Nombre = "Margarita", Apellido = "Fordy", EMail = "mfordy24@nbcnews.com", Sexo = 'F', FechaNacimiento = new DateTime(1979, 9, 29), CUIL = "40342121011", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 78, Nombre = "Lorraine", Apellido = "Abberley", EMail = "labberley25@clickbank.net", Sexo = 'F', FechaNacimiento = new DateTime(1975, 12, 19), CUIL = "56457935955", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 79, Nombre = "Bronson", Apellido = "Lockitt", EMail = "blockitt26@surveymonkey.com", Sexo = 'M', FechaNacimiento = new DateTime(1982, 2, 20), CUIL = "64372761777", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 80, Nombre = "Redd", Apellido = "Stileman", EMail = "rstileman27@webmd.com", Sexo = 'M', FechaNacimiento = new DateTime(1970, 8, 17), CUIL = "52833092233", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 81, Nombre = "Hadrian", Apellido = "Bodycombe", EMail = "hbodycombe28@who.int", Sexo = 'M', FechaNacimiento = new DateTime(1976, 1, 14), CUIL = "65552756188", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 82, Nombre = "Willey", Apellido = "Rase", EMail = "wrase29@telegraph.co.uk", Sexo = 'M', FechaNacimiento = new DateTime(1986, 4, 5), CUIL = "03854872588", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 83, Nombre = "Bing", Apellido = "McKerrow", EMail = "bmckerrow2a@dailymotion.com", Sexo = 'M', FechaNacimiento = new DateTime(1971, 6, 10), CUIL = "37146725322", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 84, Nombre = "Marjie", Apellido = "Krystek", EMail = "mkrystek2b@bloglovin.com", Sexo = 'F', FechaNacimiento = new DateTime(1974, 6, 29), CUIL = "94358030911", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 85, Nombre = "Stavro", Apellido = "Gaitley", EMail = "sgaitley2c@behance.net", Sexo = 'M', FechaNacimiento = new DateTime(1990, 5, 2), CUIL = "54805649277", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 86, Nombre = "Maris", Apellido = "Tolemache", EMail = "mtolemache2d@blogtalkradio.com", Sexo = 'F', FechaNacimiento = new DateTime(1975, 12, 15), CUIL = "84396397322", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 87, Nombre = "Martie", Apellido = "Springell", EMail = "mspringell2e@senate.gov", Sexo = 'M', FechaNacimiento = new DateTime(1979, 7, 10), CUIL = "61551816599", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 88, Nombre = "Deonne", Apellido = "Maggs", EMail = "dmaggs2f@baidu.com", Sexo = 'F', FechaNacimiento = new DateTime(1978, 12, 18), CUIL = "07965463200", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 89, Nombre = "Doreen", Apellido = "Briamo", EMail = "dbriamo2g@w3.org", Sexo = 'F', FechaNacimiento = new DateTime(1974, 8, 3), CUIL = "83188018144", Categoria = new Categoria { CodCategoria = 5 } });
			dbContext.Socios.Add(new Socio { CodSocio = 90, Nombre = "Rosabel", Apellido = "McCarrick", EMail = "rmccarrick2h@gizmodo.com", Sexo = 'F', FechaNacimiento = new DateTime(1973, 3, 10), CUIL = "62288452688", Categoria = new Categoria { CodCategoria = 1 } });
			dbContext.Socios.Add(new Socio { CodSocio = 91, Nombre = "Hildagarde", Apellido = "Di Batista", EMail = "hdibatista2i@google.pl", Sexo = 'F', FechaNacimiento = new DateTime(1990, 6, 21), CUIL = "00864693988", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 92, Nombre = "Normy", Apellido = "MacCracken", EMail = "nmaccracken2j@globo.com", Sexo = 'M', FechaNacimiento = new DateTime(1978, 7, 27), CUIL = "61810231511", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 93, Nombre = "Barnie", Apellido = "Gillett", EMail = "bgillett2k@wikipedia.org", Sexo = 'M', FechaNacimiento = new DateTime(1982, 8, 13), CUIL = "79083143333", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 94, Nombre = "Vernor", Apellido = "Calcraft", EMail = "vcalcraft2l@acquirethisname.com", Sexo = 'M', FechaNacimiento = new DateTime(1971, 9, 10), CUIL = "58500355244", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 95, Nombre = "Yvonne", Apellido = "Trewhella", EMail = "ytrewhella2m@symantec.com", Sexo = 'F', FechaNacimiento = new DateTime(1982, 2, 9), CUIL = "05765068699", Categoria = new Categoria { CodCategoria = 4 } });
			dbContext.Socios.Add(new Socio { CodSocio = 96, Nombre = "Ximenez", Apellido = "Lordon", EMail = "xlordon2n@independent.co.uk", Sexo = 'M', FechaNacimiento = new DateTime(1970, 3, 15), CUIL = "44454771177", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 97, Nombre = "Rafaellle", Apellido = "Pilch", EMail = "rpilch2o@usgs.gov", Sexo = 'M', FechaNacimiento = new DateTime(1990, 6, 29), CUIL = "27225862077", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 98, Nombre = "Agnesse", Apellido = "Chatell", EMail = "achatell2p@so-net.ne.jp", Sexo = 'F', FechaNacimiento = new DateTime(1975, 2, 16), CUIL = "84434254588", Categoria = new Categoria { CodCategoria = 2 } });
			dbContext.Socios.Add(new Socio { CodSocio = 99, Nombre = "Isabeau", Apellido = "Bartosik", EMail = "ibartosik2q@github.com", Sexo = 'F', FechaNacimiento = new DateTime(1989, 12, 26), CUIL = "60958373244", Categoria = new Categoria { CodCategoria = 3 } });
			dbContext.Socios.Add(new Socio { CodSocio = 100, Nombre = "Arliene", Apellido = "Swoffer", EMail = "aswoffer2r@pbs.org", Sexo = 'F', FechaNacimiento = new DateTime(1987, 8, 25), CUIL = "21359662155", Categoria = new Categoria { CodCategoria = 1 } });
			#endregion

			#region Alta de practica
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 18 }, Socio = new Socio { CodSocio = 1 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 20 }, Socio = new Socio { CodSocio = 1 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 29 }, Socio = new Socio { CodSocio = 2 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 3 }, Socio = new Socio { CodSocio = 3 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 15 }, Socio = new Socio { CodSocio = 3 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 8 }, Socio = new Socio { CodSocio = 5 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 18 }, Socio = new Socio { CodSocio = 5 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 3 }, Socio = new Socio { CodSocio = 9 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 4 }, Socio = new Socio { CodSocio = 9 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 11 }, Socio = new Socio { CodSocio = 9 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 15 }, Socio = new Socio { CodSocio = 9 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 20 }, Socio = new Socio { CodSocio = 9 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 6 }, Socio = new Socio { CodSocio = 10 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 9 }, Socio = new Socio { CodSocio = 10 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 29 }, Socio = new Socio { CodSocio = 10 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 37 }, Socio = new Socio { CodSocio = 10 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 4 }, Socio = new Socio { CodSocio = 11 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 17 }, Socio = new Socio { CodSocio = 11 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 8 }, Socio = new Socio { CodSocio = 12 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 25 }, Socio = new Socio { CodSocio = 12 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 17 }, Socio = new Socio { CodSocio = 13 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 22 }, Socio = new Socio { CodSocio = 13 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 23 }, Socio = new Socio { CodSocio = 14 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 31 }, Socio = new Socio { CodSocio = 15 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 17 }, Socio = new Socio { CodSocio = 16 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 18 }, Socio = new Socio { CodSocio = 16 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 26 }, Socio = new Socio { CodSocio = 16 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 16 }, Socio = new Socio { CodSocio = 17 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 31 }, Socio = new Socio { CodSocio = 17 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 37 }, Socio = new Socio { CodSocio = 17 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 18 }, Socio = new Socio { CodSocio = 18 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 31 }, Socio = new Socio { CodSocio = 18 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 31 }, Socio = new Socio { CodSocio = 19 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 15 }, Socio = new Socio { CodSocio = 21 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 28 }, Socio = new Socio { CodSocio = 21 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 22 }, Socio = new Socio { CodSocio = 22 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 39 }, Socio = new Socio { CodSocio = 22 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 10 }, Socio = new Socio { CodSocio = 23 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 16 }, Socio = new Socio { CodSocio = 23 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 17 }, Socio = new Socio { CodSocio = 24 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 30 }, Socio = new Socio { CodSocio = 24 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 20 }, Socio = new Socio { CodSocio = 25 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 24 }, Socio = new Socio { CodSocio = 25 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 8 }, Socio = new Socio { CodSocio = 26 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 18 }, Socio = new Socio { CodSocio = 26 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 27 }, Socio = new Socio { CodSocio = 26 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 31 }, Socio = new Socio { CodSocio = 27 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 13 }, Socio = new Socio { CodSocio = 28 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 39 }, Socio = new Socio { CodSocio = 30 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 3 }, Socio = new Socio { CodSocio = 31 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 18 }, Socio = new Socio { CodSocio = 31 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 4 }, Socio = new Socio { CodSocio = 32 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 19 }, Socio = new Socio { CodSocio = 32 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 30 }, Socio = new Socio { CodSocio = 32 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 1 }, Socio = new Socio { CodSocio = 33 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 6 }, Socio = new Socio { CodSocio = 34 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 28 }, Socio = new Socio { CodSocio = 34 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 27 }, Socio = new Socio { CodSocio = 35 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 38 }, Socio = new Socio { CodSocio = 35 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 12 }, Socio = new Socio { CodSocio = 37 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 26 }, Socio = new Socio { CodSocio = 37 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 38 }, Socio = new Socio { CodSocio = 37 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 12 }, Socio = new Socio { CodSocio = 38 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 39 }, Socio = new Socio { CodSocio = 40 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 29 }, Socio = new Socio { CodSocio = 41 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 39 }, Socio = new Socio { CodSocio = 42 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 39 }, Socio = new Socio { CodSocio = 43 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 35 }, Socio = new Socio { CodSocio = 44 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 24 }, Socio = new Socio { CodSocio = 45 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 25 }, Socio = new Socio { CodSocio = 45 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 3 }, Socio = new Socio { CodSocio = 46 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 18 }, Socio = new Socio { CodSocio = 46 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 1 }, Socio = new Socio { CodSocio = 47 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 6 }, Socio = new Socio { CodSocio = 47 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 8 }, Socio = new Socio { CodSocio = 47 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 23 }, Socio = new Socio { CodSocio = 47 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 28 }, Socio = new Socio { CodSocio = 47 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 7 }, Socio = new Socio { CodSocio = 48 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 13 }, Socio = new Socio { CodSocio = 48 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 5 }, Socio = new Socio { CodSocio = 49 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 15 }, Socio = new Socio { CodSocio = 50 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 39 }, Socio = new Socio { CodSocio = 50 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 6 }, Socio = new Socio { CodSocio = 52 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 8 }, Socio = new Socio { CodSocio = 53 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 18 }, Socio = new Socio { CodSocio = 55 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 21 }, Socio = new Socio { CodSocio = 56 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 30 }, Socio = new Socio { CodSocio = 57 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 2 }, Socio = new Socio { CodSocio = 58 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 24 }, Socio = new Socio { CodSocio = 58 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 10 }, Socio = new Socio { CodSocio = 60 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 20 }, Socio = new Socio { CodSocio = 60 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 7 }, Socio = new Socio { CodSocio = 61 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 14 }, Socio = new Socio { CodSocio = 62 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 3 }, Socio = new Socio { CodSocio = 64 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 20 }, Socio = new Socio { CodSocio = 64 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 20 }, Socio = new Socio { CodSocio = 66 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 24 }, Socio = new Socio { CodSocio = 66 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 37 }, Socio = new Socio { CodSocio = 66 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 21 }, Socio = new Socio { CodSocio = 67 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 38 }, Socio = new Socio { CodSocio = 67 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 10 }, Socio = new Socio { CodSocio = 70 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 28 }, Socio = new Socio { CodSocio = 71 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 21 }, Socio = new Socio { CodSocio = 72 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 13 }, Socio = new Socio { CodSocio = 73 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 25 }, Socio = new Socio { CodSocio = 73 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 37 }, Socio = new Socio { CodSocio = 75 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 18 }, Socio = new Socio { CodSocio = 76 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 2 }, Socio = new Socio { CodSocio = 77 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 26 }, Socio = new Socio { CodSocio = 77 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 19 }, Socio = new Socio { CodSocio = 81 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 20 }, Socio = new Socio { CodSocio = 81 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 5 }, Socio = new Socio { CodSocio = 82 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 14 }, Socio = new Socio { CodSocio = 83 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 22 }, Socio = new Socio { CodSocio = 83 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 31 }, Socio = new Socio { CodSocio = 83 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 18 }, Socio = new Socio { CodSocio = 84 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 19 }, Socio = new Socio { CodSocio = 85 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 7 }, Socio = new Socio { CodSocio = 86 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 8 }, Socio = new Socio { CodSocio = 87 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 32 }, Socio = new Socio { CodSocio = 90 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 1 }, Socio = new Socio { CodSocio = 91 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 7 }, Socio = new Socio { CodSocio = 91 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 29 }, Socio = new Socio { CodSocio = 91 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 37 }, Socio = new Socio { CodSocio = 91 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 11 }, Socio = new Socio { CodSocio = 93 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 40 }, Socio = new Socio { CodSocio = 93 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 27 }, Socio = new Socio { CodSocio = 94 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 3 }, Socio = new Socio { CodSocio = 96 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 39 }, Socio = new Socio { CodSocio = 96 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 39 }, Socio = new Socio { CodSocio = 98 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 10 }, Socio = new Socio { CodSocio = 99 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 14 }, Socio = new Socio { CodSocio = 99 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 19 }, Socio = new Socio { CodSocio = 99 } });
			dbContext.Practican.Add(new Practica { Deporte = new Deporte { CodDeporte = 33 }, Socio = new Socio { CodSocio = 100 } });
			#endregion

			dbContext.SaveChanges();
		}
	}
}
