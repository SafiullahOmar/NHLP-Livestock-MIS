using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OCM;
using System.Web.Services;
using System.Web.Script.Services;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;
using System.IO;
using System.Configuration;
using System.Web.UI.HtmlControls;

public partial class BenefImport : System.Web.UI.Page
{
    OCM_DbGeneral db = new OCM_DbGeneral();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            fillDdll();

    }
    private void fillDdll()
    {

        ddlProvince.DataSource = OCM_UserInfo.GetUserProvinces();
        ddlProvince.DataTextField = "ProvinceEngName";
        ddlProvince.DataValueField = "ProvinceID";
        ddlProvince.DataBind();
        ddlProvince.Items.Insert(0, new ListItem("--Select--", "-1"));
    }
    [WebMethod]
    public static List<District> GetDistrict(string ProvinceID)
    {
        List<District> lst = new List<District>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "SharedGetDistrict";
        com.Parameters.AddWithValue("@ProvinceId", SqlDbType.Int).Value = ProvinceID;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            District Dr = new District();
            Dr.DistrictId = dr["DistrictID"].ToString();
            Dr.DistrictName = dr["DistrictEngName"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static List<Village> GetVillage(string DistrictID, string Year, string VFUId)
    {
        List<Village> lst = new List<Village>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "spPageInputs_GetVFUVillage";
        com.Parameters.AddWithValue("@DistrictId", SqlDbType.Int).Value = DistrictID;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@VFUId", SqlDbType.VarChar).Value = VFUId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Village v = new Village();
            v.Name = dr["Village"].ToString();
            lst.Add(v);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static List<VFUs> GetVFUs(string DistrictID, string Year)
    {
        List<VFUs> lst = new List<VFUs>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "sharedGetAllVFUByDistrictId";
        com.Parameters.AddWithValue("@DistrictId", SqlDbType.Int).Value = DistrictID;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            VFUs Dr = new VFUs();
            Dr.Id = dr["VfuId"].ToString();
            Dr.Name = dr["MVFU"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static List<Members> GetMemberRecords(string Year, string DistrictID, string VfuId, string Village, string PckgId)
    {
        List<Members> lst = new List<Members>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "spPageInputs_GetMembers";
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@PackageId", SqlDbType.Int).Value = PckgId;
        com.Parameters.AddWithValue("@DistrictId", SqlDbType.Int).Value = DistrictID;
        com.Parameters.AddWithValue("@VFUId", SqlDbType.Int).Value = VfuId;
        com.Parameters.AddWithValue("@Village", SqlDbType.Int).Value = Village;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Members Dr = new Members();
            Dr.FName = dr["FName"].ToString();
            Dr.Name = dr["Name"].ToString();
            Dr.MemberId = dr["BenefId"].ToString();
            Dr.Position = dr["Position"].ToString();
            Dr.VFUId = dr["VfuId"].ToString();
            Dr.IsExist = dr["Exist"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SavePackages(_Form formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);

            SqlParameter[] q = new SqlParameter[4];
            q[0] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };
            q[1] = new SqlParameter("@PackId", SqlDbType.Int) { Value = formDetail.PackageId };
            q[2] = new SqlParameter("@VFUId", SqlDbType.VarChar) { Value = formDetail.VFUId };
            q[3] = new SqlParameter("@Village", SqlDbType.NVarChar) { Value = formDetail.Village };
            dbT.ExecuteTransStoreProcedure("spPageInputs_Delete", q, true);

            if (formDetail._memberlst.Count > 0)
            {
                if (formDetail.PackageId == "3")
                {
                    foreach (Members b in formDetail._memberlst)
                    {
                        SqlParameter[] p = new SqlParameter[7];
                        p[0] = new SqlParameter("@BenefId", SqlDbType.VarChar) { Value = b.MemberId };
                        p[1] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };
                        p[2] = new SqlParameter("@PackId", SqlDbType.Int) { Value = formDetail.PackageId };
                        p[3] = new SqlParameter("@VFUId", SqlDbType.VarChar) { Value = formDetail.VFUId };
                        p[4] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                        p[5] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                        p[6] = new SqlParameter("@Village", SqlDbType.NVarChar) { Value = formDetail.Village };
                        dbT.ExecuteTransStoreProcedure("spPageInputs_SavePackages", p, true);
                        break;

                    }
                }
                else
                {
                    foreach (Members b in formDetail._memberlst)
                    {

                        SqlParameter[] p = new SqlParameter[7];
                        p[0] = new SqlParameter("@BenefId", SqlDbType.VarChar) { Value = b.MemberId };
                        p[1] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };
                        p[2] = new SqlParameter("@PackId", SqlDbType.Int) { Value = formDetail.PackageId };
                        p[3] = new SqlParameter("@VFUId", SqlDbType.VarChar) { Value = formDetail.VFUId };
                        p[4] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                        p[5] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                        p[6] = new SqlParameter("@Village", SqlDbType.NVarChar) { Value = formDetail.Village };
                        dbT.ExecuteTransStoreProcedure("spPageInputs_SavePackages", p, true);


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
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void DeletePackages(_Form formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);

            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetails.Year };
            p[1] = new SqlParameter("@PackId", SqlDbType.Int) { Value = formDetails.PackageId };
            p[2] = new SqlParameter("@VFUId", SqlDbType.VarChar) { Value = formDetails.VFUId };
            p[3] = new SqlParameter("@Village", SqlDbType.NVarChar) { Value = formDetails.Village };
            dbT.ExecuteTransStoreProcedure("spPageInputs_Delete", p, true);

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
    public class District
    {
        public string DistrictId { get; set; }
        public string DistrictName { get; set; }

    }
    public class Village
    {
        public string Name { get; set; }

    }
    public class VFUs
    {
        public string Name { get; set; }
        public string Id { get; set; }
    }
    public class Members
    {
        public string MemberId { get; set; }
        public string Name { get; set; }
        public string FName { get; set; }
        public string Position { get; set; }
        public string VFUId { get; set; }
        public string IsExist { get; set; }
    }
    public class _Form
    {
        public string Year { get; set; }
        public string PackageId { get; set; }
        public string Village { get; set; }
        public string VFUId { get; set; }
        public List<Members> _memberlst { get; set; }
    }
}