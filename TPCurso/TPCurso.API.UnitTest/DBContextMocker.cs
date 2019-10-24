using Microsoft.EntityFrameworkCore;
using TPCurso.API.Models;

namespace TPCurso.API.UnitTest
{
	public static class DBContextMocker
	{
		public static ClubDbContext GetClubDbContext(string dbName)
		{
			// Create options for DbContext instance
			var options = new DbContextOptionsBuilder<ClubDbContext>()
				.UseInMemoryDatabase(databaseName: dbName)
				.Options;

			// Create instance of DbContext
			var dbContext = new ClubDbContext(options);

			// Add entities in memory
			dbContext.Seed();

			return dbContext;
		}
	}
}
