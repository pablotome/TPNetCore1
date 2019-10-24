using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TPCurso.API.Models
{
	public class LoginDTO
	{
		[Required]
		[StringLength(40)]
		public string Mail { get; set; }
		[Required]
		[StringLength(20, MinimumLength = 8)]
		public string Password { get; set; }
	}
}
