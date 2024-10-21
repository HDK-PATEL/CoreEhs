using CoreEhs.Interface;
using CoreEhs.Model;
using CoreEhs.Modell;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims; 

namespace CoreEhs.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class CarController(ICarService service) : ControllerBase
    {
        [HttpGet]
        public ApiResponse Get([FromQuery] Pagination pagination, [FromQuery] CarFilters filters)
        {
            ApiResponse response = new ApiResponse();

            var data = service.Get(pagination, filters);

            response.StatusCode = Model.Enum.MessageType.Success;
            response.Result = data;

            return response;
        }

        [HttpPost]
        public ApiResponse Save(CarModel car)
        {
            ApiResponse response = new ApiResponse();

            var data = service.Save(car);
            response.StatusCode = Model.Enum.MessageType.Success;
            response.Message = "Saved Successfully !!";
            if (int.Parse(data) == 0)
            {
                response.StatusCode = Model.Enum.MessageType.Error;
                response.Message = "Something went wrong";
            }

            return response;
        }
    }
}
