using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace CoreEhs.BussinessLayer.DBHelper;

public class CoreEhsContext(IConfiguration configuration)
{
    public IDbConnection CreateConnection() => new SqlConnection(configuration.GetConnectionString("CoreEhsDbConnection"));
}
