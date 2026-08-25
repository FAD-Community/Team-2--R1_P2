using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FixNow.Application.Common;

public class ApiResponse<T>
{
    public bool Success { get; set; }
    public string? Message { get; set; }
    public T? Data { get; set; }
    public List<string>? Errors { get; set; }
    public int StatusCode { get; set; } = 200;

    public static ApiResponse<T> SuccessResponse(T? data, string? message = null, int statusCode = 200) =>
        new() { Success = true, Data = data, Message = message, StatusCode = statusCode };

    public static ApiResponse<T> FailureResponse(string message, int statusCode = 400, List<string>? errors = null) =>
        new() { Success = false, Message = message, Errors = errors, StatusCode = statusCode };
}
