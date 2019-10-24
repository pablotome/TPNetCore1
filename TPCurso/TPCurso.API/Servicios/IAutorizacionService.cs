using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TPCurso.API.Models;

namespace TPCurso.API.Servicios
{
	public interface IAutorizacionService
	{
		Task<string> Login(LoginDTO loginDTO);
	}
}
