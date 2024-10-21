using CoreEhs.BussinessLayer.DBHelper;
using CoreEhs.Interface;
using System.Data;

namespace CoreEhs.Services;

public class MasterService(IDbService service) : IMasterService
{
    public dynamic GetBrand()
    {
        Dictionary<string, object> key = new Dictionary<string, object>();
        DataSet ds = service.GetDataSet("USP_GetBrand", CommandType.StoredProcedure, key);

        var data = ds.Tables[0].AsEnumerable().Select(x => new
        {
            Id = int.Parse(x["Id"].ToString()),
            Name = x["BrandName"].ToString()
        }).ToList();

        return data;
    }

    public dynamic GetClass()
    {
        Dictionary<string, object> key = new Dictionary<string, object>();
        DataSet ds = service.GetDataSet("USP_GetClass", CommandType.StoredProcedure, key);

        var data = ds.Tables[0].AsEnumerable().Select(x => new
        {
            Id = int.Parse(x["Id"].ToString()),
            Name = x["ClassName"].ToString()
        }).ToList();

        return data;
    }
}
