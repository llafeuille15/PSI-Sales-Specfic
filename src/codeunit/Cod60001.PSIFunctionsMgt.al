codeunit 60001 "PSI Functions Mgt"
{
    var
        PagGGetSalesLines: page "Get Sales Lines";

    local procedure "---Tab36---"()
    begin
    end;

    procedure FctOnAfterSetFieldsBilltoCustomer_T36(VAR SalesHeader: Record "Sales Header"; Customer: Record Customer)
    var
        Salesperson: record 13;
    begin
        IF Customer."Salesperson Code 2" <> '' THEN BEGIN
            IF Salesperson.GET(Customer."Salesperson Code 2") THEN
                IF Salesperson.VerifySalesPersonPurchaserPrivacyBlocked(Salesperson) THEN
                    SalesHeader."Salesperson Code 2" := ''
                ELSE
                    SalesHeader."Salesperson Code 2" := Customer."Salesperson Code 2";
        END ELSE
            SalesHeader."Salesperson Code 2" := '';
    end;

    local procedure "---Cdu81--"()
    begin
    end;

    procedure FctOnAfterPost_SalesPostYesNo(var SalesHeader: Record "Sales Header")
    var
        DecLTotalQuantity: Decimal;
        DecLTotalQuantityShipped: Decimal;
        RecLSalesLine: Record "Sales Line";
    begin
        IF SalesHeader."Document Type" = SalesHeader."Document Type"::Order THEN BEGIN
            DecLTotalQuantity := 0;
            DecLTotalQuantityShipped := 0;
            RecLSalesLine.SETRANGE("Document Type", SalesHeader."Document Type");
            RecLSalesLine.SETRANGE("Document No.", SalesHeader."No.");
            RecLSalesLine.SETRANGE(Type, RecLSalesLine.Type::Item);
            RecLSalesLine.SETRANGE("Drop Shipment", true);
            IF NOT RecLSalesLine.ISEMPTY THEN BEGIN
                RecLSalesLine.FINDSET;
                REPEAT
                    DecLTotalQuantity += RecLSalesLine.Quantity;
                    DecLTotalQuantityShipped += RecLSalesLine."Quantity Shipped";
                UNTIL RecLSalesLine.NEXT = 0;

                IF DecLTotalQuantityShipped = 0 THEN
                    SalesHeader."Shipment Status" := SalesHeader."Shipment Status"::Undelivred
                ELSE
                    IF (DecLTotalQuantityShipped > 0) AND (DecLTotalQuantity > DecLTotalQuantityShipped) THEN
                        SalesHeader."Shipment Status" := SalesHeader."Shipment Status"::Partial
                    ELSE
                        IF DecLTotalQuantity = DecLTotalQuantityShipped THEN
                            SalesHeader."Shipment Status" := SalesHeader."Shipment Status"::Total;

                SalesHeader.MODIFY;
            END;
        END;
    end;

    local procedure "---Pag5741--"()
    begin
    end;

    procedure GetSalesLines(CodPTransferOrderNo: code[20])
    var
        RecLSalesLines: Record "Sales Line";
    begin
        RecLSalesLines.SetRange("Document Type", RecLSalesLines."Document Type"::Order);
        RecLSalesLines.SetRange(Type, RecLSalesLines.Type::Item);

        PagGGetSalesLines.SetTransferOrder(CodPTransferOrderNo);
        PagGGetSalesLines.SetTableView(RecLSalesLines);
        PagGGetSalesLines.LookupMode := true;
        if PagGGetSalesLines.RunModal() <> Action::Cancel then;
    end;
}
