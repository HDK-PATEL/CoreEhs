using System.Data.SqlTypes;

namespace CoreEhs.Model;

public class CarModel
{
    public int Id { get; set; }
    public int BrandId { get; set; }
    public int ClassId { get; set; }
    public string ModelName { get; set; }
    public string ModelCode { get; set; }
    public string Description { get; set; }
    public string Features { get; set; }
    public decimal Price { get; set; }
    public DateTime DateOfManufacturing { get; set; }
    public int SortOrder { get; set; }
}
