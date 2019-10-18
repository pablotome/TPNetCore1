using System.Collections.Generic;
using System.Net;
using Microsoft.AspNetCore.Mvc;

namespace TPCurso.API.Controllers
{
#pragma warning disable CS1591
	public interface IResponse
	{
		string Mensaje { get; set; }

		bool HuboError { get; set; }

		string MensajeError { get; set; }
	}


	/// <summary>
	/// ISingleResponse represents a response for a single entity.
	/// </summary>
	/// <typeparam name="TModel"></typeparam>
	public interface ISingleResponse<TModel> : IResponse
	{
		TModel Model { get; set; }
	}


	/// <summary>
	/// IListResponse represents a response with a list, for example all shipping to existing order without paging.
	/// </summary>
	/// <typeparam name="TModel"></typeparam>
	public interface IListResponse<TModel> : IResponse
	{
		IEnumerable<TModel> Model { get; set; }
	}


	/// <summary>
	/// IPagedResponse represents a response with pagination, for example all orders in a date range.
	/// </summary>
	/// <typeparam name="TModel"></typeparam>
	public interface IPagedResponse<TModel> : IListResponse<TModel>
	{
		int ItemsCount { get; set; }

		double PageCount { get; }
	}

	public class Response : IResponse
	{
		public string Mensaje { get; set; }

		public bool HuboError { get; set; }

		public string MensajeError { get; set; }
	}

	public class SingleResponse<TModel> : ISingleResponse<TModel>
	{
		public string Mensaje { get; set; }

		public bool HuboError { get; set; }

		public string MensajeError { get; set; }

		public TModel Model { get; set; }
	}

	public class ListResponse<TModel> : IListResponse<TModel>
	{
		public string Mensaje { get; set; }

		public bool HuboError { get; set; }

		public string MensajeError { get; set; }

		public IEnumerable<TModel> Model { get; set; }
	}

	public class PagedResponse<TModel> : IPagedResponse<TModel>
	{
		public string Mensaje { get; set; }

		public bool HuboError { get; set; }

		public string MensajeError { get; set; }

		public IEnumerable<TModel> Model { get; set; }

		public int PageSize { get; set; }

		public int PageNumber { get; set; }

		public int ItemsCount { get; set; }

		public double PageCount => ItemsCount < PageSize ? 1 : (int)(((double)ItemsCount / PageSize) + 1);
	}


	/// <summary>
	/// ResponseExtensions class contains extension methods to convert a response in a Http response, these methods return InternalServerError (500) status if an error occurs, OK (200) if it's OK and NotFound (404) if an entity does not exist in database or NoContent (204) for list responses without model.
	/// </summary>
	public static class ResponseExtensions
	{
		public static IActionResult ToHttpResponse(this IResponse response)
		{
			var status = response.HuboError ? HttpStatusCode.InternalServerError : HttpStatusCode.OK;

			return new ObjectResult(response)
			{
				StatusCode = (int)status
			};
		}

		public static IActionResult ToHttpResponse<TModel>(this ISingleResponse<TModel> response)
		{
			var status = HttpStatusCode.OK;

			if (response.HuboError)
				status = HttpStatusCode.InternalServerError;
			else if (response.Model == null)
				status = HttpStatusCode.NotFound;

			return new ObjectResult(response)
			{
				StatusCode = (int)status
			};
		}

		public static IActionResult ToHttpResponse<TModel>(this IListResponse<TModel> response)
		{
			var status = HttpStatusCode.OK;

			if (response.HuboError)
				status = HttpStatusCode.InternalServerError;
			else if (response.Model == null)
				status = HttpStatusCode.NoContent;

			return new ObjectResult(response)
			{
				StatusCode = (int)status
			};
		}
	}
#pragma warning restore CS1591
}