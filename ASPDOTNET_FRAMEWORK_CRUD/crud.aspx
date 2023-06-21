<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="crud.aspx.cs" Inherits="ASPDOTNET_FRAMEWORK_CRUD.crud" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container px-4 mt-5">
        <div class="d-flex justify-content-end mb-3">
            <button type="button" onclick="OpenModalAddProduct()" class="btn btn-outline-success">เพิ่มข้อมูล</button>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="modalAddProduct" tabindex="-1" aria-labelledby="modalAddProductLabel" aria-hidden="true">
            <asp:UpdatePanel runat="server" ID="udpSelectProduct" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalAddProductLabel">Add Product</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>ชื่อสินค้า</p>
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtProductName" />
                                <p>หมวดหมู่สินค้า</p>
                                <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <div class="modal-footer">
                                <asp:Button Text="Save Changes" CssClass="btn btn-primary" OnClick="BtnInsertProduct" runat="server" />
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:UpdatePanel runat="server" ID="udpTableProduct" UpdateMode="Conditional">
            <ContentTemplate>
                <table class="table" id="dataTable">
                    <thead>
                        <tr>
                            <th scope="col">ProductId</th>
                            <th scope="col">ProductName</th>
                            <th scope="col">CategoryId</th>
                            <th scope="col">CategoryName</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="rptProduct">
                            <ItemTemplate>
                                <tr>
                                    <th><%# Eval("ProductId") %></th>
                                    <th><%# Eval("ProductName") %></th>
                                    <th><%# Eval("CategoryId") %></th>
                                    <th><%# Eval("CategoryName") %></th>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <script>
        function OpenModalAddProduct() {
            $('#modalAddProduct').modal('show');
        }
        $(document).ready(function () {
            $('#dataTable').DataTable();

        });
    </script>
</asp:Content>
