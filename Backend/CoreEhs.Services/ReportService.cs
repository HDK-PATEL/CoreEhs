using CoreEhs.BussinessLayer.DBHelper;
using CoreEhs.Interface;
using System.Data;

namespace CoreEhs.Services;

public class ReportService(IDbService service) : IReportService
{
    public dynamic Get()
    {
        Dictionary<string, object> key = new Dictionary<string, object>();
        DataSet ds = service.GetDataSet("USP_RPT_SalesmanCommissionFigure", CommandType.StoredProcedure, key);

        var data = ds.Tables[0].AsEnumerable().Select(x => new
        {
            Salesman = x["Salesman"].ToString(),
            Audi = x["Audi"].ToString(),
            Jaguar = x["Jaguar"].ToString(),
            LandRover = x["LandRover"].ToString(),
            Renault = x["Renault"].ToString()
        }).ToList();

        return data;
    }
}
