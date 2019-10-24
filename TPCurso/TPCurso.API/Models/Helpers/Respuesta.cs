using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using TPCurso.API.Controllers;

namespace TPCurso.API.Controllers
{
	public interface IRespuesta<TModelo>
	{
		string Mensaje { get; set; }

		bool HuboError { get; set; }

		string MensajeError { get; set; }

		IEnumerable<TModelo> Datos { get; set; }

		int CantidadDatos { get; set; }

		double CantidadPaginas { get; }
	}

	public class Respuesta<TModelo> : IRespuesta<TModelo>
	{
		public string Mensaje { get; set; }

		public bool HuboError { get; set; }

		public string MensajeError { get; set; }

		public IEnumerable<TModelo> Datos { get; set; }

		public int PaginaTamanio { get; set; }

		public int PaginaNumero { get; set; }

		public int CantidadDatos { get; set; }

		public double CantidadPaginas => CantidadDatos < PaginaTamanio ? 1 : (int)(((double)CantidadDatos / PaginaTamanio) + 1);
	}

	/// <summary>
	/// ResponseExtensions class contains extension methods to convert a response in a Http response, these methods return 
	/// InternalServerError (500) status if an error occurs, 
	/// OK (200) if it's OK and 
	/// NotFound (404) if an entity does not exist in database or NoContent (204) for list responses without model.
	/// </summary>
	public static class RespuestaExtensions
	{
		public static IActionResult ToHttpResponse<TModelo>(this Respuesta<TModelo> response)
		{
			var status = HttpStatusCode.OK;

			if (response.HuboError)
				status = HttpStatusCode.InternalServerError;
			else if (response.Datos == null)
				status = HttpStatusCode.NoContent;

			return new ObjectResult(response)
			{
				StatusCode = (int)status
			};
		}
	}
}
