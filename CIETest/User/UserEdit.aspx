<%@ Page Title="Edit User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="CIETest.User.UserEdit" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">    
    <form class="form-signin" runat="server">
        <h2 class="form-signin-heading">Edit Your Login Information</h2>
        <label for="name" class="form-label">Name</label>
        <asp:TextBox ID="name" cssclass="form-control" MaxLength="50" runat="server"></asp:TextBox>

        <label for="inputEmail" class="form-label">Email address</label>
        <asp:TextBox ID="inputEmail" cssclass="form-control" MaxLength="20" runat="server"></asp:TextBox>

        <label for="inputPassword" class="form-label">Password</label>
        <asp:TextBox ID="inputPassword" CssClass="form-control" MaxLength="20" runat="server"></asp:TextBox>

        <label for="inputPassword" class="form-label">Verify Password</label>
        <asp:TextBox ID="inputVerifyPassword" CssClass="form-control" MaxLength="20" runat="server"></asp:TextBox>
        
        <br />
        <asp:button CssClass="btn btn-lg btn-primary btn-block" Text="Submit" OnClick="Submit" runat="server" />    
    </form>
</asp:Content>
