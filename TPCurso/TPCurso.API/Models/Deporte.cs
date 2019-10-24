using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TPCurso.API.Models
{
	public class Deporte
	{
		public Deporte()
		{

		}

		public int CodDeporte { get; set; }

		public string DesDeporte { get; set; }

		public ICollection<Practica> Socios { get; set; }
	}

	public class DeporteConfiguration : IEntityTypeConfiguration<Deporte>
	{
		public void Configure(EntityTypeBuilder<Deporte> builder)
		{
			// Tabla
			builder.ToTable("Deporte");

			// Clave
			builder.HasKey(p => p.CodDeporte);

			// Columnas
			builder.Property(p => p.DesDeporte);
		}
	}
}
