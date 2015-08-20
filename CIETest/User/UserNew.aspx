<%@ Page Title="New User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserNew.aspx.cs" Inherits="CIETest.User.UserNew" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">    
    <form class="form-signin" runat="server">
        <h2 class="form-signin-heading">Registration</h2>
        <asp:ValidationSummary runat="server" HeaderText="Errors:" />
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="name" ErrorMessage="Please enter your name">*</asp:RequiredFieldValidator>
        <label for="name" class="form-label">Name</label>
        <asp:TextBox ID="name" cssclass="form-control" MaxLength="50" runat="server"></asp:TextBox>
        
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="inputLogin" ErrorMessage="Please enter login name">*</asp:RequiredFieldValidator>
        <label for="inputLogin" class="form-label">Login</label>
        <asp:TextBox ID="inputLogin" cssclass="form-control" MaxLength="20" runat="server"></asp:TextBox>
        
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="inputPassword" ErrorMessage="Please enter a password">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "inputPassword" ID="RegularExpressionValidator2" ValidationExpression = "^[\s\S]{4,}$" runat="server" ErrorMessage="Minimum 4 characters required.">*</asp:RegularExpressionValidator>
        <label for="inputPassword" class="form-label">Password</label>
        <asp:TextBox ID="inputPassword" CssClass="form-control" MaxLength="20" TextMode="Password" runat="server"></asp:TextBox>
        
        <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="inputVerifyPassword" ErrorMessage="Confirm password is required">*</asp:RequiredFieldValidator>
        <asp:CompareValidator runat="server" ControlToCompare="inputPassword" ControlToValidate="inputVerifyPassword" ErrorMessage="Confirm password do not match!" Display="Dynamic">*</asp:CompareValidator>
        <label for="inputVerifyPassword" class="form-label">Confirm Password</label>
        <asp:TextBox ID="inputVerifyPassword" CssClass="form-control" MaxLength="20" TextMode="Password" runat="server"></asp:TextBox>
        
        
        <br />
        <asp:button CssClass="btn btn-lg btn-primary btn-block" Text="Register" OnClick="Register" runat="server" />   
        <asp:button CssClass="btn btn-lg btn-danger btn-block" Text="Cancel" CausesValidation="false" OnClick="Cancel" runat="server" /> 
    </form>
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">   
    <link href="<%= Page.ResolveUrl("~/Content/signin.css") %>" rel="stylesheet" />
    <link href="<%= Page.ResolveUrl("~/Content/Site.css") %>" rel="stylesheet">    
</asp:Content>