using CoreEhs.Model;

namespace CoreEhs.Interface;

public interface IAttachmentService
{
    Task<ApiResponse> UploadAttachment();
}
