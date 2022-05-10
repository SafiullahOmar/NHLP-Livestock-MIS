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
using System.Data.OleDb;
using System.Configuration;
using System.Web.UI.HtmlControls;
using System.Globalization;

public partial class BenefImport : System.Web.UI.Page
{
    OCM_DbGeneral db = new OCM_DbGeneral();
    public SqlConnection con2 = new SqlConnection();
    public SqlCommand cmd2 = new SqlCommand();
    public SqlDataAdapter da2 = new SqlDataAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            fillDdll();

    }
    protected void Page_PreRender(object sender, EventArgs e)
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
    private int CountFiles()
    {
        DirectoryInfo dir = new DirectoryInfo(MapPath("~/ExcelDataImport") + "/" + ddlProvince.SelectedItem.Text.Replace(" ", string.Empty) + "/" + ddlDistrict.SelectedItem.Text.Replace(" ", string.Empty));
        FileInfo[] fi = dir.GetFiles();
        int count = fi.Length;
        ++count;
        return count;
    }
    private DataTable getDataFromXLS(string strFilePath)
    {
        try
        {
            //string strConnectionString = string.Empty;
            //strConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;" + "Data Source=" + strFilePath + ";" + "Extended Properties=Excel 8.0;";
            //OleDbConnection cnCSV = new OleDbConnection(strConnectionString);
            //cnCSV.Open();
            //OleDbCommand cmdSelect = new OleDbCommand(@"SELECT * FROM [Sheet1$] where Name is not null AND FName is not null AND Village is not null AND Gender is not null", cnCSV);
            //OleDbDataAdapter daCSV = new OleDbDataAdapter();
            //daCSV.SelectCommand = cmdSelect;
            //DataTable dtCSV = new DataTable();
            //daCSV.Fill(dtCSV);
            //cnCSV.Close();
            //daCSV = null;
            DataTable dtCSV = ExcelOprations.GetDataTableFromExcel(strFilePath, true);
            return dtCSV;

        }
        catch (Exception ex)
        {
            throw new Exception("Unable to Import");
        }
        finally { }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            try
            {
                var supportedTypes = new[] { "xlsx" };
                var fileExt = System.IO.Path.GetExtension(FileUpload1.FileName).Substring(1);
                if (!supportedTypes.Contains(fileExt))
                {
                    lblMsg.Text = "File is not supported";
                    lblMsg.Attributes.Add("class", "alert alert-danger round alert-icon-left alert-arrow-left alert-dismissible fade in mb-2 hideit");
                    lblMsg.Style.Add("width", "500px");
                    return;
                }

                string path = "~/ExcelDataImport";
                if (!Directory.Exists(MapPath(path)))
                    Directory.CreateDirectory(MapPath(path));
                if (!Directory.Exists(MapPath(path) + "/" + ddlProvince.SelectedItem.Text.Replace(" ", string.Empty)))
                    Directory.CreateDirectory(MapPath(path) + "/" + ddlProvince.SelectedItem.Text.Replace(" ", string.Empty));
                if (!Directory.Exists(MapPath(path) + "/" + ddlProvince.SelectedItem.Text.Replace(" ", string.Empty) + "/" + ddlDistrict.SelectedItem.Text.Replace(" ", string.Empty)))
                    Directory.CreateDirectory(MapPath(path) + "/" + ddlProvince.SelectedItem.Text.Replace(" ", string.Empty) + "/" + ddlDistrict.SelectedItem.Text.Replace(" ", string.Empty));

                string fullPath = path + "/" + ddlProvince.SelectedItem.Text.Replace(" ", string.Empty) + "/" + ddlDistrict.SelectedItem.Text.Replace(" ", string.Empty);
                string filename = fullPath + CountFiles().ToString() + Path.GetExtension(FileUpload1.FileName);
                FileUpload1.SaveAs(MapPath(filename));
                DataTable dt = getDataFromXLS(MapPath(filename));
                dt = RemoveDuplicatesRecords(dt);
                DataRow[] dtRows = dt.Select("Date is null or Village is  null or  Owner is  null or Mob is null or Sheep is null or Goat is null or Cattle is null");
                HtmlGenericControl div = new HtmlGenericControl();
                div.Style.Add(HtmlTextWriterStyle.Direction, "ltr");
                HtmlTable tblToExport = HTMLTable("100", 1, "black");
                tblToExport.Style.Add(HtmlTextWriterStyle.Direction, "ltr");
                HtmlTableRow title = new HtmlTableRow();
                title.Cells.Add(Cell("Please correct the mentioned  record with below Name", "tableTitle", 4, "center"));
                tblToExport.Rows.Add(title);
                bool ReturnToClient = false;
                foreach (DataRow r in dtRows)
                {
                    ReturnToClient = true;
                    //header
                    HtmlTableRow headerRow = new HtmlTableRow();

                    headerRow.Cells.Add(Cell(r["Date"].ToString(), "tableHeader", 4, "center"));
                    tblToExport.Rows.Add(headerRow);
                }
                if (ReturnToClient == true)
                {
                    div.Controls.Add(tblToExport);
                    Response.Clear();
                    Response.Buffer = true;

                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("content-disposition", "attachment;filename=UserReport.xls");
                    Response.Charset = "utf-8";
                    //this.EnableViewState = false;

                    System.IO.StringWriter sw = new System.IO.StringWriter();
                    System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);
                    //titleTable.RenderControl(htw);
                    div.RenderControl(htw);
                    //Response.OutputStream.Write(new byte[] { 0xef, 0xbb, 0xbf }, 0, 3);
                    Response.Write(sw.ToString());
                    Response.End();
                }
                else
                {
                    db.BeginTransaction();
                    int count = 0;
                    foreach (DataRow rw in dt.Rows)
                    {
                        string village,date;

                        MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
                        if (rw["Village"].ToString().ToLower() == "k")
                            village = "kochi";
                        else
                            village = rw["Village"].ToString();


                        DateTime dDate;
                        string[] formats = { "M/d/yyyy", "d/M/yyyy", "M-d-yyyy", "d-M-yyyy", "d-MMM-yy", "d-MMMM-yyyy", };
                        if (DateTime.TryParseExact(rw["Date"].ToString(), formats, CultureInfo.InvariantCulture, DateTimeStyles.None, out dDate))
                            date = dDate.ToString("MM/dd/yyyy");
                        else {
                            db.RollBackTransaction();
                            lblMsg.Text = " Excel file has some invalid Date Format which is NOT compatiable to the system , please make it correct";
                            lblMsg.Attributes.Add("class", "alert alert-warning round alert-icon-left alert-arrow-left alert-dismissible fade in mb-2 hideit");
                            return;
                        }

                        //string s = rw["Date"].ToString();
                        //if (DateTime.TryParseExact(rw["Date"].ToString(), out dDate))
                        //{
                        //    date = dDate.ToString("MM/dd/yyyy");
                        //}


                        SqlParameter[] p = new SqlParameter[10];
                        p[0] = new SqlParameter("@Sheep", SqlDbType.NVarChar) { Value = rw["Sheep"] };
                        p[1] = new SqlParameter("@Goat", SqlDbType.NVarChar) { Value = rw["Goat"] };
                        p[2] = new SqlParameter("@Cattle", SqlDbType.Int) { Value = rw["Cattle"] };
                        p[3] = new SqlParameter("@ContactNo", SqlDbType.NVarChar) { Value = rw["Mob"] };
                        p[4] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                        p[5] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                        p[6] = new SqlParameter("@Village", SqlDbType.NVarChar) { Value = village };
                        p[7] = new SqlParameter("@Owner", SqlDbType.NVarChar) { Value = rw["Owner"] };
                        p[8] = new SqlParameter("@VFUId", SqlDbType.NVarChar) { Value = ddlVFU.SelectedValue };
                        p[9] = new SqlParameter("@VDate", SqlDbType.NVarChar) { Value =rw["Date"] };
                        db.ExecuteTransStoreProcedure("spPageVaccination_SaveVaccinationD", p, true);
                        count++;

                    }
                    db.EndTransaction();
                    lblMsg.Text = count.ToString() + " Benefeciaries Information has been Added into system.";
                    lblMsg.Attributes.Add("class", "alert alert-success round alert-icon-left alert-arrow-left alert-dismissible fade in mb-2 hideit");
                    lblMsg.Style.Add("width", "500px");
                }
            }
            catch (Exception)
            {
                db.RollBackTransaction();
                throw;
            }
            finally
            {
                db.Connection.Close();
                SqlConnection.ClearPool(db.Connection);
            }
        }

    }
    private DataTable RemoveDuplicatesRecords(DataTable dt)
    {
        //Returns just 5 unique rows
        var UniqueRows = dt.AsEnumerable().Distinct(DataRowComparer.Default);
        DataTable dt2 = UniqueRows.CopyToDataTable();
        return dt2;
    }
    private HtmlTable HTMLTable(string percentWidth, int borderWidth, string borderColor)
    {
        HtmlTable tbl = new HtmlTable();
        tbl.Width = percentWidth;
        tbl.Border = borderWidth;
        tbl.BorderColor = borderColor;
        return tbl;
    }
    private HtmlTableCell Cell(string innerHtml, string cssClass)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Attributes.Add("class", cssClass);
        return c;
    }
    private HtmlTableCell Cell(string innerHtml, string cssClass, string textAlign)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Style.Add(HtmlTextWriterStyle.TextAlign, textAlign);
        if (textAlign.ToLower() == "center")
            c.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");
        c.Attributes.Add("class", cssClass);
        return c;
    }
    private HtmlTableCell Cell(string innerHtml, string cssClass, int colSpan)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Attributes.Add("class", cssClass);
        c.ColSpan = colSpan;
        return c;
    }
    private HtmlTableCell Cell(string innerHtml, string cssClass, int colSpan, string textAlign)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Attributes.Add("class", cssClass);
        c.ColSpan = colSpan;
        c.Style.Add(HtmlTextWriterStyle.TextAlign, textAlign);
        if (textAlign.ToLower() == "center")
            c.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");
        return c;
    }
    private HtmlTableCell Cell(string innerHtml, string cssClass, int colSpan, int rowSpan)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Attributes.Add("class", cssClass);
        c.ColSpan = colSpan;
        c.RowSpan = rowSpan;
        return c;
    }
    private HtmlTableCell CellRowSpan(string innerHtml, string cssClass, int rowSpan)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Attributes.Add("class", cssClass);
        c.RowSpan = rowSpan;
        return c;
    }
    private HtmlTableCell CellRowSpan(string innerHtml, string cssClass, int rowSpan, string textAlign)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Attributes.Add("class", cssClass);
        c.RowSpan = rowSpan;
        c.Style.Add(HtmlTextWriterStyle.TextAlign, textAlign);
        if (textAlign.ToLower() == "center")
            c.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");
        return c;
    }
    public class District
    {
        public string DistrictId { get; set; }
        public string DistrictName { get; set; }

    }
    protected void ddlProvince_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<District> lst = new List<District>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "SharedGetDistrict";
        com.Parameters.AddWithValue("@ProvinceId", SqlDbType.Int).Value = ddlProvince.SelectedValue;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        DataTable dtDistricts = new DataTable();
        dtDistricts.Load(dr);
        dr.Close();
        con.Close();
        ddlDistrict.DataSource = dtDistricts;
        ddlDistrict.DataValueField = "DistrictID";
        ddlDistrict.DataTextField = "DistrictEngName";
        ddlDistrict.DataBind();
        ddlDistrict.Items.Insert(0, new ListItem("--Select--", "-1"));
        Page.ClientScript.RegisterStartupScript(this.GetType(), "multiFn", "SetDatePicker()", true);
        //UpdatePanel1.Update();
    }
    protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["LIVECon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.Parameters.Clear();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "spPageVaccinationGetVFU";
        com.Parameters.AddWithValue("@District", SqlDbType.Int).Value = ddlDistrict.SelectedValue;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = ddlYear.SelectedValue;
        con.Open();
       SqlDataReader dr = com.ExecuteReader();
        DataTable dtVFUs = new DataTable();
        dtVFUs.Load(dr);
        dr.Close();
        con.Close();
        ddlVFU.DataSource = dtVFUs;
        ddlVFU.DataValueField = "VFUId";
        ddlVFU.DataTextField = "Name";
        ddlVFU.DataBind();
        ddlVFU.Items.Insert(0, new ListItem("--Select--", "-1"));
        ddlVFU.Items.Add(new ListItem("Add New VFU", "new"));
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

    protected override void Render(HtmlTextWriter writer)
    {

        foreach (ListItem option in ddlDistrict.Items)
        {
            Page.ClientScript.RegisterForEventValidation(ddlDistrict.UniqueID, option.Value);
        }
        foreach (ListItem option in ddlDistrict.Items)
        {
            Page.ClientScript.RegisterForEventValidation(ddlProvince.UniqueID, option.Value);
        }
        foreach (ListItem option in ddlVFU.Items)
        {
            Page.ClientScript.RegisterForEventValidation(ddlVFU.UniqueID, option.Value);
        }
        
        foreach (ListItem option in ddlYear.Items)
        {
            Page.ClientScript.RegisterForEventValidation(ddlYear.UniqueID, option.Value);
        }
        base.Render(writer);
    }
}