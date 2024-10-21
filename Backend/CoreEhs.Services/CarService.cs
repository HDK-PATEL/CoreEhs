using CoreEhs.BussinessLayer.DBHelper;
using CoreEhs.Interface;
using CoreEhs.Model;
using CoreEhs.Model.Enum;
using CoreEhs.Modell;
using System.Data;

namespace CoreEhs.Services;

public class CarService(IDbService service) : ICarService
{
    public dynamic Get(Pagination pagination, CarFilters filters)
    {
        Dictionary<string, object> key = new Dictionary<string, object>();
        if (pagination != null)
        {
            key["@PageNumber"] = pagination.PageNumber == 0 ? 1 : pagination.PageNumber;
            key["@PageSize"] = pagination.PageSize == 0 ? 20 : pagination.PageSize;
        }

        key["@Id"] = filters == null || filters.CarId == 0 ? 0 : filters.CarId;
        key["@ModelName"] = filters == null || string.IsNullOrEmpty(filters.ModelName) ? string.Empty : filters.ModelName;
        key["@ModelCode"] = filters == null || string.IsNullOrEmpty(filters.ModelCode) ? string.Empty : filters.ModelCode;
        DataSet ds = service.GetDataSet("USP_GetCars", CommandType.StoredProcedure, key);

        var data = ds.Tables[0].AsEnumerable().Select(x => new
        {
            CarId = int.Parse(x["Id"].ToString()),
            BrandId = int.Parse(x["BrandId"].ToString()),
            BrandName = x["BrandName"].ToString(),
            ClassId = int.Parse(x["ClassId"].ToString()),
            ClassName = x["ClassName"].ToString(),
            ModelName = x["ModelName"].ToString(),
            ModelCode = x["ModelCode"].ToString(),
            Description = x["Description"].ToString(),
            Features = x["Features"].ToString(),
            Price = x["Price"].ToString(),
            DateOfManufacturing = x["DateOfManufacturing"].ToString(),
            SortOrder = int.Parse(x["SortOrder"].ToString()),
            IsActive = bool.Parse(x["IsActive"].ToString())
        }).ToList();
        
        return data;
    }

    public dynamic Save(CarModel car)
    {
        Dictionary<string, object> key = new Dictionary<string, object>();

        key["@Id"] = car.Id;
        key["@BrandId"] = car.BrandId;
        key["@ClassId"] = car.ClassId;
        key["@ModelName"] = car.ModelName;
        key["@ModelCode"] = car.ModelCode;
        key["@Description"] = car.Description;
        key["@Features"] = car.Features;
        key["@Price"] = car.Price;
        key["@DateOfManufacturing"] = car.DateOfManufacturing;
        key["@SortOrder"] = car.SortOrder;

        DataSet ds = service.GetDataSet("USP_SaveCars", CommandType.StoredProcedure, key);
        

        var data = ds.Tables[0].AsEnumerable().Select(x => new {
            StatusId = int.Parse(x["StatusId"].ToString()),
            CarId = int.Parse(x["CarId"].ToString())
        }).FirstOrDefault();

        if (data.StatusId == 0)
        {
            return 0;
        }

        return data;
    }
}
