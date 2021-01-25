tableextension 60000 "SalesHeaderExt" extends "Sales Header" //36
{
    fields
    {
        field(60000; "Shipment Status"; option)
        {
            Caption = 'Shipment Status', Comment = 'FRA="Statut livraison"';
            Editable = false;
            DataClassification = ToBeClassified;
            OptionCaption = 'Undelivred,Partial,Total', Comment = 'FRA="Non livré,Partiel,Total"';
            OptionMembers = Undelivred,Partial,Total;
        }
        field(60001; "Salesperson Code 2"; code[20])
        {
            Caption = 'Salesperson Code 2', Comment = 'FRA="Code vendeur 2"';
            TableRelation = "Salesperson/Purchaser";

            trigger OnValidate()
            var
                RecLSalesLine: Record "Sales Line";
            begin
                ValidateSalesPersonCode2(Rec, false, false);

                If xRec."Salesperson Code 2" <> "Salesperson Code 2" then begin
                    IF CONFIRM(Text0001) THEN begin
                        RecLSalesLine.RESET;
                        RecLSalesLine.SETRANGE("Document Type", "Document Type");
                        RecLSalesLine.SETRANGE("Document No.", "No.");
                        RecLSalesLine.LOCKTABLE;
                        IF Not RecLSalesLine.IsEmpty then begin
                            RecLSalesLine.FindSet();
                            REPEAT
                                RecLSalesLine.validate("Salesperson Code 2", "Salesperson Code 2");
                                RecLSalesLine.MODIFY;
                            UNTIL RecLSalesLine.NEXT = 0;
                        end;
                    end;
                end;
            end;
        }
    }
    var
        Text0001: Label 'You may have changed a Salesperson Code.\\Do you want to update the lines?', Comment = 'FRA="Vous avez probablement modifié un code vendeur.\\Souhaitez-vous mettre à jour les lignes ?"';

    procedure ValidateSalesPersonCode2(SalesHeader2: Record "Sales Header"; IsTransaction: Boolean; IsPostAction: Boolean)
    var
        Salesperson: Record "Salesperson/Purchaser";
    begin
        if SalesHeader2."Salesperson Code 2" <> '' then
            if Salesperson.Get(SalesHeader2."Salesperson Code 2") then
                if Salesperson.VerifySalesPersonPurchaserPrivacyBlocked(Salesperson) then begin
                    if IsTransaction then
                        Error(Salesperson.GetPrivacyBlockedTransactionText(Salesperson, IsPostAction, true));
                    if not IsTransaction then
                        Error(Salesperson.GetPrivacyBlockedGenericText(Salesperson, true));
                end;
    end;
}
