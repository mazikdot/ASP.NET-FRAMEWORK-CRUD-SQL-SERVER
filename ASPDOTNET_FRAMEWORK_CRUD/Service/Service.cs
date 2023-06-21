using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace ASPDOTNET_FRAMEWORK_CRUD.Service
{
    public class Service
    {
        private SqlConnection con;
        private static Service _instance;

        public static Service getInstance()
        {
            if (_instance == null)
            {
                _instance = new Service();
            }

            return _instance;
        }

        private SqlCommand CreateSqlCommand(string query)
        {
            con = new SqlConnection("Data Source=DESKTOP-JDVV661\\SQLEXPRESS;Initial Catalog=product;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            return cmd;
        }

        private DataTable executeQuery(string selectQuery)
        {
            using (SqlCommand cmd = CreateSqlCommand(selectQuery))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    return dt;
                }
            }
        }

        public void InsertData(string productName, string categoryId)
        {
            try
            {
                string insertQuery = "INSERT INTO tbproduct (ProductName, CategoryId) VALUES (@Value1, @Value2)";

                using (SqlCommand cmd = CreateSqlCommand(insertQuery))
                {
                    cmd.Parameters.AddWithValue("@Value1", productName);
                    cmd.Parameters.AddWithValue("@Value2", categoryId);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void UpdateData(int productId, string value1, string value2)
        {
            try
            {
                string updateQuery = "UPDATE tbproduct SET ProductName = @Value1, CategoryId = @Value2 WHERE ProductId = @ProductId";

                using (SqlCommand cmd = CreateSqlCommand(updateQuery))
                {
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    cmd.Parameters.AddWithValue("@Value1", value1);
                    cmd.Parameters.AddWithValue("@Value2", value2);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public DataTable SelectData()
        {
            try
            {
                string selectQuery = "SELECT a.*,b.CategoryName FROM tbproduct as a INNER JOIN tbcategory as b ON a.CategoryId = b.CategoryId ";
                DataTable dt = executeQuery(selectQuery);
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void DoJavascript(string script)
        {
            Page page = HttpContext.Current.Handler as Page;
            if (page != null)
            {
                ScriptManager.RegisterStartupScript(page, typeof(Service), "scriptDoJavascript", script, true);
            }
        }

        public void Success()
        {
            Page page = HttpContext.Current.Handler as Page;
            if (page != null)
            {
                string success = "Swal.fire('Success',  '',  'success')";
                ScriptManager.RegisterStartupScript(page, typeof(Service), "scriptAlertSuccess", success, true);
            }
        }

        public DataTable SelectDataCategory()
        {
            try
            {
                string selectQuery = "SELECT * FROM tbcategory";
                DataTable dt = executeQuery(selectQuery);
                return dt;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void DeleteData(int productId)
        {
            try
            {
                string deleteQuery = "DELETE FROM tbproduct WHERE ProductId = @ProductId";

                using (SqlCommand cmd = CreateSqlCommand(deleteQuery))
                {
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}