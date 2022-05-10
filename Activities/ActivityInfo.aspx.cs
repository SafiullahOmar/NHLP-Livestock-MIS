
using OCM;
using System;
using System.Web.ApplicationServices;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Configuration;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Activities_ActivityInfo : System.Web.UI.Page
{
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
    public static List<RegionalOfficers> GetRegionals(string ProvinceId)
    {
        List<RegionalOfficers> lst = new List<RegionalOfficers>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "sharedGetLiveOfficerByProvinceId";
        com.Parameters.AddWithValue("@ProvinceId", SqlDbType.Int).Value = ProvinceId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            RegionalOfficers Dr = new RegionalOfficers();
            Dr.Id = dr["OfficerId"].ToString();
            Dr.Name = dr["Name"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static List<SActivity> GetSubActivity()
    {
        List<SActivity> lst = new List<SActivity>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "sharedGetSubActivity";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            SActivity Dr = new SActivity();
            Dr.SActivityId = dr["S_ActivityId"].ToString();
            Dr.SActivityName = dr["Sub_Activity"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static List<IP> GetIPByProvince(string Year, string ProvinceId, string SAct)
    {
        List<IP> lst = new List<IP>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "sharedGetIPByProvince";
        com.Parameters.AddWithValue("@ProvinceId", SqlDbType.Int).Value = ProvinceId;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@SubActivityId", SqlDbType.Int).Value = SAct;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            IP Dr = new IP();
            Dr.Id = dr["Id"].ToString();
            Dr.Name = dr["IP"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static List<BenefActivityD> GetBenefActivityDList(string DistrictId, string Village, string IPId, string S_ActivityId, string Year)
    {
        List<BenefActivityD> lst = new List<BenefActivityD>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "spPageActivityInfo_getBenfActivityDetail";
        com.Parameters.AddWithValue("@DistrictId", SqlDbType.Int).Value = DistrictId;
        com.Parameters.AddWithValue("@Village", SqlDbType.NVarChar).Value = Village;
        com.Parameters.AddWithValue("@IPId", SqlDbType.Int).Value = IPId;
        com.Parameters.AddWithValue("@S_ActivityId", SqlDbType.Int).Value = S_ActivityId;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            BenefActivityD Dr = new BenefActivityD();
            Dr.BenefId = dr["BenefId"].ToString();
            Dr.Fin_S = dr["F_S"].ToString();
            Dr.Inc_S = dr["Inc_Source"].ToString();
            Dr.Sec_S = dr["Sec_S"].ToString();
            Dr.Name = dr["Name"].ToString();
            Dr.FName = dr["FName"].ToString();
            Dr.Mob = dr["Mobile"].ToString();
            Dr.IsExist = dr["IsExist"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SaveDetail(BenefActivityDForm formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            if (formDetails.BenefList.Count > 0)
            {
                int loop = 0;
                foreach (BenefActivityD b in formDetails.BenefList)
                {
                    if (formDetails.SActivity == "6" || formDetails.SActivity == "7" || formDetails.SActivity == "8")
                    {
                        loop++;
                        SqlParameter[] p = new SqlParameter[18];
                        p[0] = new SqlParameter("@BenefId", SqlDbType.VarChar) { Value = b.BenefId };
                        p[1] = new SqlParameter("@F_S", SqlDbType.NVarChar) { Value = b.Fin_S };
                        p[2] = new SqlParameter("@Sec_S", SqlDbType.VarChar) { Value = b.Sec_S };
                        p[3] = new SqlParameter("@Inc_Source", SqlDbType.VarChar) { Value = b.Inc_S };
                        p[4] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                        p[5] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                        p[6] = new SqlParameter("@S_ActivityId", SqlDbType.Int) { Value = formDetails.SActivity };
                        p[7] = new SqlParameter("@IPId", SqlDbType.Int) { Value = formDetails.IP };
                        p[8] = new SqlParameter("@NoOfPackg", SqlDbType.Float) { Value = 1 };
                        p[9] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetails.Year };
                        p[10] = new SqlParameter("@SubSubActType", SqlDbType.NVarChar) { Value = formDetails.SubSubActivityType };
                        p[11] = new SqlParameter("@Village", SqlDbType.NVarChar) { Value = formDetails.Village };
                        p[12] = new SqlParameter("@Loop", SqlDbType.Int) { Value = loop };
                        p[13] = new SqlParameter("@FcAmount", SqlDbType.Float) { Value = formDetails.FcAmount };
                        p[14] = new SqlParameter("@PkgAmount", SqlDbType.Float) { Value = formDetails.PkgAmount };
                        p[15] = new SqlParameter("@Percentage", SqlDbType.Float) { Value = formDetails.Percentage };
                        p[16] = new SqlParameter("@OfficerId", SqlDbType.NVarChar) { Value = formDetails.OfficerId };
                        p[17] = new SqlParameter("@District", SqlDbType.Int) { Value = formDetails.DistrictId };
                        dbT.ExecuteTransStoreProcedure("spPageActivityInfo_SaveForm", p, true);
                    }
                    else
                    {
                        loop++;
                        SqlParameter[] p = new SqlParameter[14];
                        p[0] = new SqlParameter("@BenefId", SqlDbType.VarChar) { Value = b.BenefId };
                        p[1] = new SqlParameter("@F_S", SqlDbType.NVarChar) { Value = b.Fin_S };
                        p[2] = new SqlParameter("@Sec_S", SqlDbType.VarChar) { Value = b.Sec_S };
                        p[3] = new SqlParameter("@Inc_Source", SqlDbType.VarChar) { Value = b.Inc_S };
                        p[4] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                        p[5] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                        p[6] = new SqlParameter("@S_ActivityId", SqlDbType.Int) { Value = formDetails.SActivity };
                        p[7] = new SqlParameter("@IPId", SqlDbType.Int) { Value = formDetails.IP };
                        p[8] = new SqlParameter("@NoOfPackg", SqlDbType.Float) { Value = 1 };
                        p[9] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetails.Year };
                        p[10] = new SqlParameter("@SubSubActType", SqlDbType.NVarChar) { Value = formDetails.SubSubActivityType };
                        p[11] = new SqlParameter("@Village", SqlDbType.NVarChar) { Value = formDetails.Village };
                        p[12] = new SqlParameter("@Loop", SqlDbType.Int) { Value = loop };
                        p[13] = new SqlParameter("@District", SqlDbType.Int) { Value = formDetails.DistrictId };
                        dbT.ExecuteTransStoreProcedure("spPageActivityInfo_SaveForm", p, true);
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
    public static void ActivityInfoDelete(BenefActivityDForm formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            SqlParameter[] p = new SqlParameter[7];

            p[0] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
            p[1] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
            p[2] = new SqlParameter("@S_ActivityId", SqlDbType.Int) { Value = formDetails.SActivity };
            p[3] = new SqlParameter("@IPId", SqlDbType.Int) { Value = formDetails.IP };
            p[4] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetails.Year };
            p[5] = new SqlParameter("@Village", SqlDbType.NVarChar) { Value = formDetails.Village };
            p[6] = new SqlParameter("@DistrictId", SqlDbType.Int) { Value = formDetails.DistrictId };
            dbT.ExecuteTransStoreProcedure("spPageActivityInfo_DeleteAll", p, true);
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
    public class RegionalOfficers
    {
        public string Id { get; set; }
        public string Name { get; set; }

    }
    public class SActivity
    {
        public string SActivityId { get; set; }
        public string SActivityName { get; set; }
    }
    public class IP
    {
        public string Id { get; set; }
        public string Name { get; set; }
    }
    public class Village
    {
        public string VillageName { get; set; }
    }
    public class BenefActivityD
    {
        public string BenefId { get; set; }
        public string Fin_S { get; set; }
        public string Sec_S { get; set; }
        public string Inc_S { get; set; }
        public string Name { get; set; }
        public string FName { get; set; }
        public string Mob { get; set; }
        public string IsExist { get; set; }

    }
    public class BenefActivityDForm
    {
        public string IP { get; set; }
        public string Year { get; set; }
        public string SActivity { get; set; }
        public string DistrictId { get; set; }
        public string Village { get; set; }
        public string SubSubActivityType { get; set; }
        public string FcAmount { get; set; }
        public string PkgAmount { get; set; }
        public string Percentage { get; set; }
        public string OfficerId { get; set; }
        public List<BenefActivityD> BenefList { get; set; }
    }
}