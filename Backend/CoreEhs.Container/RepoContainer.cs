using CoreEhs.BussinessLayer;
using CoreEhs.BussinessLayer.DBHelper;
using CoreEhs.Interface;
using CoreEhs.Services;
using Microsoft.Extensions.DependencyInjection;

namespace CoreEhs.Container;

public static class RepoContainer
{
    public static void AddRepository(this IServiceCollection service)
    {
        // DB Context
        service.AddSingleton<CoreEhsContext>();

        // Services
        service.AddScoped<IDbService, DbServices>();
        service.AddScoped<ICarService, CarService>();
        service.AddScoped<IAttachmentService, AttachmentService>();
        service.AddScoped<IAuthService, AuthService>();
        service.AddScoped<IMenuService, MenuService>();
        service.AddScoped<IMasterService, MasterService>();
        service.AddScoped<IReportService, ReportService>();
    }
}
