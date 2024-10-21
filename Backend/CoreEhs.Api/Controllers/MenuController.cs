using CoreEhs.Interface;
using CoreEhs.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CoreEhs.Api.Controllers;

[Route("api/v1/[controller]")]
[ApiController]
[Authorize]
public class MenuController(IMenuService service) : ControllerBase
{
    [HttpGet]
    public ApiResponse Get()
    {
        ApiResponse response = new ApiResponse();
        string userId = User.FindFirst("Id")?.Value;

        userId = string.IsNullOrEmpty(userId) ? "1" : userId;

        var data = service.GetMenuList(int.Parse(userId));

        response.StatusCode = Model.Enum.MessageType.Success;
        response.Result = data;

        return response;
    }
}
