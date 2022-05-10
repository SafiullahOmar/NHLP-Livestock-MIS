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
                var supportedTypes = new[] {  "xlsx" };
                var fileExt = System.IO.Path.GetExtension(FileUpload1.FileName).Substring(1);
                if (!supportedTypes.Contains(fileExt))
                {
                    lblMsg.Text = "File is not supported";
                    lblMsg.Attributes.Add("class", "alert alert-danger round alert-icon-left alert-arrow-left alert-dismissible fade in mb-2 hideit");
                    lblMsg.Style.Add("width", "500px");
                    return ;
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
                DataRow[] dtRows = dt.Select("Name is null or FName is  null or  Gender is  null or Village is  null or Mob is null");
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

                    headerRow.Cells.Add(Cell(r["Name"].ToString(), "tableHeader", 4, "center"));
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
                        bool flag = false;int Gender = 1;

                        MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
                        if (rw["Gender"].ToString() == "Male")
                            Gender = 1;
                        else
                            Gender = 2;
                        SqlParameter[] p = new SqlParameter[9];
                        p[0] = new SqlParameter("@Name", SqlDbType.NVarChar) { Value = rw["Name"] };
                        p[1] = new SqlParameter("@FName", SqlDbType.NVarChar) { Value = rw["FName"] };
                        p[2] = new SqlParameter("@Gender", SqlDbType.Int) { Value = Gender };
                        p[3] = new SqlParameter("@ContactNo", SqlDbType.NVarChar) { Value = rw["Mob"] };
                        p[4] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                        p[5] = new SqlParameter("@Date", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                        p[6] = new SqlParameter("@DistrictId", SqlDbType.Int) { Value = ddlDistrict.SelectedValue };
                        p[7] = new SqlParameter("@Village", SqlDbType.NVarChar) { Value = rw["Village"] };
                        p[8] = new SqlParameter("@exist", SqlDbType.Bit);
                        p[8].Direction = ParameterDirection.Output;
                        flag = Convert.ToBoolean(db.ExecuteTransStoreProcedureReturn("spPageBenefeciarySave", p, true, "@exist"));
                        if (flag == false)
                        {
                            count++;
                        }
                    }
                    db.EndTransaction();
                    lblMsg.Text = count.ToString() + " Farmers Information has been Added into system.";
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
    protected void ddlProvince_SelectedIndexChanged1(object sender, EventArgs e)
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
    }
}