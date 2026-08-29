using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FixNow.Application.Abstractions;
public interface IEmailSender
{
    Task SendEmailAsync(string toEmail, string subject, string body);
}