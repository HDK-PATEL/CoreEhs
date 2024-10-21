using CoreEhs.Container;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;
using Serilog;
using CoreEhs.Common.Middleware;
using Microsoft.Extensions.Options;
namespace CoreEhs.Api;

public class Program
{
    public static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        // Add services to the container.
        builder.Services.AddRepository();
        builder.Services.AddControllers();
        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddCors(options =>
        {
            options.AddPolicy("AllowAngularApp",
                policy =>
                {
                    policy.WithOrigins("http://localhost:4200")  // Frontend URL
                          .AllowAnyHeader()
                          .AllowAnyMethod();
                });
        });
        builder.Services.AddSwaggerGen(o =>
        {
            o.SwaggerDoc("v1", new OpenApiInfo { Title = "CoreEhsApi", Version = "v1" });
            o.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
            {
                In = ParameterLocation.Header,
                Description = "Please Enter Token",
                Name = "Authorization",
                Type = SecuritySchemeType.Http,
                BearerFormat = "JWT",
                Scheme = "bearer"
            });
            o.AddSecurityRequirement(new OpenApiSecurityRequirement
            {
                {
                    new OpenApiSecurityScheme
                    {
                        Reference = new OpenApiReference
                        {
                            Type = ReferenceType.SecurityScheme,
                            Id = "Bearer"
                        }
                    },
                    new string[] { }
                }
            });
        });
        builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(o =>
        {
            o.RequireHttpsMetadata = false;
            o.SaveToken = true;
            o.TokenValidationParameters = new TokenValidationParameters()
            {
                ValidateIssuer = true,
                ValidateAudience = true,
                ValidAudience = builder.Configuration["Jwt:Audience"],
                ValidIssuer = builder.Configuration["Jwt:Issuer"],
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:key"])),
                ValidateIssuerSigningKey = true
            };
        });

        var app = builder.Build();

        // Configure the HTTP request pipeline.
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI();
        }

        app.UseHttpsRedirection();

        app.UseAuthorization();
        app.UseMiddleware<GlobalExceptionMiddleware>();

        app.MapControllers();
        app.UseCors(option =>
            option.AllowAnyOrigin()
            .AllowAnyHeader()
            .AllowAnyMethod());
        app.Run();
    }
}
