using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CTBusinessLayer
{
    public class BusinessLayer
    {
        string connectionString =
                   ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        public IEnumerable<RelatedLinks> RelatedLinked
        {
            get
            {


                List<RelatedLinks> RelatemLinkDetails = new List<RelatedLinks>();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("spGetAllRelatedLinks", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        RelatedLinks relateditem = new RelatedLinks();
                        relateditem.linkId = Convert.ToDecimal(rdr["linkId"]);
                        relateditem.linkName = rdr["linkName"].ToString();
                        relateditem.linkDescription = rdr["linkDescription"].ToString();
                        relateditem.linkAddress = rdr["linkAddress"].ToString();
                       
                        RelatemLinkDetails.Add(relateditem);
                    }
                    rdr.Dispose();
                }

                return RelatemLinkDetails;
            }
        }

        public IEnumerable<PhotoGallery> PhotoGallerys
        {
            get
            {


                List<PhotoGallery> photoGalleryDetail = new List<PhotoGallery>();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("spGetAllPhotoDetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        PhotoGallery Photoitem = new PhotoGallery();
                        Photoitem.photoId = Convert.ToDecimal(rdr["photoId"]);
                        Photoitem.photoAltName = rdr["photoAltName"].ToString();
                        Photoitem.photoDescription = rdr["photoDescription"].ToString();
                        Photoitem.photoLink = rdr["photoLink"].ToString();
                        Photoitem.photoName = rdr["photoName"].ToString();
                       
                        photoGalleryDetail.Add(Photoitem);
                    }
                    rdr.Dispose();
                }

                return photoGalleryDetail;
            }
        }


        public void SaveChangesRelatedLinksDetailsToDB(RelatedLinks collection)
        {

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spSaveChangesRelatedLinksDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramsellerAddress = new SqlParameter();
                paramsellerAddress.ParameterName = "@linkAddress";
                paramsellerAddress.Value = collection.linkAddress;
                //cmd.Parameters.Add(paramsellerAddress);
                cmd.Parameters.AddWithValue("@linkAddress", collection.linkAddress);



                SqlParameter paramsellerExpiryDate = new SqlParameter();
                paramsellerExpiryDate.ParameterName = "@linkDescription";
                paramsellerExpiryDate.Value = collection.linkDescription;
                //cmd.Parameters.Add(paramsellerExpiryDate);
                cmd.Parameters.AddWithValue("@linkDescription", collection.linkDescription);


                SqlParameter paramsellerName = new SqlParameter();
                paramsellerName.ParameterName = "@linkName";
                paramsellerName.Value = collection.linkName;
                //cmd.Parameters.Add(paramsellerName);
                cmd.Parameters.AddWithValue("@linkName", collection.linkName);

                
                SqlParameter paramsellerId = new SqlParameter();
                paramsellerId.ParameterName = "@linkId";
                paramsellerId.Value = collection.linkId;
                //cmd.Parameters.Add(paramsellerId);
                cmd.Parameters.AddWithValue("@linkId", collection.linkId);


                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void SaveChangesPhotoDetailsToDB(PhotoGallery collection)
        {

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spSaveChangesPhotoDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramsellerAddress = new SqlParameter();
                paramsellerAddress.ParameterName = "@photoAltName";
                paramsellerAddress.Value = collection.photoAltName;
                //cmd.Parameters.Add(paramsellerAddress);
                cmd.Parameters.AddWithValue("@photoAltName", collection.photoAltName);


                SqlParameter paramsellerExpiryDate = new SqlParameter();
                paramsellerExpiryDate.ParameterName = "@photoDescription";
                paramsellerExpiryDate.Value = collection.photoDescription;
                //cmd.Parameters.Add(paramsellerExpiryDate);
                cmd.Parameters.AddWithValue("@photoDescription", collection.photoDescription);


                SqlParameter paramsellerName = new SqlParameter();
                paramsellerName.ParameterName = "@photoLink";
                paramsellerName.Value = collection.photoLink;
                //cmd.Parameters.Add(paramsellerName);
                cmd.Parameters.AddWithValue("@photoLink", collection.photoLink);


                SqlParameter paramsellerId = new SqlParameter();
                paramsellerId.ParameterName = "@photoId";
                paramsellerId.Value = collection.photoId;
                //cmd.Parameters.Add(paramsellerId);
                cmd.Parameters.AddWithValue("@photoId", collection.photoId);


                SqlParameter paramsellerWebsite = new SqlParameter();
                paramsellerWebsite.ParameterName = "@photoName";
                paramsellerWebsite.Value = collection.photoName;
                //cmd.Parameters.Add(paramsellerWebsite);
                cmd.Parameters.AddWithValue("@photoName", collection.photoName);


                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void AddPhotoDetailsToDB(PhotoGallery collection)
        {

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spAddPhotoDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramsellerAddress = new SqlParameter();
                paramsellerAddress.ParameterName = "@photoAltName";
                paramsellerAddress.Value = collection.photoAltName;
                //cmd.Parameters.Add(paramsellerAddress);
                cmd.Parameters.AddWithValue("@photoAltName", collection.photoAltName);


                SqlParameter paramsellerExpiryDate = new SqlParameter();
                paramsellerExpiryDate.ParameterName = "@photoDescription";
                paramsellerExpiryDate.Value = collection.photoDescription;
                //cmd.Parameters.Add(paramsellerExpiryDate);
                cmd.Parameters.AddWithValue("@photoDescription", collection.photoDescription);


                SqlParameter paramsellerName = new SqlParameter();
                paramsellerName.ParameterName = "@photoLink";
                paramsellerName.Value = collection.photoLink;
                //cmd.Parameters.Add(paramsellerName);
                cmd.Parameters.AddWithValue("@photoLink", collection.photoLink);


                SqlParameter paramsellerPhone = new SqlParameter();
                paramsellerPhone.ParameterName = "@photoName";
                paramsellerPhone.Value = collection.photoName;
                //cmd.Parameters.Add(paramsellerPhone);
                cmd.Parameters.AddWithValue("@photoName", collection.photoName);


               
                con.Open();
                cmd.ExecuteNonQuery();
            }

        }

        public void AddRelatedLinksDetailsToDB(RelatedLinks collection)
        {

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spAddRelatedLinksDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramsellerAddress = new SqlParameter();
                paramsellerAddress.ParameterName = "@linkAddress";
                paramsellerAddress.Value = collection.linkAddress;
                //cmd.Parameters.Add(paramsellerAddress);
                cmd.Parameters.AddWithValue("@linkAddress", collection.linkAddress);

                SqlParameter paramsellerExpiryDate = new SqlParameter();
                paramsellerExpiryDate.ParameterName = "@linkDescription";
                paramsellerExpiryDate.Value = collection.linkDescription;
                //cmd.Parameters.Add(paramsellerExpiryDate);
                cmd.Parameters.AddWithValue("@linkDescription", collection.linkDescription);
               
                SqlParameter paramsellerPhone = new SqlParameter();
                paramsellerPhone.ParameterName = "@linkName";
                paramsellerPhone.Value = collection.linkName;
                //cmd.Parameters.Add(paramsellerPhone);
                cmd.Parameters.AddWithValue("@linkName", collection.linkName);

              
                con.Open();
                cmd.ExecuteNonQuery();
            }

        }

        public void AddEnquiryToDB(ContactUs employee)
        {

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spAddEnquiryToDB", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramFoodName = new SqlParameter();
                paramFoodName.ParameterName = "@Comment";
                paramFoodName.Value = employee.Comment;
                //cmd.Parameters.Add(paramFoodName);
                cmd.Parameters.AddWithValue("@Comment", employee.Comment);


                SqlParameter paramFoodGrpId = new SqlParameter();
                paramFoodGrpId.ParameterName = "@Email";
                paramFoodGrpId.Value = employee.Email;
                //cmd.Parameters.Add(paramFoodGrpId);
                cmd.Parameters.AddWithValue("@Email", employee.Email);


                SqlParameter paramFoodCost = new SqlParameter();
                paramFoodCost.ParameterName = "@FullName";
                paramFoodCost.Value = employee.FullName;
                //cmd.Parameters.Add(paramFoodCost);
                cmd.Parameters.AddWithValue("@FullName", employee.FullName);


                con.Open();
                cmd.ExecuteNonQuery();
            }

        }

        public void DeleteRelatedLinksFromDB(decimal id)
        {

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spDeleteRelatedLinks", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramId = new SqlParameter();
                paramId.ParameterName = "@linkId";
                paramId.Value = id;
                cmd.Parameters.Add(paramId);
                //cmd.Parameters.AddWithValue("@linkId", id);


                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void DeletePhotosFromDB(decimal id)
        {

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spDeletePhotos", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramId = new SqlParameter();
                paramId.ParameterName = "@photoId";
                paramId.Value = id;
                cmd.Parameters.Add(paramId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}
