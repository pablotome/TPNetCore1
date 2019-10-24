using System;
using System.ComponentModel.DataAnnotations;

namespace TPCurso.API.Controllers
{
#pragma warning disable CS1591

	/// <summary>
	/// PostStockItemsRequest represents the model to create a new stock item, contains all required properties to save in database.
	/// </summary>
	public class PostSociosRequest
	{
		[Key]
		public int? StockItemID { get; set; }

		[Required]
		[StringLength(200)]
		public string StockItemName { get; set; }

		[Required]
		public int? SupplierID { get; set; }

		public int? ColorID { get; set; }

		[Required]
		public int? UnitPackageID { get; set; }

		[Required]
		public int? OuterPackageID { get; set; }

		[StringLength(100)]
		public string Brand { get; set; }

		[StringLength(40)]
		public string Size { get; set; }

		[Required]
		public int? LeadTimeDays { get; set; }

		[Required]
		public int? QuantityPerOuter { get; set; }

		[Required]
		public bool? IsChillerStock { get; set; }

		[StringLength(100)]
		public string Barcode { get; set; }

		[Required]
		public decimal? TaxRate { get; set; }

		[Required]
		public decimal? UnitPrice { get; set; }

		public decimal? RecommendedRetailPrice { get; set; }

		[Required]
		public decimal? TypicalWeightPerUnit { get; set; }

		public string MarketingComments { get; set; }

		public string InternalComments { get; set; }

		public string CustomFields { get; set; }

		public string Tags { get; set; }

		[Required]
		public string SearchDetails { get; set; }

		[Required]
		public int? LastEditedBy { get; set; }

		public DateTime? ValidFrom { get; set; }

		public DateTime? ValidTo { get; set; }
	}


	/// <summary>
	/// PutStockItemsRequest represents the model to update an existing stock item, in this case contains only 4 properties: StockItemName, SupplierID, ColorID and UnitPrice. This class doesn't contain StockItemID property because id is in route for controller's action.
	/// The models for requests do not require to contain all properties like entities, because we don't need to expose full definition in a request or response, it's a good practice to limit data using models with few properties.
	/// </summary>
	public class PutStockItemsRequest
	{
		[Required]
		[StringLength(200)]
		public string StockItemName { get; set; }

		[Required]
		public int? SupplierID { get; set; }

		public int? ColorID { get; set; }

		[Required]
		public decimal? UnitPrice { get; set; }
	}



	/// <summary>
	/// Extensions class contains an extension method for PostStockItemsRequest, to return an instance of StockItem class from request model.
	/// </summary>
	public static class Extensions
	{
		public static Socio ToEntity(this PostStockItemsRequest request)
			=> new StockItem
			{
				StockItemID = request.StockItemID,
				StockItemName = request.StockItemName,
				SupplierID = request.SupplierID,
				ColorID = request.ColorID,
				UnitPackageID = request.UnitPackageID,
				OuterPackageID = request.OuterPackageID,
				Brand = request.Brand,
				Size = request.Size,
				LeadTimeDays = request.LeadTimeDays,
				QuantityPerOuter = request.QuantityPerOuter,
				IsChillerStock = request.IsChillerStock,
				Barcode = request.Barcode,
				TaxRate = request.TaxRate,
				UnitPrice = request.UnitPrice,
				RecommendedRetailPrice = request.RecommendedRetailPrice,
				TypicalWeightPerUnit = request.TypicalWeightPerUnit,
				MarketingComments = request.MarketingComments,
				InternalComments = request.InternalComments,
				CustomFields = request.CustomFields,
				Tags = request.Tags,
				SearchDetails = request.SearchDetails,
				LastEditedBy = request.LastEditedBy,
				ValidFrom = request.ValidFrom,
				ValidTo = request.ValidTo
			};
	}
#pragma warning restore CS1591
}