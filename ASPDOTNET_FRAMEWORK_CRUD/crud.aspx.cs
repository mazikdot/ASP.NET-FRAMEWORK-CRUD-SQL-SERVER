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
            }
        }

        private void BindDataProduct()
        {
            try
            {
                DataTable dt = ServiceS.SelectData();
                DataTable dtCategory = ServiceS.SelectDataCategory();
                if (dt.Rows.Count > 0)
                {
                    rptProduct.DataSource = dt;
                    rptProduct.DataBind();
                    udpTableProduct.Update();
                }
                if(dtCategory.Rows.Count > 0)
                {
                    // drop down List
                    ddlCategory.DataSource = dtCategory;
                    ddlCategory.DataTextField = "CategoryName";
                    ddlCategory.DataValueField = "CategoryId";
                    ddlCategory.DataBind();
                    udpSelectProduct.Update();
                }
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
                ServiceS.DoJavascript(" $('#modalAddProduct').modal('hide');");
                
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}