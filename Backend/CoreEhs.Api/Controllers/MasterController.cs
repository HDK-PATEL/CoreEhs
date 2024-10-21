using CoreEhs.Interface;
using CoreEhs.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CoreEhs.Api.Controllers;

[Route("api/v1/master")]
[ApiController]
[Authorize]
public class MasterController(IMasterService service) : ControllerBase
{
    [Route("brand")]
    [HttpGet]
    public ApiResponse GetBrands()
    {
        ApiResponse response = new ApiResponse();

        var data = service.GetBrand();

        if (data == null)
        {
            response.StatusCode = Model.Enum.MessageType.NotFound;
        }
        response.StatusCode = Model.Enum.MessageType.Success;
        response.Result = data;

        return response;
    }

    [Route("class")]
    [HttpGet]
    public ApiResponse GetClass()
    {
        ApiResponse response = new ApiResponse();

        var data = service.GetClass();

        if (data == null)
        {
            response.StatusCode = Model.Enum.MessageType.NotFound;
        }
        response.StatusCode = Model.Enum.MessageType.Success;
        response.Result = data;

        return response;
    }
}
