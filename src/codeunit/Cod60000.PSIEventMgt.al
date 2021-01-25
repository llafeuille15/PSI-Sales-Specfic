codeunit 60000 "PSI Event Mgt"
{
    var
        CduGPSIFunctionsMgt: Codeunit "PSI Functions Mgt";

    local procedure "---Tab36---"()
    begin
    end;

    [EventSubscriber(ObjectType::table, 36, 'OnAfterSetFieldsBilltoCustomer', '', false, false)]
    local procedure OnAfterSetFieldsBilltoCustomer_T36(VAR SalesHeader: Record "Sales Header"; Customer: Record Customer)
    begin
        CduGPSIFunctionsMgt.FctOnAfterSetFieldsBilltoCustomer_T36(SalesHeader, Customer);
    end;

    [EventSubscriber(ObjectType::table, 36, 'OnAfterValidateEvent', 'Salesperson Code', false, false)]
    local procedure OnAfterValidate_SalespersonCode(VAR Rec: Record "Sales Header"; VAR xRec: Record "Sales Header"; CurrFieldNo: Integer)
    var
        RecLSalesLine: Record "Sales Line";
        Text0001: Label 'You may have changed a Salesperson Code.\\Do you want to update the lines?', Comment = 'FRA="Vous avez probablement modifié un code vendeur.\\Souhaitez-vous mettre à jour les lignes ?"';
    begin
        If xRec."Salesperson Code" <> rec."Salesperson Code" then begin
            IF CONFIRM(Text0001) THEN begin
                RecLSalesLine.RESET;
                RecLSalesLine.SETRANGE("Document Type", Rec."Document Type");
                RecLSalesLine.SETRANGE("Document No.", Rec."No.");
                RecLSalesLine.LOCKTABLE;
                IF Not RecLSalesLine.IsEmpty then begin
                    RecLSalesLine.FindSet();
                    REPEAT
                        RecLSalesLine.validate("Salesperson Code", Rec."Salesperson Code");
                        RecLSalesLine.MODIFY;
                    UNTIL RecLSalesLine.NEXT = 0;
                end;
            end;
        end;
    end;

    local procedure "---Tab37---"()
    begin
    end;

    [EventSubscriber(ObjectType::table, 37, 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterInsert_T37(VAR Rec: Record "Sales Line"; RunTrigger: Boolean)
    var
        RecLSalesHeader: Record "Sales Header";
    begin
        if RunTrigger then
            IF RecLSalesHeader.get(rec."Document Type", rec."Document No.") then begin
                rec."Salesperson Code" := RecLSalesHeader."Salesperson Code";
                rec."Salesperson Code 2" := RecLSalesHeader."Salesperson Code 2";
            end;
    end;

    local procedure "---Cdu81---"()
    begin
    end;

    [EventSubscriber(ObjectType::codeunit, 81, 'OnAfterPost', '', false, false)]
    local procedure OnAfterPost_Cdu81(var SalesHeader: Record "Sales Header")
    begin
        CduGPSIFunctionsMgt.FctOnAfterPost_SalesPostYesNo(SalesHeader);
    end;

    local procedure "---Cdu5763---"()
    begin
    end;

    [EventSubscriber(ObjectType::codeunit, 5763, 'OnAfterRun', '', false, false)]
    local procedure OnAfterRun_Cdu5763(VAR WarehouseShipmentLine: Record "Warehouse Shipment Line")
    var
        RecLSalesHeader: Record "Sales Header";
    begin
        if WarehouseShipmentLine."Source Document" = WarehouseShipmentLine."Source Document"::"Sales Order" then begin
            IF RecLSalesHeader.get(RecLSalesHeader."Document Type"::Order, WarehouseShipmentLine."Source No.") then
                CduGPSIFunctionsMgt.FctOnAfterPost_SalesPostYesNo(RecLSalesHeader);
        end;
    end;

    local procedure "---Cdu5815---"()
    begin
    end;

    [EventSubscriber(ObjectType::codeunit, 5815, 'OnAfterUpdateSalesLine', '', false, false)]
    local procedure OnAfterUpdateSalesLine_Cdu5815(VAR SalesLine: Record "Sales Line"; VAR SalesShptLine: Record "Sales Shipment Line")
    var
        RecLSalesLine: Record "Sales Line";
        RecLSalesHeader: record "sales header";
    begin
        IF SalesLine."Document Type" = SalesLine."Document Type"::Order then
            IF RecLSalesHeader.get(SalesLine."Document Type", SalesLine."Document No.") then
                CduGPSIFunctionsMgt.FctOnAfterPost_SalesPostYesNo(RecLSalesHeader);
    end;


}
