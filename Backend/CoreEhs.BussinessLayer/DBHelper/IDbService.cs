using System.Data;

namespace CoreEhs.BussinessLayer.DBHelper;

public interface IDbService
{
    DataSet GetDataSet(string sql, CommandType commandType, Dictionary<string, object> parameters = null);
}
