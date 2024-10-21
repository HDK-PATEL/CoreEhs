using CoreEhs.Model;

namespace CoreEhs.Interface;

public interface IAuthService
{
    UserModel AddUser(UserModel user);
    string Login(LoginRequestModel loginRequest);
    RoleModel Role(RoleModel role);
    bool AssignRoleToUser(UserRoles userRoles);
}
