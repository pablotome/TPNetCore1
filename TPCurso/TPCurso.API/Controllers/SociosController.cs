using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using TPCurso.API.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;

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
		/// <param name="paginaTamanio"></param>
		/// <param name="paginaNumero"></param>
		/// <param name="cuil"></param>
		/// <returns>A response with stock items list</returns>
		/// <response code="200">Returns the stock items list</response>
		/// <response code="500">If there was an internal server error</response>
		[HttpGet("Socios")]
		[ProducesResponseType(200)]
		[ProducesResponseType(500)]
		[Authorize(Roles = nameof(Rol.Administrador))]
		public async Task<IActionResult> GetSociosAsync(int paginaTamanio = 10, int paginaNumero = 1, string cuil = null)
		{
			_Logger?.LogDebug("Se invoca a ${nameof(GetSociosAsync)}");

			var response = new Respuesta<Socio>();

			try
			{
				var query = _DbContext.GetSocios(cuil: cuil);

				// Set paging values
				response.PaginaTamanio = paginaTamanio;
				response.PaginaNumero = paginaNumero;

				// Get the total rows
				response.CantidadDatos = await query.CountAsync();

				// Get the specific page from database
				response.Datos = await query
					.Paging(paginaTamanio, paginaNumero)
					.Include(s => s.Categoria)
					.Include(s => s.Deportes)
					.ThenInclude(s => s.Deporte)
					.ToListAsync();

				var catego = ((Socio)((List<Socio>)response.Datos)[0]).Categoria;

				response.Mensaje = $"Página {paginaNumero} de {response.CantidadPaginas}. Total de socios: {response.CantidadDatos}.";

				_Logger?.LogInformation($"Invocación de {nameof(GetSociosAsync)} resuelta exitosamente");
			}
			catch (Exception ex)
			{
				response.HuboError = true;
				response.MensajeError = $"Hubo un error al ejecutar la consulta {nameof(GetSociosAsync)}";

				_Logger?.LogCritical("Detalle técnico. Método: '{0}'. Excepcion: {1}", nameof(GetSociosAsync), ex);
			}

			return response.ToHttpResponse<Socio>();
		}
	}
}