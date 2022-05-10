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
    public static List<FormDetail> GetVFUList(string DistrictId, string StartDate,string EndDate)
    {
        List<FormDetail> lst = new List<FormDetail>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "spPageVfusGetVfuContractList";
        com.Parameters.AddWithValue("@DistrictId", SqlDbType.Int).Value = DistrictId;
        com.Parameters.AddWithValue("@ContEndDate", SqlDbType.NVarChar).Value = EndDate;
        com.Parameters.AddWithValue("@ContStartDate", SqlDbType.NVarChar).Value = StartDate;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            FormDetail Dr = new FormDetail();
            Dr.VfuId = dr["VfuId"].ToString();
            Dr.Name = dr["Name"].ToString();
            Dr.FatherName = dr["FName"].ToString();
            Dr.Mobile = dr["Mobile"].ToString();
            Dr.ContractStartDate = dr["ContractStartDate"].ToString();
            Dr.ContractEndDate = dr["ContractEndDate"].ToString();
            Dr.Bank = dr["Bank"].ToString();
            Dr.IsExist = dr["Exist"].ToString();
            Dr.Edit = HttpContext.Current.User.IsInRole("Super User") == true ? true : false;
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SaveDetail(VFUList formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            if (formDetails.VFUlst.Count > 0)
            {
                SqlParameter[] p = new SqlParameter[5];
                p[0] = new SqlParameter("@ContractStartDate", SqlDbType.NVarChar) { Value = formDetails.ContractStartDate };
                p[1] = new SqlParameter("@ContractEndDate", SqlDbType.VarChar) { Value = formDetails.ContractEndDate };
                p[2] = new SqlParameter("@DistrictId", SqlDbType.VarChar) { Value = formDetails.DistrictId };
                p[3] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                p[4] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                dbT.ExecuteTransStoreProcedure("spPageVfusContractExtension_Remove", p, true);


                foreach (FormDetail b in formDetails.VFUlst)
                {
                         p = new SqlParameter[6];
                        p[0] = new SqlParameter("@VFUId", SqlDbType.VarChar) { Value = b.VfuId };
                        p[1] = new SqlParameter("@ContractStartDate", SqlDbType.NVarChar) { Value = formDetails.ContractStartDate };
                        p[2] = new SqlParameter("@ContractEndDate", SqlDbType.VarChar) { Value = formDetails.ContractEndDate };
                        p[3] = new SqlParameter("@DistrictId", SqlDbType.VarChar) { Value = formDetails.DistrictId };
                        p[4] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                        p[5] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };                        
                        dbT.ExecuteTransStoreProcedure("spPageVfusContractExtension_Save", p, true);
                    

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
    public static void DeleteAll(VFUList formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);SqlParameter[] p = new SqlParameter[5];
                p[0] = new SqlParameter("@ContractStartDate", SqlDbType.NVarChar) { Value = formDetails.ContractStartDate };
                p[1] = new SqlParameter("@ContractEndDate", SqlDbType.VarChar) { Value = formDetails.ContractEndDate };
                p[2] = new SqlParameter("@DistrictId", SqlDbType.VarChar) { Value = formDetails.DistrictId };
                p[3] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                p[4] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                dbT.ExecuteTransStoreProcedure("spPageVfusContractExtension_Remove", p, true);            
            

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
        public string VillageName { get; set; }
    }
    public class FormDetail
    {
        public string VfuId { get; set; }
        public string Name { get; set; }
        public string FatherName { get; set; }
        public string Bank { get; set; }
        public string Mobile { get; set; }
        public string BankNumber { get; set; }
        public string ContractStartDate { get; set; }
        public string ContractEndDate { get; set; }
        public string IsExist { get; set; }
        public bool Edit { get; set; }
    }
    public class VFUList{    
        
        public string ContractStartDate { get; set; }
        public string ContractEndDate { get; set; }
        public int DistrictId { get; set; }
        public List<FormDetail> VFUlst{set;get;}

    }
}