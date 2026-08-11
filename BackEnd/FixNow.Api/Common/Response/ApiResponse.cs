using System;
using System.Collections.Generic;
using System.Text;

namespace Task1.Response
{
  public class ApiResponse<TData>
    {
        public int statuscode {  get; set; }
        public bool IsSuccess {  get; set; }
        public string message { get; set; }
        public TData? Data { get; set; }
        public List<string>? errors { get; set; }=new List<string>();
        //Success Response
        public ApiResponse(TData data, string mss,int status=200)
        {
            Data = data;
            statuscode = status;
           message = mss;
            IsSuccess = true;
        }

        // faild Response
        public ApiResponse(string mss,List<string> _errors=null, int status = 400)
        {
            errors = _errors;
            statuscode = status;
            message = mss;
            IsSuccess = false;
        }

    }
}
