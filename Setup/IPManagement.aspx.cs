using OCM;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Setup_IPManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static List<IP> GetIP()
    {
        List<IP> lst = new List<IP>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "sharedGetIP";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            IP p = new IP();
            p.Id = dr["Id"].ToString();
            p.Name = dr["IP"].ToString();
            p.Remarks = dr["Remarks"].ToString();
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static List<S_Activity> GetSubActivity()
    {
        List<S_Activity> lst = new List<S_Activity>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "sharedGetSubActivity";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            S_Activity p = new S_Activity();
            p.SubId = dr["S_ActivityId"].ToString();
            p.SubActivity = dr["Sub_Activity"].ToString();
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static List<IPProvince> GetIPProvinceDetail(string Year, string IP)
    {
        List<IPProvince> lst = new List<IPProvince>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "sharedGetIPDetailByProvince";
        com.Parameters.AddWithValue("@IPId", SqlDbType.Int).Value = IP;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            IPProvince p = new IPProvince();
            p.ProvinceID = dr["ProvinceID"].ToString();
            p.ProvinceName = dr["ProvinceEngName"].ToString();
            p.SubActivityId = dr["SubActivityId"].ToString();
            p.chk = Convert.ToBoolean(dr["chk"].ToString());
            p.RwNumbr = dr["rwNumbr"].ToString();
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static string SaveIPDetail(string Name, string Remarks)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            SqlParameter[] p = new SqlParameter[5];
            p[0] = new SqlParameter("@Name", SqlDbType.NVarChar) { Value = Name };
            p[1] = new SqlParameter("@Remarks", SqlDbType.NVarChar) { Value = Remarks };
            p[2] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
            p[3] = new SqlParameter("@InsertedDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
            p[4] = new SqlParameter("@Id", SqlDbType.Int);
            p[4].Direction = ParameterDirection.Output;
            string id = dbT.ExecuteTransStoreProcedureReturn("spPageIPManagement_saveIP", p, true, "@Id");
            dbT.EndTransaction();
            return id;
        }
        catch (Exception)
        {
            dbT.RollBackTransaction();
            throw;
        }
        finally
        {
            dbT.Connection.Close();
            SqlConnection.ClearPool(dbT.Connection);
        }
    }
    [WebMethod]
    public static void SaveIPProvinceD(FormDetails formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            if (formDetails.ActivityArray.Count > 0 && formDetails.ProvinceArray.Count > 0)
            {
                int loop = 1;
                for (int i = 0; i < formDetails.ActivityArray.Count; i++)
                {
                    foreach (IPProvince s in formDetails.ProvinceArray)
                    {
                       
                        SqlParameter[] p = new SqlParameter[5];
                        p[0] = new SqlParameter("@IPId", SqlDbType.Int) { Value = formDetails.IPId };
                        p[1] = new SqlParameter("@SubActivityId", SqlDbType.Int) { Value = formDetails.ActivityArray[i].SubId };
                        p[2] = new SqlParameter("@ProvinceId", SqlDbType.Int) { Value = s.ProvinceID };
                        p[3] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetails.Year };
                        p[4] = new SqlParameter("@LoopId", SqlDbType.Int) { Value = loop };
                        dbT.ExecuteTransStoreProcedure("spPageIPManagement_saveIPProvDetail", p, true);
                        loop++;
                    }
                }


            }
            dbT.EndTransaction();

        }
        catch (Exception)
        {
            dbT.RollBackTransaction();
            throw;
        }
        finally
        {
            dbT.Connection.Close();
            SqlConnection.ClearPool(dbT.Connection);
        }
    }
    public class IP
    {
        public string Name { get; set; }
        public string Id { get; set; }
        public string Remarks { get; set; }
    }
    public class S_Activity
    {
        public string SubActivity { get; set; }
        public string SubId { get; set; }
    }
    public class IPProvince
    {
        public string ProvinceID { get; set; }
        public string ProvinceName { get; set; }
        public bool chk { get; set; }
        public string SubActivityId { get; set; }
        public string RwNumbr { get; set; }

    }
    public class FormDetails
    {
        public string IPId { get; set; }
        public string Year { get; set; }
        public List<S_Activity> ActivityArray { get; set; }
        public List<IPProvince> ProvinceArray { get; set; }

    }

}