using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPDOTNET_FRAMEWORK_CRUD
{
    public partial class crud : System.Web.UI.Page
    {
        private ASPDOTNET_FRAMEWORK_CRUD.Service.Service ServiceS = ASPDOTNET_FRAMEWORK_CRUD.Service.Service.getInstance();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDataProduct();
                ServiceS.DoJavascript("BinddingDatTable()");
            }
        }

        private void BindDataProduct()
        {
            try
            {
                DataTable dt = ServiceS.SelectData();
                DataTable dtCategory = ServiceS.SelectDataCategory();
                rptProduct.DataSource = dt;
                rptProduct.DataBind();
                udpTableProduct.Update();
                if (dtCategory.Rows.Count > 0)
                {
                    // drop down List
                    ddlCategory.DataSource = dtCategory;
                    ddlCategory.DataTextField = "CategoryName";
                    ddlCategory.DataValueField = "CategoryId";
                    ddlCategory.DataBind();
                    udpSelectProduct.Update();
                }
                //ServiceS.DoJavascript("BinddingDatTable()");
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void BtnInsertProduct(object sender, EventArgs e)
        {
            try
            {
                string getSelectedValueDdlCategory = ddlCategory.SelectedValue;
                string getTxtProductName = txtProductName.Text.Trim();
                ServiceS.InsertData(getTxtProductName, getSelectedValueDdlCategory);
                ServiceS.Success();
                BindDataProduct();
                ServiceS.DoJavascript("$('#modalAddProduct').modal('hide'); BinddingDatTable();");

            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void BtnUpdateProduct(object sender, EventArgs e)
        {
            try
            {
                Button btn = sender as Button;

                string getProductId = btn.Attributes["ProductId"];
                DataTable dtProduct = ServiceS.GetOneRecordProduct(getProductId);
                updTxtProductName.Text = dtProduct.Rows[0]["ProductName"].ToString();
                udpTxtProductId.Text = dtProduct.Rows[0]["ProductId"].ToString();
                DataTable dtCategory = ServiceS.SelectDataCategory();
                udpDdlCategory.DataSource = dtCategory;
                udpDdlCategory.DataTextField = "CategoryName";
                udpDdlCategory.DataValueField = "CategoryId";
                udpDdlCategory.DataBind();

                //selected Dropdown List
                ListItem defaultDdlCategory = udpDdlCategory.Items.FindByValue(dtProduct.Rows[0]["CategoryId"].ToString());
                if (defaultDdlCategory != null)
                {
                    defaultDdlCategory.Selected = true;
                }

                udpUpdateProduct.Update();
                ServiceS.DoJavascript("BinddingDatTable(); $('#modalUpdateProduct').modal('show');");
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void SaveUpdateProduct(object sender, EventArgs e)
        {
            try
            {
                ServiceS.UpdateDataProduct(int.Parse(udpTxtProductId.Text), updTxtProductName.Text.Trim(), udpDdlCategory.SelectedValue);
                BindDataProduct();
                ServiceS.Success();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                ServiceS.DoJavascript("$('#modalUpdateProduct').modal('hide'); BinddingDatTable();");
            }
        }

        protected void BtnDeleteProduct(object sender, EventArgs e)
        {
            try
            {
                Button btn = sender as Button;
                string getProductId = btn.Attributes["ProductId"].Trim();
                ServiceS.DeleteProduct(getProductId);
                ServiceS.Success();
                BindDataProduct();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                ServiceS.DoJavascript("BinddingDatTable();");
            }
        }
    }
}