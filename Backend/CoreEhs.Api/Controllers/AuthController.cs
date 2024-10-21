using CoreEhs.Interface;
using CoreEhs.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity.Data;
using Microsoft.AspNetCore.Mvc;

namespace CoreEhs.Api.Controllers;

[Route("api/v1")]
[ApiController]
public class AuthController
    (IAuthService service)
    : ControllerBase
{
    [Route("login")]
    [HttpPost]
    public ApiResponse Login([FromBody] LoginRequestModel login)
    {
        var token = service.Login(login);

        ApiResponse response = new ApiResponse();
        if (token == null)
        {
            response.StatusCode = Model.Enum.MessageType.Error;
            response.Message = "Something went wrong !!";
        }
        response.StatusCode = Model.Enum.MessageType.Success;
        response.Result = token;
        return response;
    }
}
