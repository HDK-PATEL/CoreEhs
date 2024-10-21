using CoreEhs.BussinessLayer.DBHelper;
using System.Data;

namespace CoreEhs.BussinessLayer;

public class DbServices(CoreEhsContext coreEhsContext) : IDbService
{
    public DataSet GetDataSet(string sql, CommandType commandType, Dictionary<string, object> parameters = null)
    {
        var result = new DataSet();

        using (var context = coreEhsContext.CreateConnection())
        {
            var cmd = context.CreateCommand();
            cmd.CommandType = commandType;
            cmd.CommandText = sql;

            foreach (var param in parameters)
            {
                var p = cmd.CreateParameter();
                p.ParameterName = param.Key;
                p.Value = param.Value;
                cmd.Parameters.Add(p);
            }

            try
            {
                context.Open();
                var reader = cmd.ExecuteReader();

                do
                {
                    var tb = new DataTable();
                    tb.Load(reader);
                    result.Tables.Add(tb);
                }
                while (!reader.IsClosed);
            }
            finally { 
                context.Close();
            }
        }
        return result;
    }
}
