using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TPCurso.API.Models
{
	public class ClubDbContext : DbContext
	{
		public ClubDbContext(DbContextOptions<ClubDbContext> options)
			: base(options)
		{

		}

		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			// Apply configurations for entity

			modelBuilder
				.ApplyConfiguration(new SocioConfiguration())
				.ApplyConfiguration(new DeporteConfiguration())
				.ApplyConfiguration(new CategoriaConfiguration())
				.ApplyConfiguration(new PracticaConfiguration());

			


			base.OnModelCreating(modelBuilder);
		}

		protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
		{
			optionsBuilder.UseLazyLoadingProxies(false);
		}

		public DbSet<Socio> Socios { get; set; }
		public DbSet<Deporte> Deportes { get; set; }
		public DbSet<Practica> Practican { get; set; }
		public DbSet<Categoria> Categorias { get; set; }
	}
}
