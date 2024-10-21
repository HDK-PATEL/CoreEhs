using CoreEhs.Interface;
using CoreEhs.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace CoreEhs.Api.Controllers;

[Route("api/v1/report")]
[ApiController]
[Authorize]
public class ReportController(IReportService service) : ControllerBase
{
    [Route("salesman-commission-figure")]
    [HttpGet]
    public ApiResponse Get()
    {
        ApiResponse response = new ApiResponse();

        var data = service.Get();

        response.StatusCode = Model.Enum.MessageType.Success;
        response.Result = data;

        return response;
    }
}
