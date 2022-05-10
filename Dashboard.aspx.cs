using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static MultiQueryResult GetAnimalProduction(string proid, string year)
    {
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        List<AnimalProduction> lst = new List<AnimalProduction>();
        MultiQueryResult GResult = new MultiQueryResult();
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageDashboard";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = year;
        com.Parameters.AddWithValue("@ProvinceId", SqlDbType.Int).Value = proid;
        con.Open();
        using (SqlDataReader dr = com.ExecuteReader())
        {
            while (dr.Read())
            {
                AnimalProduction A = new AnimalProduction()
                {
                    Province = dr["ProvinceEngName"].ToString(),
                    Poultry30 = float.Parse(dr["P30"].ToString()),
                    Poultry100 = float.Parse(dr["P100"].ToString()),
                    Poultry500 = float.Parse(dr["P500"].ToString()),
                    Poultry5000 = float.Parse(dr["P5000"].ToString()),
                    Ponds = float.Parse(dr["Ponds"].ToString()),
                    Hatchry = float.Parse(dr["Hry"].ToString())
                };
                lst.Add(A);
            }
            int ReadCnt = 0;
            while (dr.NextResult()) {
                if (ReadCnt == 0)
                {
                    List<Extenion> Exlst = new List<Extenion>();
                    while (dr.Read())
                    {
                        Extenion Ex = new Extenion();
                        Ex.Female = dr["Female"].ToString();
                        Ex.Male = dr["Male"].ToString();
                        Ex.Province = dr["ProvinceEngName"].ToString();
                        Ex.Members = dr["mem"].ToString();
                        Exlst.Add(Ex);
                        ReadCnt++;
                    }

                    GResult.Extensionlst = Exlst;
                }
                else if (ReadCnt == 1)
                {
                    List<AnimalHealth> AnimalHlst = new List<AnimalHealth>();
                    while (dr.Read())
                    {
                        AnimalHealth P = new AnimalHealth();
                        P.REV1 = dr["REV1"].ToString();
                        P.S19 = dr["S19"].ToString();
                        P.Province = dr["ProvinceEngName"].ToString();
                        AnimalHlst.Add(P);
                    }
                    GResult.AnimalHlst = AnimalHlst;
                    ReadCnt++;
                }
            }
        }
        GResult.AnimalPlst = lst;   
        con.Close();
        return GResult;
    }
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<ActivityInfo> GetActivityInfo( string year)
    {
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        List<ActivityInfo> lst = new List<ActivityInfo>();
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageDashboard_GetActivityNumbers";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = year;
        con.Open();
        using (SqlDataReader dr = com.ExecuteReader())
        {
            while (dr.Read()) {
                lst.Add(new ActivityInfo { Activity = dr["Sub_Activity"].ToString(), Number = Convert.ToDouble(dr["cnt"].ToString()), rowId = Convert.ToInt16(dr["S_ActivityId"].ToString()) });
            }
        }

        return lst;
    }
    public class AnimalProduction
    {
        public string Province { get; set; }
        public float Poultry100 { get; set; }
        public float Poultry30 { get; set; }
        public float Poultry500 { get; set; }
        public float Poultry5000 { get; set; }
        public float Hatchry { get; set; }
        public float Ponds { get; set; }
    }
    public class Extenion {
        public string Province { get; set; }
        public string Male { get; set; }
        public string Female { get; set; }
        public string Members { get; set; }

    }

    public class AnimalHealth {
        public string REV1 { get; set; }
        public string S19 { get; set; }
        public string Province { get; set; }
    }
    public class MultiQueryResult {
        public List<AnimalProduction> AnimalPlst { get; set; }
        public List<AnimalHealth> AnimalHlst { get; set; }
        public List<Extenion> Extensionlst { get; set; }
    }
    public class ActivityInfo {
        public string Activity { get; set; }
        public double Number { get; set; }
        public int rowId { get; set; }
    }
}