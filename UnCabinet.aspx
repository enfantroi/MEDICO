<%@ Page Title="" Language="C#" MasterPageFile="~/Medico.Master" AutoEventWireup="true" CodeBehind="UnCabinet.aspx.cs" Inherits="MEDICO.UnCabinet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>document.getElementById('cabinets_page').className = "active";</script>
    <form id="cabinetInfoForm" runat="server">
        <div class="row" id="main_content_home">
            <div class="span4">
                <div id="medecinBlock">
                    <img class="img-rounded" src="<%= photoDoc %>" style="display: block; margin: 0 auto 20px auto; width: 140px;" />
                    <p><i class="icon-chevron-right"></i> <strong>Nom : </strong> <%= nomDoc %></p>
                    <p><i class="icon-chevron-right"></i> <strong>Prenom : </strong><%= prenomDoc %></p>
                    <p><i class="icon-chevron-right"></i> <strong>Spécialité : </strong><%= specDoc %></p>
                    <p><i class="icon-chevron-right"></i> <strong>Ville : </strong><%= villeDoc %></p>
                    <p><i class="icon-chevron-right"></i> <strong>Telephone : </strong><%= telDoc %></p>
                    <p><i class="icon-chevron-right"></i> <strong>Email : </strong><%= emailDoc %></p>
                    <p><i class="icon-chevron-right"></i> <strong>Adresse : </strong><%= adresseDoc %></p>
                    <p><i class="icon-chevron-right"></i> <strong>Horaire de travail : </strong>de <%= debutTrav %> à <%= finTrav %></p>
                </div>
            </div>
            <div class="span8">
                <div id="cabinetOfDoc">
                    <div class="row-fluid">
                        <div class="span9">
                            <h2 style="color:#B81319;text-align: center; width: 100%;"><%= nomCab %></h2>
                            <p><i class="icon-certificate"> </i><strong> Adresse : </strong><%= adresseCab %></p>
                            <p><i class="icon-certificate"> </i><strong> Ville : </strong><%= villeCab %></p>
                            <p><i class="icon-certificate"> </i><strong> Code Postale : </strong><%= cpCab %></p>
                        </div>
                        <div class="span3">
                            <img src="<%= photoCab %>" class="img-polaroid" style="display: block; margin: 0 auto 20px auto; width: 140px;" />
                        </div>
                    </div>
                    <div class="row-fluid">
                        <p><i class="icon-list-alt"></i> <strong>Déscription :</strong></p>
                        <p><%= descCab %></p>
                    </div>
                    <div class="row-fluid">
                        <p><i class="icon-map-marker"></i> <strong>Localisation sur ​​la carte :</strong></p>
                        <div id="map_canvas" style="height: 180px; width: 100%; border: 1px solid #999999;"></div>
                        <input id="geox_cab" type="hidden" value="<%= geox %>" />
                        <input id="geoy_cab" type="hidden" value="<%= geoy %>" />
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="js/getmap.js"></script>
</asp:Content>
