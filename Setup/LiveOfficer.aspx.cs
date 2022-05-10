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

        ddlRegion.DataSource =db.SelectRecords( "select * from OCM_Region");
        ddlRegion.DataTextField = "name";
        ddlRegion.DataValueField = "id";
        ddlRegion.DataBind();
        ddlRegion.Items.Insert(0, new ListItem("--Select--", "-1"));
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool SaveOfficer(FormDetail formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
            dbT.BeginTransaction();
            bool flag = false;
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            SqlParameter[] p = new SqlParameter[8];
            p[0] = new SqlParameter("@Name", SqlDbType.NVarChar) { Value = formDetails.Name };
            p[1] = new SqlParameter("@FName", SqlDbType.NVarChar) { Value = formDetails.FatherName };
            p[2] = new SqlParameter("@Gender", SqlDbType.Int) { Value = formDetails.Gender };
            p[3] = new SqlParameter("@ContactNo", SqlDbType.NVarChar) { Value = formDetails.ContactNo };
            p[4] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
            p[5] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
            p[6] = new SqlParameter("@RegionId", SqlDbType.Int) { Value = formDetails.RegionId };
            p[7] = new SqlParameter("@exist", SqlDbType.Bit);
            p[7].Direction = ParameterDirection.Output;
            flag = Convert.ToBoolean(dbT.ExecuteTransStoreProcedureReturn("spPageOfficerSave", p, true, "@exist"));
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
    public static List<FormDetail> GetOfficerLists(string RegionId)
    {
        List<FormDetail> lst = new List<FormDetail>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "spPageOfficerGetList";
        com.Parameters.AddWithValue("@RegionId", SqlDbType.Int).Value = RegionId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            FormDetail p = new FormDetail();
            p.Name = dr["Name"].ToString();
            p.FatherName = dr["FName"].ToString();
            p.ContactNo = dr["ContactNo"].ToString();
            p.OfficerId = dr["OfficerId"].ToString();
            // p.Edit = HttpContext.Current.User.IsInRole("Admin") == true ? true : false;
            p.Edit = true;
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static FormDetail GetOfficerDetailByID(string Id)
    {
        FormDetail p = new FormDetail();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "spPageOfficerGetDetailById";
        com.Parameters.AddWithValue("@Id", SqlDbType.VarChar).Value = Id;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            p.Name = dr["Name"].ToString();
            p.FatherName = dr["FName"].ToString();
            p.Gender = dr["Gender"].ToString();
            p.RegionId = dr["RegionId"].ToString();
            p.ContactNo = dr["ContactNo"].ToString();
            p.OfficerId = dr["OfficerId"].ToString();
        }
        dr.Close();
        con.Close();
        return p;
    }
    [WebMethod]
    public static bool UpdateFormDetail(FormDetail formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
            bool flag = true;
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
            p[6] = new SqlParameter("@RegionId", SqlDbType.VarChar) { Value = formDetails.RegionId };
            p[7] = new SqlParameter("@OfficerId", SqlDbType.VarChar) { Value = formDetails.OfficerId };
            p[8] = new SqlParameter("@exist", SqlDbType.Bit);
            p[8].Direction = ParameterDirection.Output;
            flag = Convert.ToBoolean(dbT.ExecuteTransStoreProcedureReturn("spPageOfficerUpdate", p, true, "@exist"));
            dbT.EndTransaction();
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
    [WebMethod]
    public static bool DeleteOfficer(FormDetail formDetails)
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

    public class FormDetail
    {
        public string OfficerId { get; set; }
        public string Name { get; set; }
        public string FatherName { get; set; }
        public string Gender { get; set; }
        public string RegionId { get; set; }
        public string Province { get; set; }
        public string ContactNo
        {
            get;
            set;
        }
        public bool Edit { get; set; }
    }
}