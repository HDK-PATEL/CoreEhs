using CoreEhs.Model;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;

namespace CoreEhs.Common.Middleware;

public class AuthorizationMiddleware(RequestDelegate next, IOptions<AppSettings> appSettings)
{

}
