<%@ Page Title="Item List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemList.aspx.cs" Inherits="CIETest.ItemPage.ItemList" %>


<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent"> 
    <form runat="server"> 
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="header clearfix">
        <nav>
            <ul class="nav nav-pills pull-right">
            <li role="presentation"><asp:Label ID="lblWelcome" runat="server"></asp:Label></li>
            <li role="presentation"><asp:LinkButton ID="LogoutLink" OnClick="Logout" runat="server">Logout</asp:LinkButton></li>
            </ul>
        </nav>
        <h3 class="text-muted">CIE Test Project</h3>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#AddItemModal">
                    Add Item
                </button>
                <asp:Label ID="AddItemMessage" Visible="false" runat="server"></asp:Label>
            </div>
        </div>

        <div class="row">
        <div class="col-lg-12">
            <asp:UpdatePanel ID="updatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GVItemList" CssClass="table" AutoGenerateColumns="false" DataKeyNames="Id,userId" OnRowDataBound="GVItemList_OnRowDataBound" OnRowCommand="GVItemList_RowCommand" runat="server">
                        <Columns>
                            <asp:BoundField DataField="Message" HeaderText="Message" />
                            <asp:BoundField DataField="Name" HeaderText="Author" />
                            <asp:ButtonField CommandName="EditMessage" ControlStyle-CssClass="btn btn-info" ButtonType="Button" 
                         Text="Edit" HeaderText="" /> 
                            <asp:ButtonField CommandName="DeleteMessage" ControlStyle-CssClass="btn btn-danger" ButtonType="Button" 
                         Text="Delete" HeaderText="" /> 
                    
                        </Columns>
                        <emptydatatemplate>
                            No Data Found.  
                        </emptydatatemplate> 
                    </asp:GridView>

                    <!-- Edit Item Modal -->
                    <div class="modal fade" id="EditItemModal" tabindex="-1" role="dialog" aria-labelledby="EditModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="EditModalLabel">Edit new item</h4>
                                </div>
                                <div class="modal-body">
                                    <label for="EdittxtMessage" class="form-label">Message (Max length: 50)</label><br />
                                    <asp:TextBox ID="EdittxtMessage" CssClass="col-lg-12" MaxLength="50" runat="server"></asp:TextBox>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                                    <asp:Button ID="btnEditItem" CssClass="btn btn-primary" OnClick="UpdateItem" Text="Save" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            
        </div>
        </div>

        <footer class="footer">
        <p>&copy; By Charles Hui</p>
        </footer>

        <!-- Add Item Modal -->
        <div class="modal fade" id="AddItemModal" tabindex="-1" role="dialog" aria-labelledby="AddModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="AddModalLabel">Add new item</h4>
                    </div>
                    <div class="modal-body">
                        <label for="txtMessage" class="form-label">Message (Max length: 50)</label><br />
                        <asp:TextBox ID="txtMessage" CssClass="col-lg-12" MaxLength="50" runat="server"></asp:TextBox>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        <asp:Button ID="btnAddItem" CssClass="btn btn-primary" OnClick="AddItem" Text="Save" runat="server" />
                    </div>
                </div>
            </div>
        </div>

        

    </form>
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">   
    <link href="<%= Page.ResolveUrl("~/Content/jumbotron-narrow.css") %>" rel="stylesheet" />
    <link href="<%= Page.ResolveUrl("~/Content/Site.css") %>" rel="stylesheet">    
</asp:Content>
