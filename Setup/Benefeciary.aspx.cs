using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OCM;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.Web.Script.Services;
using System.Web.Security;

public partial class Setup_Benefeciary : System.Web.UI.Page
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
    public static List<Village> GetVillage(string DistrictID)
    {
        List<Village> lst = new List<Village>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "SharedGetVillageByDistrict";
        com.Parameters.AddWithValue("@DistrictId", SqlDbType.Int).Value = DistrictID;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Village Dr = new Village();
            Dr.VillageName = dr["Village"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool SaveBenef(FormDetail formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
            dbT.BeginTransaction();
            bool flag = false;
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            SqlParameter[] p = new SqlParameter[9];
            p[0] = new SqlParameter("@Name", SqlDbType.NVarChar) { Value = formDetails.Name };
            p[1] = new SqlParameter("@FName", SqlDbType.NVarChar) { Value = formDetails.FatherName };
            p[2] = new SqlParameter("@Gender", SqlDbType.Int) { Value = formDetails.Gender };
            p[3] = new SqlParameter("@ContactNo", SqlDbType.NVarChar) { Value = formDetails.ContactNo };
            p[4] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
            p[5] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
            p[6] = new SqlParameter("@DistrictId", SqlDbType.Int) { Value = formDetails.DistrictID };
            p[7] = new SqlParameter("@Village", SqlDbType.NVarChar) { Value = formDetails.Village };
            p[8] = new SqlParameter("@exist", SqlDbType.Bit);
            p[8].Direction = ParameterDirection.Output;
            flag = Convert.ToBoolean(dbT.ExecuteTransStoreProcedureReturn("spPageBenefeciarySave", p, true, "@exist"));
            if (flag == true)
            {
                dbT.RollBackTransaction();
                return flag;
            }

            dbT.EndTransaction();
            return flag;


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
    public static List<FormDetail> GetBenefLists(string DistrictId, string Village)
    {
        List<FormDetail> lst = new List<FormDetail>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "spPageBenefeciaryGetBenefList";
        com.Parameters.AddWithValue("@DistrictId", SqlDbType.Int).Value = DistrictId;
        com.Parameters.AddWithValue("@Village", SqlDbType.VarChar).Value = Village;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            FormDetail p = new FormDetail();
            p.Name = dr["Name"].ToString();
            p.FatherName = dr["FName"].ToString();
            p.District = dr["DistrictEngName"].ToString();
            p.ContactNo = dr["Mobile"].ToString();
            p.BenefId = dr["BenefId"].ToString();
           // p.Edit = HttpContext.Current.User.IsInRole("Admin") == true ? true : false;
            p.Edit = true;
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static FormDetail GetBenfDetailByID(string Id)
    {
        FormDetail p = new FormDetail();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "spPageBenefeciaryGetDetailById";
        com.Parameters.AddWithValue("@Id", SqlDbType.VarChar).Value = Id;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            p.Name = dr["Name"].ToString();
            p.FatherName = dr["FName"].ToString();
            p.Gender = dr["Gender"].ToString();
            p.DistrictID = dr["DistrictID"].ToString();
            p.ContactNo = dr["Mobile"].ToString();
            p.BenefId = dr["BenefId"].ToString();
            p.Village = dr["Village"].ToString();
        }
        dr.Close();
        con.Close();
        return p;
    }
    [WebMethod]
    public static void UpdateFormDetail(FormDetail formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
            //if (HttpContext.Current.User.IsInRole("Admin"))
            //{
                dbT.BeginTransaction();
                MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
                SqlParameter[] p = new SqlParameter[9];
                p[0] = new SqlParameter("@Name", SqlDbType.NVarChar) { Value = formDetails.Name };
                p[1] = new SqlParameter("@FName", SqlDbType.NVarChar) { Value = formDetails.FatherName };
                p[2] = new SqlParameter("@Gender", SqlDbType.Int) { Value = formDetails.Gender };
                p[3] = new SqlParameter("@ContactNo", SqlDbType.NVarChar) { Value = formDetails.ContactNo };
                p[4] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                p[5] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                p[6] = new SqlParameter("@DistrictId", SqlDbType.VarChar) { Value = formDetails.DistrictID };
                p[7] = new SqlParameter("@Village", SqlDbType.NVarChar) { Value = formDetails.Village };
                p[8] = new SqlParameter("@Id", SqlDbType.VarChar) { Value = formDetails.BenefId };
                dbT.ExecuteTransStoreProcedure("spPageBenefeciaryUpdate", p, true);
                dbT.EndTransaction();
            //}
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
    public static bool DeleteFarmer(FormDetail formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
          bool flag = false;
        //    if (HttpContext.Current.User.IsInRole("Admin"))
        //    {
        //        dbT.BeginTransaction();
        //        MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
        //        SqlParameter[] p = new SqlParameter[2];
        //        p[0] = new SqlParameter("@FarmerId", SqlDbType.VarChar) { Value = formDetails.BenefId };
        //        p[1] = new SqlParameter("@exist", SqlDbType.Bit);
        //        p[1].Direction = ParameterDirection.Output;
        //        flag = Convert.ToBoolean(dbT.ExecuteTransStoreProcedureReturn("spPageFarmerDelete", p, true, "@exist"));
        //        if (flag == true)
        //        {
        //            dbT.RollBackTransaction();
        //            return flag;
        //        }

        //        dbT.EndTransaction();

            //}
            return flag;
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
        public string VillageName { get; set; }
    }
    public class FormDetail
    {
        public string BenefId { get; set; }
        public string Name { get; set; }
        public string FatherName { get; set; }
        public string Gender { get; set; }
        public string ProvinceID { get; set; }
        public string DistrictID { get; set; }
        public string Province { get; set; }
        public string District { get; set; }
        public string ContactNo
        {
            get;
            set;
        }
        public string Village { get; set; }
        public bool Edit { get; set; }
    }
}