<%@ Page Title="MEDICO : Gestion des Rendez-vous" Language="C#" MasterPageFile="~/Medico.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MEDICO.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>document.getElementById('home_page').className = "active";</script>
    <div id="main_content_home" class="row-fluid" style="min-height:100%">
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3">
                    <img src="img/Homepage.png" width="250" style="float:right;" class="hidden-phone"/>
                </div>
                <div id="inside_main_content" class="page-header span9" style="border:none;">
                    <h1 style="text-align:center;">Profitez de notre solution web de prise de rendez-vous en ligne !</h1>
                    <p>Cher Patient, Vous êtes confronté à un véritable parcours du combattant dans la recherche de vos rendez-vous médicaux, simplifiez vous la vie avec MEDICO.</p>
                    <p>Cher Médecin, Découvrez votre carnet de rendez-vous personnalisé en ligne qui vous permet réduire le nombre d’appels téléphoniques à votre cabinet pour libérer du temps pour vos patients.</p>
                    <div style="max-width:300px;margin: 0 auto; padding-top:10px;">
                        <a class="btn btn-danger btn-large btn-block" href="P/AddAppointment.aspx">Prendre un rendez-vous</a>
                        <a class="btn btn-large btn-block" href="#myModal" data-toggle="modal" >Créer un compte</a>
                        <div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel">S'enregistrer :</h3>
                            </div>
                            <div class="modal-body">
                                <div class="row-fluid">
                                    <div class="span6" style="text-align:center;">
                                        <p><strong>Vous êtes Médecin</strong></p>
                                        <p><img src="img/doctor.png"/></p>
                                        <a class="btn btn-danger" href="Account/CreatDoctor.aspx">S'inscrir</a>
                                    </div>
                                    <div class="span6" style="text-align:center;">
                                        <p><strong>Vous êtes Patient</strong></p>
                                        <p><img src="img/patient.png"/></p>
                                        <a class="btn btn-danger" href="Account/CreatPatient.aspx">S'inscrir</a>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Fermer</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
