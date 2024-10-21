using CoreEhs.Interface;
using CoreEhs.Model;
using CoreEhs.Model.Enum;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;

namespace CoreEhs.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AttachmentController : ControllerBase
    {

        string ApiDomain = "";
        string rootPath = Directory.GetCurrentDirectory();

        [HttpPost]
        public async Task<ApiResponse> UploadAttachments()
        {
            string attachmentPath, fileExtension, filePath, fileName = string.Empty;
            List<object> uploadedfiles = new List<object>();

            var httpRequest = Request;
            ApiResponse response = new ApiResponse();
            if (httpRequest != null
                && httpRequest.Form.Files != null
                && httpRequest.Form.Files.Count > 0)
            {
                for (int i = 0; i < httpRequest.Form.Files.Count; i++)
                {
                    var postedFile = httpRequest.Form.Files[i];

                    //attachmentPath = Path.Combine(rootPath, "Attachment", "Temp");
                    attachmentPath = Path.Combine(Directory.GetCurrentDirectory(), "UploadedFiles", "Temp");
                    fileExtension = Path.GetExtension(postedFile.FileName);
                    fileName = string.Format("{0}{1}", Guid.NewGuid(), fileExtension);
                    filePath = Path.Combine(attachmentPath, fileName);

                    if (!Directory.Exists(attachmentPath))
                    {
                        Directory.CreateDirectory(attachmentPath);
                    }

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await postedFile.CopyToAsync(stream);
                    }

                    var uploadedFile = new
                    {
                        fileName = fileName,
                        fileUrl = string.Format("{0}{1}", ApiDomain, filePath.Replace(rootPath, "").Replace(@"\", "/"))
                    };


                    uploadedfiles.Add(uploadedFile);


                }

            }
            response.StatusCode = MessageType.Success;
            response.Result = uploadedfiles;
            return response;
        }
    }
}
