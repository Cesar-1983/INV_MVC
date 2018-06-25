using Google.Apis.Auth.OAuth2;
using Google.Apis.Gmail.v1;
using Google.Apis.Gmail.v1.Data;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Net.Mail;


namespace WebApiDirMed.Helpers
{
    public class Mailer
    {
        static string[] Scopes = { GmailService.Scope.GmailSend };
        static string ApplicationName = "Otro cliente 1";


        public void SendMail() {
            UserCredential credential;

            using (var stream =
                new FileStream("client_secret.json", FileMode.Open, FileAccess.Read))
            {
                string credPath = System.Environment.GetFolderPath(
                    System.Environment.SpecialFolder.Personal);
                credPath = Path.Combine(credPath, ".credentials/client_secret.json");

                credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                    GoogleClientSecrets.Load(stream).Secrets,
                    Scopes,
                    "user",
                    CancellationToken.None,
                    new FileDataStore(credPath, true)).Result;
                Console.WriteLine("Credential file saved to: " + credPath);
            }

            // Create Gmail API service.
            var service = new GmailService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = ApplicationName,
            });

            var msg = new AE.Net.Mail.MailMessage
            {
                Subject = "Test GMail API Send Mail",
                Body = "Hello, World, from Gmail API!",
                From = new MailAddress("cesariverarivas@gmail.com")
            };
            msg.To.Add(new MailAddress("cesariverarivas@gmail.com"));
            msg.ReplyTo.Add(msg.From); // Bounces without this!!
            var msgStr = new StringWriter();
            msg.Save(msgStr);


            // Define parameters of request.
            //UsersResource.LabelsResource.ListRequest request = service.Users.Labels.List("me");

            UsersResource.MessagesResource.SendRequest request = service.Users.Messages.Send(new Message
            {
                Raw = Base64UrlEncode(msgStr.ToString())
            }, "me");

            // List labels.
            //IList<Label> labels = request.Execute().Labels;

            //Console.WriteLine("Labels:");
            //if (labels != null && labels.Count > 0)
            //{
            //    foreach (var labelItem in labels)
            //    {
            //        Console.WriteLine("{0}", labelItem.Name);
            //    }
            //}
            //else
            //{
            //    Console.WriteLine("No labels found.");
            //}
            var resultado = request.Execute();
            Console.WriteLine("Mensaje enviado " + resultado.Id);
            Console.ReadKey();
        }
        public void SendMail(string To,string Subject,string Body)
        {
            UserCredential credential;
            var PathToClientSecret = System.Web.HttpContext.Current.Request.MapPath("~\\Content\\client_secret.json");
            //using (var stream =
            //    new FileStream("client_secret.json", FileMode.Open, FileAccess.Read))
            //{
                using (var stream =
                new FileStream(PathToClientSecret, FileMode.Open, FileAccess.Read))
                {
                    string credPath = System.Environment.GetFolderPath(
                    System.Environment.SpecialFolder.Personal);
                credPath = Path.Combine(credPath, ".credentials/client_secret.json");

                credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                    GoogleClientSecrets.Load(stream).Secrets,
                    Scopes,
                    "user",
                    CancellationToken.None,
                    new FileDataStore(credPath, true)).Result;
                Console.WriteLine("Credential file saved to: " + credPath);
            }

            // Create Gmail API service.
            var service = new GmailService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = ApplicationName,
            });
            
            var msg = new AE.Net.Mail.MailMessage
            {
                Subject = "=?UTF-8?B?"+ Base64UrlEncode(Subject)+"?=",
                
                Body = Body,
                From = new MailAddress("cesariverarivas@gmail.com"),
                ContentType = "text/html"
            };
            msg.To.Add(new MailAddress(To));
            msg.ReplyTo.Add(msg.From); // Bounces without this!!
            var msgStr = new StringWriter();
            msg.Save(msgStr);



            UsersResource.MessagesResource.SendRequest request = service.Users.Messages.Send(new Message
            {
                Raw = Base64UrlEncode(msgStr.ToString())
            }, "me");

            var resultado = request.Execute();
            
        }

        private static string Base64UrlEncode(string input)
        {
            var inputBytes = System.Text.Encoding.UTF8.GetBytes(input);
            // Special "url-safe" base64 encode.
            return Convert.ToBase64String(inputBytes)
              .Replace('+', '-')
              .Replace('/', '_')
              .Replace("=", "");
        }
    }
}