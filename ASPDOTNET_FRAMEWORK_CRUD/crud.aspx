<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.Master" AutoEventWireup="true" CodeBehind="crud.aspx.cs" Inherits="ASPDOTNET_FRAMEWORK_CRUD.crud" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .hide{
            display:none;
        }
    </style>
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
         <div class="modal fade" id="modalUpdateProduct" tabindex="-1" aria-labelledby="modalUpdateroductLabel" aria-hidden="true">
            <asp:UpdatePanel runat="server" ID="udpUpdateProduct" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalUpdateProductLabel">Add Product</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>ชื่อสินค้า</p>
                                <asp:TextBox runat="server" CssClass="hide" ID="udpTxtProductId" />
                                <asp:TextBox runat="server" CssClass="form-control" ID="updTxtProductName" />
                                <p>หมวดหมู่สินค้า</p>
                                <asp:DropDownList ID="udpDdlCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                            <div class="modal-footer">
                                <asp:Button Text="Save Changes" CssClass="btn btn-primary" OnClick="SaveUpdateProduct" runat="server" />
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
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="rptProduct">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("ProductId") %></td>
                                    <td><%# Eval("ProductName") %></td>
                                    <td><%# Eval("CategoryId") %></td>
                                    <td><%# Eval("CategoryName") %></td>
                                    <td>
                                        <asp:Button runat="server" OnClick="BtnUpdateProduct" ProductId='<%# Eval("ProductId") %>' CssClass="btn btn-warning text-white" Text="Edit" />
                                        <asp:Button runat="server" OnClientClick="return ConfirmDelete(this,event);" CssClass="btn btn-danger" Text="Delete" 
                                 ID="btnDeleteProduct"
                                            />
                                        <asp:Button Text="text" CssClass="hide"
                                            OnClick="BtnDeleteProduct"
                                            ProductId='<%# Eval("ProductId") %>' 
                                            runat="server" />
                                    </td>
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
        function BinddingDatTable() {
            $(document).ready(function () {
                $('#dataTable').DataTable();
            });
        }
        function ConfirmDelete(button,event) {
            event.preventDefault();
            console.log(button)
            Swal.fire({
                title: 'Confirm Delete',
                text: 'Are you sure you want to delete this item?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then(function (result) {
                if (result.value) {
                    $(button).next().click();
                } else {
                    return false;
                }
            });
        }

    </script>
</asp:Content>
