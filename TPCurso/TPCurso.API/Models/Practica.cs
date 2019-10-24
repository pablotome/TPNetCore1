using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TPCurso.API.Models
{
	public class Practica
	{
		public Practica()
		{
		}

		public int CodPractica { get; set; }

		public int CodSocio { get; set; }
		public Socio Socio { get; set; }

		public int CodDeporte { get; set; }
		public Deporte Deporte { get; set; }
	}

	public class PracticaConfiguration : IEntityTypeConfiguration<Practica>
	{
		public void Configure(EntityTypeBuilder<Practica> builder)
		{
			// Tabla
			builder.ToTable("Practica");

			// Clave
			builder.HasKey(p => p.CodPractica);

			// Columnas
			/*builder.HasOne<Socio>(p => p.Socio).WithMany(s => s.Practica);//.HasForeignKey(e => e.CodSocio);
			builder.HasOne<Deporte>(p => p.Deporte).WithMany(s => s.Practican);//.HasForeignKey(e => e.CodDeporte);*/
			builder
				.HasOne(p => p.Socio)
				.WithMany(b => b.Deportes)
				.HasForeignKey(bc => bc.CodSocio);

			builder
				.HasOne(bc => bc.Deporte)
				.WithMany(c => c.Socios)
				.HasForeignKey(bc => bc.CodDeporte);
		}
	}
}
