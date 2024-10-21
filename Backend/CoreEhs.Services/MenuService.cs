using CoreEhs.BussinessLayer.DBHelper;
using CoreEhs.Interface;
using System.Data;

namespace CoreEhs.Services;

public class MenuService(IDbService service) : IMenuService
{
    public dynamic GetMenuList(int UserId)
    {
        Dictionary<string, object> key = new Dictionary<string, object>();
        key["@UserId"] = UserId;

        DataSet ds = service.GetDataSet("USP_GetMenus", CommandType.StoredProcedure, key);

        var data = ds.Tables[0].AsEnumerable().Select(x => new
        {
            Id = int.Parse(x["Id"].ToString()),
            ParentId = int.Parse(x["ParentId"].ToString()),
            MenuName = x["MenuName"].ToString(),
            Icon = x["Icon"].ToString(),
            Link = x["link"].ToString(),
            OrderById = int.Parse(x["OrderById"].ToString())
        }).ToList();

        return data;
    }
}
