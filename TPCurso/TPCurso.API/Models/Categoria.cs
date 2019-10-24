using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TPCurso.API.Models
{
	public class Categoria
	{
		public Categoria()
		{

		}

		public int CodCategoria { get; set; }

		public string DesCategoria { get; set; }

		public virtual ICollection<Socio> Socios { get; set; }
	}

	public class CategoriaConfiguration : IEntityTypeConfiguration<Categoria>
	{
		public void Configure(EntityTypeBuilder<Categoria> builder)
		{
			// Tabla
			builder.ToTable("Categoria");

			// Clave
			builder.HasKey(p => p.CodCategoria);

			// Columnas
			builder.Property(p => p.DesCategoria);
			builder.HasMany<Socio>(p => p.Socios).WithOne(s => s.Categoria);//.HasForeignKey(e => e.CodCategoria);
		}
	}
}
