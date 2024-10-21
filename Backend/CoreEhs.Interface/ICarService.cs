using CoreEhs.Model;
using CoreEhs.Modell;

namespace CoreEhs.Interface;

public interface ICarService
{
    dynamic Get(Pagination pagination, CarFilters filters);
    dynamic Save(CarModel car);
}
