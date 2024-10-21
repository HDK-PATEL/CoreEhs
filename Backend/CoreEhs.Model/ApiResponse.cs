using CoreEhs.Model.Enum;

namespace CoreEhs.Model;

public class ApiResponse
{
    public MessageType StatusCode { get; set; }
    public string? Message { get; set; }
    public object? Result { get; set; }
    public int Total { get; set; }
}
