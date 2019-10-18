using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace TPCurso.API.Models
{
	public static class ClubDbContextExtensions
	{
		public static IQueryable<Socio> GetSocios(this ClubDbContext dbContext, int pageSize = 10,
			int pageNumber = 1, string cuil = null)
		{
			// Get query from DbSet
			var query = dbContext.Socios.AsQueryable();

			if (cuil != null)
				query = query.Where(item => item.CUIL == cuil);

			return query;
		}

		public static IQueryable<Categoria> GetCategorias(this ClubDbContext dbContext)
			=> dbContext.Categorias.AsQueryable();

		public static async Task<Socio> GetSociosAsync(this ClubDbContext dbContext, Socio entity)
			=> await dbContext.Socios.FirstOrDefaultAsync(item => item.CodSocio == entity.CodSocio);

		public static async Task<Socio> GetSocioByCUILAsync(this ClubDbContext dbContext, Socio entity)
			=> await dbContext.Socios.FirstOrDefaultAsync(item => item.CUIL == entity.CUIL);
	}



	/// <summary>
	/// IQueryableExtensions contains extension methods for IQueryable, to add paging feature.
	/// </summary>
	public static class IQueryableExtensions
	{
		public static IQueryable<TModel> Paging<TModel>(this IQueryable<TModel> query, int pageSize = 0, int pageNumber = 0) where TModel : class
			=> pageSize > 0 && pageNumber > 0 ? query.Skip((pageNumber - 1) * pageSize).Take(pageSize) : query;
	}
}
