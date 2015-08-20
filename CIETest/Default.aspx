<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CIETest._Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">    
    <form class="form-signin" runat="server">
        <h2 class="form-signin-heading">Please sign in</h2>
        <asp:Label ID="Message" Visible="false" runat="server"></asp:Label><br />
        
        <asp:ValidationSummary runat="server" HeaderText="Errors:" />
        
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="inputLogin" ErrorMessage="Please enter login name">*</asp:RequiredFieldValidator>
        <label for="inputLogin" class="form-label">Login</label>
        <asp:TextBox ID="inputLogin" cssclass="form-control" MaxLength="20" runat="server"></asp:TextBox>
        
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="inputPassword" ErrorMessage="Please enter password">*</asp:RequiredFieldValidator>
        <label for="inputPassword" class="form-label">Password</label>
        <asp:TextBox ID="inputPassword" CssClass="form-control" MaxLength="20" runat="server"></asp:TextBox>

        <asp:CheckBox ID="Persist" runat="server" />
        <label for="Persist" class="form-label">Remember me</label>
        
        <br />
        <asp:button CssClass="btn btn-lg btn-primary btn-block" Text="Sign In" OnClick="Login" runat="server" />
        <asp:button CssClass="btn btn-lg btn-danger btn-block" Text="New User" CausesValidation="false" OnClick="Register" runat="server" />
      </form>

</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">   
    <link href="<%= Page.ResolveUrl("~/Content/signin.css") %>" rel="stylesheet">
    <link href="<%= Page.ResolveUrl("~/Content/Site.css") %>" rel="stylesheet">    
</asp:Content>