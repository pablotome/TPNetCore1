using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using TPCurso.API.Models;
using Microsoft.EntityFrameworkCore;

namespace TPCurso.API.Controllers
{
	/// <summary>
	/// The process for all controller's actions is:
	///   1. Log the invocation for method.
	///   2. Create the instance for response according to action(Paged, list or single).
	///   3. Perform access to database through DbContext instance.
	///   4. If invocation for repository fails, set DidError property as true and set ErrorMessage property with: There was an internal error, please contact to technical support., because it isn't recommended to expose error details in response, it's better to save all exception details in log file.
	///   5. Return result as Http response.
	/// </summary>
	[ApiController]
	[Route("api/v1/[controller]")]
	public class SociosController : ControllerBase
	{

		protected readonly ILogger _Logger;
		protected readonly ClubDbContext _DbContext;

		public SociosController(ILogger<SociosController> logger, ClubDbContext dbContext)
		{
			_Logger = logger;
			_DbContext = dbContext;
		}

		// GET
		// api/v1/Club/Socios

		/// <summary>
		/// Devuelve los socios según los filtros indicados
		/// </summary>
		/// <param name="pageSize">Page size</param>
		/// <param name="pageNumber">Page number</param>
		/// <param name="lastEditedBy">Last edit by (user id)</param>
		/// <param name="colorID">Color id</param>
		/// <param name="outerPackageID">Outer package id</param>
		/// <param name="supplierID">Supplier id</param>
		/// <param name="unitPackageID">Unit package id</param>
		/// <returns>A response with stock items list</returns>
		/// <response code="200">Returns the stock items list</response>
		/// <response code="500">If there was an internal server error</response>
		[HttpGet("Socios")]
		[ProducesResponseType(200)]
		[ProducesResponseType(500)]
		public async Task<IActionResult> GetSociosAsync(int pageSize = 10, int pageNumber = 1, string cuil = null)
		{
			_Logger?.LogDebug("Se invoca a ${nameof(GetSociosAsync)}");

			var response = new PagedResponse<Socio>();

			try
			{
				var query = _DbContext.GetSocios(cuil: cuil);

				// Set paging values
				response.PageSize = pageSize;
				response.PageNumber = pageNumber;

				// Get the total rows
				response.ItemsCount = await query.CountAsync();

				// Get the specific page from database
				response.Model = await query
					.Paging(pageSize, pageNumber)
					.Include(s => s.Categoria)
					.Include(s => s.Deportes)
					.ThenInclude(s => s.Deporte)
					.ToListAsync();

				var catego = ((Socio)((List<Socio>)response.Model)[0]).Categoria;

				response.Mensaje = "Página ${pageNumber} de ${response.PageCount}. Total de socios: {response.ItemsCount}.";

				_Logger?.LogInformation("Invocación de {nameof(GetSociosAsync)} resuelta exitosamente");
			}
			catch (Exception ex)
			{
				response.HuboError = true;
				response.MensajeError = $"Hubo un error al ejecutar la consulta {nameof(GetSociosAsync)}";

				_Logger?.LogCritical("Detalle técnico. Método: '{0}'. Excepcion: {1}", nameof(GetSociosAsync), ex);
			}

			return response.ToHttpResponse();
		}
	}
}