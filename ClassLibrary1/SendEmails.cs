using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.Odbc;
using System.Data.OleDb;
using System.Net.Mail;
using System.IO;
using System.Xml.Serialization;
using System.Web;
using System.Collections.Specialized;

//using System.Web.UI.WebControls;


namespace CTBusinessLayer
{
   public class SendEmails
    {
        string connectionString =
       ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        string e_mail_address = null;
        string qty = null;
        string emailbody = null;
        public string AdminEmailAdd { get; set; }
        public string LogonEmailAdd { get; set; }
        public string LogonPwd { get; set; }
        public string AcctNumber { get; set; }
        public string AcctName { get; set; }
        public string AcctBank { get; set; }
        public string AdminPhone { get; set; }
        public string SubscriptionFee { get; set; }
        public string AdvertSubscriptionFee { get; set; }


        public void GetAdminEmailDetails()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd2 = new SqlCommand("spGetAdminDetails", con);
                cmd2.CommandType = CommandType.StoredProcedure;

                con.Open();
                SqlDataReader rd2 = cmd2.ExecuteReader();

                if (rd2.HasRows)
                {
                    while (rd2.Read())
                    {
                        //bra = (string)rd2["bra"].ToString();
                        AdminEmailAdd = (string)rd2["AdminEmail"].ToString();
                        LogonEmailAdd = (string)rd2["LoginEmail"].ToString();
                        LogonPwd = (string)rd2["LoginPwd"].ToString();
                        
                    }
                }
                rd2.Dispose();
            }
        }
        public void SendEnquiryToEmail(CTBusinessLayer.ContactUs Enquiry)
        {
            GetAdminEmailDetails();
            if (AdminEmailAdd != null || AdminEmailAdd != "")
            {
                e_mail_address = AdminEmailAdd;//Admin email
                string todayis = Convert.ToString(DateTime.Now.ToString());
                emailbody = "<html> <head>     <link rel='icon' type='image/png' href='/favicon-16x16.png'/> <style> table {    width:100%;} table, th, td { border: 1px solid #e56e94; border-collapse: collapse; } th, td { padding: 5px; text-align: left; } table#t01 tr:nth-child(even) { background-color: #ffffff;} table#t01 tr:nth-child(odd) { background-color:#ffdfdd; } table#t01 th	{ background-color: #810541; color: white; } </style> </head> <body> <body > <div style='position:absolute; height:50px; font-size:15px; font face = 'cursive'; width:600px; background-color:#FBBBB9; padding:30px;'> <font color='#F6358A'; face='fantasy'>CRYSTAL TETTEY</font><font color='#F6358A'; face='ar hermann'> POET, SOUL AND FOLK MUSIC!</font> </div>         <br /> <div style='background-color: #ece8d4;style='color:grey; font-size:15px;'     font face='Helvetica, Arial, sans-serif' width:600px; height:600px; padding:30px; margin-top:30px;'> <p>Hello,<br /> Please find Enquiry details:\n <br /> Comment - \t" + (string)Enquiry.Comment.ToString() + "\n <br /> From - " + (string)Enquiry.FullName.ToString() + " " + "\n<br /> Email  - " + (string)Enquiry.Email.ToString() + "\t <br /> Date - " + todayis + " <br /><br />  </p></body></html>";

                //emailbody = "Please find Enquiry details:\n Comment - \t" + (string)Enquiry.Comment.ToString() + ",\n from - " + (string)Enquiry.FullName.ToString() + " " + ",\n email  - " + (string)Enquiry.Email.ToString() + ",\t Date - " + todayis + " -end of msg ";
                string subject = "Enquiry And Questions";
                SendEmail(emailbody, e_mail_address, subject);
                SendEmail(emailbody, "crystaltettey@yahoo.com", subject);
            }
        }

        public void SendEmail(string emailbody, string emailAdd, string subject)
        {
            try
            {
                
                MailMessage mailmessage = new MailMessage(AdminEmailAdd, emailAdd);
                mailmessage.From = new MailAddress(LogonEmailAdd, "CrystalTettey");
                mailmessage.IsBodyHtml = true;
                mailmessage.Subject = subject;
                mailmessage.Body = emailbody;

                SmtpClient smptclient = new SmtpClient("127.0.0.1", 25);//587   smtp.mail.yahoo.com mail.quickysale.com 25
                smptclient.Credentials = new System.Net.NetworkCredential()
                {
                    UserName = LogonEmailAdd,
                    Password = LogonPwd
                };
                smptclient.EnableSsl = false;
                smptclient.Send(mailmessage);
                //Console.WriteLine("message sent");
            }
            catch (Exception ex)
            {
                ex.StackTrace.ToString();
                throw;
            }


        }
    }
}
