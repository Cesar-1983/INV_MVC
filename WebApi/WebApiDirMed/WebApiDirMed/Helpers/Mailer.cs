using System;
using System.Text;
using System.Threading;
using EASendMail;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Responses;
using Google.Apis.Oauth2.v2;
using Google.Apis.Services;


namespace WebApiDirMed.Helpers
{
    public class Mailer
    {
        public static ClientSecrets secrets = new ClientSecrets()
        {
            ClientId = "100539206645-hqa4al0uircibj37noi7oos10rde5oau.apps.googleusercontent.com",
            ClientSecret = "LSso2ECUQ_N4l5jmZoRN_dek"
        };


        var service = new PlusService(new BaseClientService.Initializer()
        {
            HttpClientInitializer = credential,
            ApplicationName = "Plus API Sample",
        });


        // Configuration that you probably don't need to change.
        private static readonly IAuthorizationCodeFlow flow =
                    new GoogleAuthorizationCodeFlow(new GoogleAuthorizationCodeFlow.Initializer
                    {
                        ClientSecrets = secrets,
                        Scopes = new[] {   },
                        DataStore = new FileDataStore("Drive.Api.Auth.Store")
                    });


        public async System.Threading.Tasks.Task EnviarCorreoGmailAccesTokenAsync(string EmailFrom,string access_token, string To ,string Subject,string Body) {
            try
            {
                UserCredential credential;

                // Use the code exchange flow to get an access and refresh token.
                credential = await GoogleWebAuthorizationBroker.AuthorizeAsync(secrets,new[] { BooksService.Scope.Books },"user",CancellationToken.None,new FileDataStore("Books.ListMyLibrary"));

                SmtpMail oMail = new SmtpMail("TryIt");
                SmtpClient oSmtp = new SmtpClient();

                // Your gmail email address
                oMail.From = EmailFrom;

                // Set recipient email address
                oMail.To = To;

                // Set email subject
                oMail.Subject = Subject;

                // Set email body
                oMail.TextBody = "<br>Codigo :"+Body;

                // Gmail SMTP server address
                SmtpServer oServer = new SmtpServer("smtp.gmail.com");

                // Using 587 port, you can also use 465 port
                oServer.Port = 587;

                // enable SSL connection
                oServer.ConnectType = SmtpConnectType.ConnectSSLAuto;

                // use Gmail SMTP OAUTH 2.0 authentication
                oServer.AuthType = SmtpAuthType.XOAUTH2;
                oServer.User = EmailFrom;

                // use the access token as password
                oServer.Password = access_token;

                oSmtp.SendMail(oServer, oMail);

            }
            catch (Exception ex)
            {

                throw;
            }
        }


    }
}