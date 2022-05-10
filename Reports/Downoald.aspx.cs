using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Reports_Downoald : System.Web.UI.Page
{

    DataTable dtReport = new DataTable();
    string style = @"<style>
.tableHeader{width:100px; background-color:darkorange;font-size:16px;font-weight: bold; text-transform: capitalize; border:1px solid black;word-wrap: break-word;}
.tableCell{background-color: #FFFFFF; text-align:center;Vertical-align:middle;;word-wrap: break-word;font-size:0.7em}.title{ font-size: 1.2em;  font-weight: bold;text-align:center;  color: #000000;  font-style: normal;  font-variant: normal; border:0px solid white;   text-transform: capitalize;  background-color: #FFFFff;}
.tableCellGeneral{background-color: #ffc000; text-align:left;word-wrap: break-word;font-size:13px;font-weight: bold; text-transform: capitalize; border:1px solid black;}.tableCellProcurementCol{background-color: #d8e4bc; text-align:center;word-wrap: break-word;font-size:13px;font-weight: bold; text-transform: capitalize; border:1px solid black;}
.tableCellProgram{background-color: #b7dee8; text-align:center;word-wrap: break-word;font-weight: bold; font-size:13px;}

.DonorTableHeader{width:100px; background-color: #cde4ef;font-size:16px;font-weight: bold; text-transform: capitalize;word-wrap: break-word;}
</style>";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["data-report"] != null && Request.QueryString["y"] != null && Request.QueryString["tp"] != null)
        {
            #region AnimalHealthBenef
            if (!string.IsNullOrEmpty(Request.QueryString["data-report"]) && Request.QueryString["y"] != "-1" && Request.QueryString["tp"] == "1")
            {
                string sd = Request.QueryString["y"].ToString();
                string n = Request.QueryString["data-report"].ToString();
                SqlParameter[] p = new SqlParameter[2];
                p[0] = new SqlParameter("@year", SqlDbType.Int) { Value = Request.QueryString["y"].ToString() };
                p[1] = new SqlParameter("@prov", SqlDbType.NVarChar) { Value = Request.QueryString["data-report"].ToString() };
                dtReport = new OCM.OCM_DbGeneral().ExecuteSelectStoreProcedure("spPageReport_ReportBenefAnimalHealth", p, true);
                if (dtReport.Rows.Count > 0)
                {
                    HtmlGenericControl div = new HtmlGenericControl();
                    div.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

                    HtmlTable tblTitle = HTMLTable("100", 0, "");
                    tblTitle.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

                    HtmlTableRow title = new HtmlTableRow();
                    title.Cells.Add(Cell("MAIL", "tableTitle", 10, "center"));
                    tblTitle.Rows.Add(title);

                    HtmlTableRow title3 = new HtmlTableRow();
                    title3.Cells.Add(Cell("National Horticulture & Livestock Project", "tableTitle", 10, "center"));
                    tblTitle.Rows.Add(title3);

                    HtmlTableRow title4 = new HtmlTableRow();
                    title4.Cells.Add(Cell("Animal Health Activities Report", "tableTitle", 10, "center"));
                    tblTitle.Rows.Add(title4);

                    HtmlTable tblToExport = HTMLTable("100", 1, "black");
                    tblToExport.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

                    //header    
                    HtmlTableRow headerRow = new HtmlTableRow();
                    tblToExport.Rows.Add(headerRow);
                    HtmlTableRow headerSubRow = new HtmlTableRow();
                    headerRow.Cells.Add(CellRowSpan("S.NO", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Province", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("District", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Village", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Contact Number", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Benefeciaries Name", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Father Name", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Activity", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Security Status", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Income Source", "tableHeader", 2, "center"));
                    tblToExport.Rows.Add(headerSubRow);

                    int count = 1;
                    double TotalAmount = 0;
                    double RecievedAmount = 0;
                    double Balance = 0;
                    foreach (DataRow rw in dtReport.Rows)
                    {
                        HtmlTableRow Row = new HtmlTableRow();
                        Row.Cells.Add(Cell(count.ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["ProvinceEngName"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["DistrictEngName"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Village"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Mobile"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Name"].ToString(), "tableCell", "center"));

                        Row.Cells.Add(Cell(rw["FName"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Sub_Activity"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Sec_S"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Inc_Source"].ToString(), "tableCell", "center"));

                        tblToExport.Rows.Add(Row);
                        count++;
                    }

                    //HtmlTableRow footer = new HtmlTableRow();
                    //footer.Cells.Add(Cell("Total", "tableCellGeneral", 2, "center"));
                    //footer.Cells.Add(Cell(TotalAmount.ToString(), "tableCellGeneral", "center"));
                    //footer.Cells.Add(Cell(RecievedAmount.ToString(), "tableCellGeneral", "center"));
                    //footer.Cells.Add(Cell(Balance.ToString(), "tableCellGeneral", "center"));
                    //footer.Cells.Add(Cell("", "tableCellGeneral", "center"));
                    //tblToExport.Rows.Add(footer);

                    div.Controls.Add(tblTitle);
                    div.Controls.Add(tblToExport);
                    Response.Clear();
                    Response.Buffer = true;

                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("content-disposition", "attachment;filename=AnimalHealthGeneralReport.xls");
                    Response.Charset = "utf-8";
                    //this.EnableViewState = false;

                    System.IO.StringWriter sw = new System.IO.StringWriter();
                    System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);
                    Response.Write(style);
                    //titleTable.RenderControl(htw);
                    div.RenderControl(htw);
                    //Response.OutputStream.Write(new byte[] { 0xef, 0xbb, 0xbf }, 0, 3);
                    Response.Write(sw.ToString());
                    Response.End();
                }
            }

            #endregion
            #region MAle VFU Benef
            if (!string.IsNullOrEmpty(Request.QueryString["data-report"]) && Request.QueryString["y"] != "-1" && Request.QueryString["tp"] == "2")
            {
                string sd = Request.QueryString["y"].ToString();
                string n = Request.QueryString["data-report"].ToString();
                SqlParameter[] p = new SqlParameter[2];
                p[0] = new SqlParameter("@year", SqlDbType.Int) { Value = Request.QueryString["y"].ToString() };
                p[1] = new SqlParameter("@prov", SqlDbType.NVarChar) { Value = Request.QueryString["data-report"].ToString() };
                dtReport = new OCM.OCM_DbGeneral().ExecuteSelectStoreProcedure("spPageReport_ReportVFUMaleDetail", p, true);
                if (dtReport.Rows.Count > 0)
                {
                    HtmlGenericControl div = new HtmlGenericControl();
                    div.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

                    HtmlTable tblTitle = HTMLTable("100", 0, "");
                    tblTitle.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

                    HtmlTableRow title = new HtmlTableRow();
                    title.Cells.Add(Cell("MAIL", "tableTitle", 10, "center"));
                    tblTitle.Rows.Add(title);

                    HtmlTableRow title3 = new HtmlTableRow();
                    title3.Cells.Add(Cell("National Horticulture & Livestock Project", "tableTitle", 10, "center"));
                    tblTitle.Rows.Add(title3);

                    HtmlTableRow title4 = new HtmlTableRow();
                    title4.Cells.Add(Cell("Male Extension VFUs Report", "tableTitle", 10, "center"));
                    tblTitle.Rows.Add(title4);

                    HtmlTable tblToExport = HTMLTable("100", 1, "black");
                    tblToExport.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

                    //header    
                    HtmlTableRow headerRow = new HtmlTableRow();
                    tblToExport.Rows.Add(headerRow);
                    HtmlTableRow headerSubRow = new HtmlTableRow();
                    headerRow.Cells.Add(CellRowSpan("S.NO", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Province", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("District", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Village", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Contact Number", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("VFU Name", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Father Name", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("ContractStartDate", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("ContractEndDate", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Bank", "tableHeader", 2, "center"));
                    tblToExport.Rows.Add(headerSubRow);

                    int count = 1;
                    double TotalAmount = 0;
                    double RecievedAmount = 0;
                    double Balance = 0;
                    foreach (DataRow rw in dtReport.Rows)
                    {
                        HtmlTableRow Row = new HtmlTableRow();
                        Row.Cells.Add(Cell(count.ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["ProvinceEngName"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["DistrictEngName"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Village"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Mobile"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Name"].ToString(), "tableCell", "center"));

                        Row.Cells.Add(Cell(rw["FName"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["ContractStartDate"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["ContractEndDate"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Bank"].ToString(), "tableCell", "center"));

                        tblToExport.Rows.Add(Row);
                        count++;
                    }

                    //HtmlTableRow footer = new HtmlTableRow();
                    //footer.Cells.Add(Cell("Total", "tableCellGeneral", 2, "center"));
                    //footer.Cells.Add(Cell(TotalAmount.ToString(), "tableCellGeneral", "center"));
                    //footer.Cells.Add(Cell(RecievedAmount.ToString(), "tableCellGeneral", "center"));
                    //footer.Cells.Add(Cell(Balance.ToString(), "tableCellGeneral", "center"));
                    //footer.Cells.Add(Cell("", "tableCellGeneral", "center"));
                    //tblToExport.Rows.Add(footer);

                    div.Controls.Add(tblTitle);
                    div.Controls.Add(tblToExport);
                    Response.Clear();
                    Response.Buffer = true;

                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("content-disposition", "attachment;filename=MaleVFUBenefDetails.xls");
                    Response.Charset = "utf-8";
                    //this.EnableViewState = false;

                    System.IO.StringWriter sw = new System.IO.StringWriter();
                    System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);
                    Response.Write(style);
                    //titleTable.RenderControl(htw);
                    div.RenderControl(htw);
                    //Response.OutputStream.Write(new byte[] { 0xef, 0xbb, 0xbf }, 0, 3);
                    Response.Write(sw.ToString());
                    Response.End();
                }
            }

            #endregion
            #region MAle VFU Benef
            if (!string.IsNullOrEmpty(Request.QueryString["data-report"]) && Request.QueryString["y"] != "-1" && Request.QueryString["tp"] == "3")
            {
                string sd = Request.QueryString["y"].ToString();
                string n = Request.QueryString["data-report"].ToString();
                SqlParameter[] p = new SqlParameter[2];
                p[0] = new SqlParameter("@year", SqlDbType.Int) { Value = Request.QueryString["y"].ToString() };
                p[1] = new SqlParameter("@prov", SqlDbType.NVarChar) { Value = Request.QueryString["data-report"].ToString() };
                dtReport = new OCM.OCM_DbGeneral().ExecuteSelectStoreProcedure("spPageReport_ReportVFUFemaleDetail", p, true);
                if (dtReport.Rows.Count > 0)
                {
                    HtmlGenericControl div = new HtmlGenericControl();
                    div.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

                    HtmlTable tblTitle = HTMLTable("100", 0, "");
                    tblTitle.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

                    HtmlTableRow title = new HtmlTableRow();
                    title.Cells.Add(Cell("MAIL", "tableTitle", 10, "center"));
                    tblTitle.Rows.Add(title);

                    HtmlTableRow title3 = new HtmlTableRow();
                    title3.Cells.Add(Cell("National Horticulture & Livestock Project", "tableTitle", 10, "center"));
                    tblTitle.Rows.Add(title3);

                    HtmlTableRow title4 = new HtmlTableRow();
                    title4.Cells.Add(Cell("Male Extension VFUs Report", "tableTitle", 10, "center"));
                    tblTitle.Rows.Add(title4);

                    HtmlTable tblToExport = HTMLTable("100", 1, "black");
                    tblToExport.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

                    //header    
                    HtmlTableRow headerRow = new HtmlTableRow();
                    tblToExport.Rows.Add(headerRow);
                    HtmlTableRow headerSubRow = new HtmlTableRow();
                    headerRow.Cells.Add(CellRowSpan("S.NO", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Province", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("District", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Village", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Contact Number", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("EFA Name", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Father Name", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("ContractStartDate", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("ContractEndDate", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Bank", "tableHeader", 2, "center"));
                    headerRow.Cells.Add(CellRowSpan("Responsible", "tableHeader", 2, "center"));
                    tblToExport.Rows.Add(headerSubRow);

                    int count = 1;
                    double TotalAmount = 0;
                    double RecievedAmount = 0;
                    double Balance = 0;
                    foreach (DataRow rw in dtReport.Rows)
                    {
                        HtmlTableRow Row = new HtmlTableRow();
                        Row.Cells.Add(Cell(count.ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["ProvinceEngName"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["DistrictEngName"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Village"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Mobile"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Name"].ToString(), "tableCell", "center"));

                        Row.Cells.Add(Cell(rw["FName"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["ContractStartDate"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["ContractEndDate"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["Bank"].ToString(), "tableCell", "center"));
                        Row.Cells.Add(Cell(rw["HeadName"].ToString(), "tableCell", "center"));

                        tblToExport.Rows.Add(Row);
                        count++;
                    }

                    //HtmlTableRow footer = new HtmlTableRow();
                    //footer.Cells.Add(Cell("Total", "tableCellGeneral", 2, "center"));
                    //footer.Cells.Add(Cell(TotalAmount.ToString(), "tableCellGeneral", "center"));
                    //footer.Cells.Add(Cell(RecievedAmount.ToString(), "tableCellGeneral", "center"));
                    //footer.Cells.Add(Cell(Balance.ToString(), "tableCellGeneral", "center"));
                    //footer.Cells.Add(Cell("", "tableCellGeneral", "center"));
                    //tblToExport.Rows.Add(footer);

                    div.Controls.Add(tblTitle);
                    div.Controls.Add(tblToExport);
                    Response.Clear();
                    Response.Buffer = true;

                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("content-disposition", "attachment;filename=FemaleVFUBenefDetails.xls");
                    Response.Charset = "utf-8";
                    //this.EnableViewState = false;

                    System.IO.StringWriter sw = new System.IO.StringWriter();
                    System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);
                    Response.Write(style);
                    //titleTable.RenderControl(htw);
                    div.RenderControl(htw);
                    //Response.OutputStream.Write(new byte[] { 0xef, 0xbb, 0xbf }, 0, 3);
                    Response.Write(sw.ToString());
                    Response.End();
                }
            }

            #endregion
        }
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
}