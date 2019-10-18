using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TPCurso.API.Controllers;
using TPCurso.API.Models;
using Xunit;

namespace TPCurso.API.UnitTest
{
	public class DBClubUnitTests
	{
		[Fact]
		public async Task TestGetSociosAsync()
		{
			// Arrange
			var dbContext = DBContextMocker.GetClubDbContext(nameof(TestGetSociosAsync));
			var controller = new SociosController(null, dbContext);

			// Act
			var response = await controller.GetSociosAsync() as ObjectResult;
			var value = response.Value as IPagedResponse<Socio>;

			dbContext.Dispose();

			// Assert
			Assert.False(value.HuboError);
		}
	}
}
