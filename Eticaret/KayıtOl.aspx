<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="KayıtOl.aspx.cs" Inherits="Eticaret.KayıtOl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style3 {
        width: 100%;
    }
    .auto-style4 {
        width: 499px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <table class="auto-style3">
    <tr>
        <td class="auto-style4">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style4">&nbsp;</td>
        <td>
            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server">
                <WizardSteps>
                    <asp:CreateUserWizardStep runat="server" />
                    <asp:CompleteWizardStep runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td align="center">Tamamlandı</td>
                                </tr>
                                <tr>
                                    <td>Hesabınız başarıyla oluşturuldu.</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" OnClick="ContinueButton_Click" Text="Devam" ValidationGroup="CreateUserWizard1" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:CompleteWizardStep>
                </WizardSteps>
                <FinishNavigationTemplate>
                    <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Önceki" />
                    <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" Text="Son" />
                </FinishNavigationTemplate>
                <StartNavigationTemplate>
                    <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" Text="Sonraki" />
                </StartNavigationTemplate>
            </asp:CreateUserWizard>
        </td>
    </tr>
</table>
</asp:Content>
