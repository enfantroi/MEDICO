<%@ Page Title="" Language="C#" MasterPageFile="~/Medico.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="MEDICO.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>document.getElementById('contact_page').className = "active";</script>
    <div id="main_content_home">
    <form id="contactForm" runat="server" class="form-horizontal" style="max-width:800px;padding-top:40px;">
        <div class="control-group">
            <label class="control-label" for="ContentPlaceHolder1_Sujet"><strong style="color:#B81319">Sujet</strong></label>
            <div class="controls">
                <asp:TextBox ID="Sujet" CssClass="input-block-level" runat="server" placeholder="Sujet ..."></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="ContentPlaceHolder1_Message"><strong style="color:#B81319">Message</strong></label>
            <div class="controls">
                <asp:TextBox ID="Message" runat="server" placeholder="Votre message ..." CssClass="input-block-level" Rows="10" TextMode="MultiLine"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <asp:Button ID="Envoyer" runat="server" Text="Envoyer" CssClass="btn btn-danger" Width="180" Height="30"/>
            </div>
        </div>
    </form>
        </div>
</asp:Content>
