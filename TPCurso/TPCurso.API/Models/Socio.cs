using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace TPCurso.API.Models
{

	/// <summary>
	/// 
	/// </summary>
	public partial class Socio
	{
		public Socio()
		{
		}

		public int CodSocio { get; set; }

		public string Nombre { get; set; }

		public string Apellido { get; set; }

		public string EMail { get; set; }

		public char Sexo { get; set; }

		public DateTime FechaNacimiento { get; set; }

		public string CUIL { get; set; }

		public int CodCategoria { get; set; }
		public virtual Categoria Categoria { get; set; }

		public IList<Practica> Deportes { get; set; }
	}

	public class SocioConfiguration : IEntityTypeConfiguration<Socio>
	{
		public void Configure(EntityTypeBuilder<Socio> builder)
		{
			// Tabla
			builder.ToTable("Socio");

			// Clave
			builder.HasKey(p => p.CodSocio);

			// Columnas
			builder.Property(p => p.Nombre);
			builder.Property(p => p.Apellido);
			builder.Property(p => p.EMail);
			builder.Property(p => p.Sexo);
			builder.Property(p => p.FechaNacimiento);
			builder.Property(p => p.CUIL);
			builder.HasOne<Categoria>(p => p.Categoria).WithMany(c => c.Socios).HasForeignKey(s => s.CodCategoria);

			//builder.HasMany<Deporte>(p => p.Deportes).WithMany(c => c.Socios);//.HasForeignKey(s => s.CodCategoria);

			/*builder.Property(p => p.Nombre).HasColumnType("nvarchar(50)").IsRequired();
			builder.Property(p => p.Apellido).HasColumnType("nvarchar(50)").IsRequired();
			builder.Property(p => p.EMail).HasColumnType("nvarchar(100)").IsRequired();
			builder.Property(p => p.Sexo).HasColumnType("char").IsRequired();
			builder.Property(p => p.FechaNacimiento).HasColumnType("datetime").IsRequired();
			builder.Property(p => p.CUIL).HasColumnType("nvarchar(11)").IsRequired();
			builder.HasOne(p => p.Categoria);*/
		}
	}
}
