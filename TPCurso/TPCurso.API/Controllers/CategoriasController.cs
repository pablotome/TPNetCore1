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
	public class CategoriasController : ControllerBase
	{

		protected readonly ILogger _Logger;
		protected readonly ClubDbContext _DbContext;

		public CategoriasController(ILogger<CategoriasController> logger, ClubDbContext dbContext)
		{
			_Logger = logger;
			_DbContext = dbContext;
		}

		// GET
		// api/v1/Club/Categorias

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
		[HttpGet("Categorias")]
		[ProducesResponseType(200)]
		[ProducesResponseType(500)]
		public async Task<IActionResult> GetCategoriasAsync(string descripcion = null)
		{
			_Logger?.LogDebug("'{0}' has been invoked", nameof(GetCategoriasAsync));

			var response = new PagedResponse<Categoria>();

			try
			{
				// Get the "proposed" query from repository
				var query = _DbContext.GetCategorias();

				// Set paging values
				//response.PageSize = pageSize;
				//response.PageNumber = pageNumber;

				// Get the total rows
				response.ItemsCount = await query.CountAsync();

				// Get the specific page from database
				response.Model = await query.Include(c => c.Socios).ToListAsync();

				response.Mensaje = string.Format("Page {0} of {1}, Total of products: {2}.", 0, response.PageCount, response.ItemsCount);

				_Logger?.LogInformation("The stock items have been retrieved successfully.");
			}
			catch (Exception ex)
			{
				response.HuboError = true;
				response.MensajeError = "There was an internal error, please contact to technical support.";

				_Logger?.LogCritical("There was an error on '{0}' invocation: {1}", nameof(GetCategoriasAsync), ex);
			}

			return response.ToHttpResponse();
		}
	}
}