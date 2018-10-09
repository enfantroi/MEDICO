<%@ Page Title="Les Cabinets Médicaux" Language="C#" MasterPageFile="~/Medico.Master" AutoEventWireup="true" CodeBehind="LesCabinets.aspx.cs" Inherits="MEDICO.LesCabinets" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>document.getElementById('cabinets_page').className = "active";</script> 
    <div class="container" style="margin-top: 20px;">
        <div class="hidden-phone" style="height: 20px; background: url(../img/small_line.png) repeat-x scroll left top transparent;"></div>
        <form runat="server" id="filterCabinet">
        <div class="row">
            <asp:Panel ID="FilterCabPanel" runat="server" class="span3">
                    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                        <Scripts>
                            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
                        </Scripts>
                    </telerik:RadScriptManager>
                    <ul id="scrolDoc" class="nav nav-list bs-docs-sidenav">
                        <li>
                            <a>
                                <telerik:RadDropDownList ID="villeCab" runat="server" DefaultMessage="Filtrer par ville ..." DropDownWidth="170px" Width="100%"></telerik:RadDropDownList>
                            </a>
                        </li>
                        <li>
                            <a>
                                <telerik:RadDropDownList ID="specialityDoc" runat="server" DefaultMessage="Filtrer par spécialité ..." DropDownWidth="170px" Width="100%"></telerik:RadDropDownList>
                            </a>
                        </li>
                        <li>
                            <a>
                                <asp:Button ID="filtrerParVilleAndSpec" runat="server" Text="Valider" CssClass="btn btn-block" OnClick="filtrerParVilleAndSpec_Click" />
                            </a>
                            <a>
                                <asp:Button ID="AnullerFilter" runat="server" Text="Réinitialiser" CssClass="btn btn-block" OnClick="AnullerFilter_Click" />
                            </a>
                        </li>
                    </ul>
                
            </asp:Panel>
            <div class="span9">
                <asp:Repeater ID="LesCab" runat="server">
                    <ItemTemplate>
                            <div class="row-fluid CabinetItem">
                                <a href="/UnCabinet.aspx?id=<%#Eval("idCab")%>" style="color:#333333;">
                                <div class="span2">
                                    <img src="<%#Eval("photoCab")%>" class="img-rounded photoCab" style="max-width:120px;"/>
                                </div>
                                <div class="span6">
                                    <p style="text-align:center; color:#333333;"><i class="icon-home"></i> <strong>Cabinet: </strong><%#Eval("nomCab")%></p>
                                    <p><i class="icon-chevron-right"></i> <strong>Spécialité: </strong><%#Eval("specCab")%></p>
                                    <p><i class="icon-chevron-right"></i> <strong>Ville: </strong><%#Eval("villeCab")%></p>
                                    <p><i class="icon-chevron-right"></i> <strong>Adresse: </strong><%#Eval("adresseCab")%></p>
                                    <p><i class="icon-user"></i> <strong>Medecin: </strong><%#Eval("nomDoc")%> <%#Eval("prenomDoc")%></p>
                                </div>
                                </a>
                                <div class="span4">
                                    <div class="map_canvas" style="height: 120px; width: 100%; border: 1px solid #999999;"></div>
                                    <input class="geox" type="hidden" value="<%#Eval("geoX")%>"/>
                                    <input class="geoy" type="hidden" value="<%#Eval("geoY")%>"/>
                                </div>
                            </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </form>
    </div>
    <script src="js/google_map.js"></script>
</asp:Content>
