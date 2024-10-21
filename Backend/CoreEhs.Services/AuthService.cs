using CoreEhs.BussinessLayer.DBHelper;
using CoreEhs.Interface;
using CoreEhs.Model;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace CoreEhs.Services;

public class AuthService
    (
        IDbService service,
        IConfiguration configuration
    ) : IAuthService
{
    public UserModel AddUser(UserModel user)
    {
        Dictionary<string, object> key = new Dictionary<string, object>();
        key["@Id"] = user.Id;
        key["@Name"] = user.Name;
        key["@Username"] = user.Username;
        key["@Password"] = user.Password;
        service.GetDataSet("USP_AddUser", System.Data.CommandType.StoredProcedure, key);

        return user;
    }

    public bool AssignRoleToUser(UserRoles userRoles)
    {
        throw new NotImplementedException();
    }

    public string Login(LoginRequestModel loginRequest)
    {
        if (loginRequest.Username != null && loginRequest.Password != null)
        {
            Dictionary<string, object> key = new Dictionary<string, object>();
            key["@Username"] = loginRequest.Username;
            key["@Password"] = loginRequest.Password;
            DataSet ds = service.GetDataSet("USP_UserCheck", System.Data.CommandType.StoredProcedure, key);

            var data = ds.Tables[0].AsEnumerable().Select(x => new
            {
                Id = int.Parse(x["Id"].ToString()),
                Name = x["Name"].ToString(),
                AssignedRole = x["AssignedRole"].ToString().Split(',').Where(w => !string.IsNullOrEmpty(w)).Select(s => s).ToList(),
            }).FirstOrDefault();

            if (data != null) {
                var claims = new List<Claim> {

                    new Claim(JwtRegisteredClaimNames.Sub, configuration["Jwt:Subject"]),
                    new Claim("Id", data.Id.ToString()),
                    new Claim("Username", data.Name)

                    };

                foreach (var item in data.AssignedRole)
                {
                    claims.Add(new Claim(ClaimTypes.Role, item));
                }

                var Secretkey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["Jwt:key"]));
                var SignIn = new SigningCredentials(Secretkey, SecurityAlgorithms.HmacSha256);
                var Token = new JwtSecurityToken(
                        configuration["Jwt:Issuer"],
                        configuration["Jwt:Audience"],
                        claims,
                        expires: DateTime.UtcNow.AddMinutes(10),
                        signingCredentials: SignIn
                        );

                var JwtToken = new JwtSecurityTokenHandler().WriteToken(Token);
                return JwtToken;
            }
            
        }
        return string.Empty;
    }

    public RoleModel Role(RoleModel role)
    {
        throw new NotImplementedException();
    }
}
