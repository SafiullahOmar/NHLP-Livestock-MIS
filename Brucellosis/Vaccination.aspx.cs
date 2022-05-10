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
    public static List<VFU> GetVFU(string DistrictID, string Year)
    {
        List<VFU> lst = new List<VFU>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "spPageVaccinationGetVFU";
        com.Parameters.AddWithValue("@District", SqlDbType.Int).Value = DistrictID;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            VFU p = new VFU();
            p.Id = dr["VFUId"].ToString();
            p.Name = dr["Name"].ToString();
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static List<VaccinationD> GetRecords(string DistrictID, string Date, string VFUId)
    {
        List<VaccinationD> lst = new List<VaccinationD>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "spPageVaccination_GetRecords";
        com.Parameters.AddWithValue("@DistrictId", SqlDbType.Int).Value = DistrictID;
        com.Parameters.AddWithValue("@VfuId", SqlDbType.NVarChar).Value = VFUId;
        com.Parameters.AddWithValue("@Date", SqlDbType.NVarChar).Value = Date;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            VaccinationD p = new VaccinationD();
            p.Cattle = dr["Cattle"].ToString();
            p.Date = dr["Vdate"].ToString();
            p.Goat = dr["Goat"].ToString();
            p.Owner = dr["OName"].ToString();
            p.Sheep = dr["Sheep"].ToString();
            p.VFUId = dr["VFUId"].ToString();
            p.Mob = dr["Mob"].ToString();
            if (!string.IsNullOrEmpty(dr["Kochi"].ToString()))
            {
                if (Convert.ToBoolean(dr["Kochi"].ToString()))
                    p.IsKochi = true;
            }
            else
                p.Village = dr["Village"].ToString();

            p.VFUName = dr["Name"].ToString();
            p.Edit = HttpContext.Current.User.IsInRole("Admin") == true ? true : true;
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static string SaveVFUDetail(string Name, string FName, string Mob, string Year, string DistrictId)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            SqlParameter[] p = new SqlParameter[8];
            p[0] = new SqlParameter("@Name", SqlDbType.NVarChar) { Value = Name };
            p[1] = new SqlParameter("@FName", SqlDbType.NVarChar) { Value = FName };
            p[2] = new SqlParameter("@Mob", SqlDbType.NVarChar) { Value = Mob };
            p[3] = new SqlParameter("@Year", SqlDbType.Int) { Value = Year };
            p[4] = new SqlParameter("@DistrictId", SqlDbType.Int) { Value = DistrictId };
            p[5] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
            p[6] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
            p[7] = new SqlParameter("@Id", SqlDbType.VarChar);
            p[7].Direction = ParameterDirection.Output;
            p[7].Size = 50;
            string id = dbT.ExecuteTransStoreProcedureReturn("spPageVaccination_SaveVFU", p, true, "@Id");
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
    public static void SaveVaccination(FormDetails formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            if (formDetails.Vaccinelst.Count > 0)
            {
                foreach (VaccinationD v in formDetails.Vaccinelst)
                {

                    SqlParameter[] p = new SqlParameter[10];
                    p[0] = new SqlParameter("@VFUId", SqlDbType.VarChar) { Value = formDetails.VFUId };
                    p[1] = new SqlParameter("@VDate", SqlDbType.NVarChar) { Value = v.Date };
                    p[2] = new SqlParameter("@Village", SqlDbType.NVarChar) { Value = v.Village };
                    p[3] = new SqlParameter("@Owner", SqlDbType.NVarChar) { Value = v.Owner };
                    p[4] = new SqlParameter("@Sheep", SqlDbType.Float) { Value = v.Sheep };

                    p[5] = new SqlParameter("@Goat", SqlDbType.Float) { Value = v.Goat };
                    p[6] = new SqlParameter("@Cattle", SqlDbType.Float) { Value = v.Cattle };
                    p[7] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                    p[8] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                    p[9] = new SqlParameter("@ContactNo", SqlDbType.NVarChar) { Value = v.Mob };
                    dbT.ExecuteTransStoreProcedure("spPageVaccination_SaveVaccinationD", p, true);
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
    public static void DeleteRecord(VaccinationD formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
            //if (HttpContext.Current.User.IsInRole("Admin"))
            //{
            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            SqlParameter[] p = new SqlParameter[4];
            p[0] = new SqlParameter("@VFUId", SqlDbType.VarChar) { Value = formDetails.VFUId };
            p[1] = new SqlParameter("@Village", SqlDbType.VarChar) { Value = formDetails.Village };
            p[2] = new SqlParameter("@OName ", SqlDbType.VarChar) { Value = formDetails.Owner };
            p[3] = new SqlParameter("@Date ", SqlDbType.VarChar) { Value = formDetails.Date };
            dbT.ExecuteTransStoreProcedure("spPageVaccination_Delete", p, true);
            dbT.EndTransaction();

            // }
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
    public class VFU
    {
        public string Name { get; set; }
        public string Id { get; set; }
    }
    public class VaccinationD
    {
        public string Date { get; set; }
        public string Village { get; set; }
        public string Owner { get; set; }
        public string Sheep { get; set; }
        public string Goat { get; set; }
        public string Cattle { get; set; }
        public string Mob { get; set; }
        public bool IsKochi { get; set; }
        public string VFUId { get; set; }
        public string VFUName { get; set; }
        public bool Edit { get; set; }

    }
    public class FormDetails
    {
        public string VFUId { get; set; }
        public string DistrictId { get; set; }
        public List<VaccinationD> Vaccinelst { get; set; }

    }

}