page 60000 "Get Sales Lines"
{
    Caption = 'Get Sales Lines', Comment = 'FRA="Extraire ligne de vente"';
    PageType = List;
    SourceTable = "Sales Line";
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Document Type"; "Document Type")
                {
                    ApplicationArea = All;
                }
                field("Document No."; "Document No.")
                {
                    ApplicationArea = All;
                }
                field(Type; Type)
                {
                    ApplicationArea = All;
                }
                field("No."; "No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    var
        CduGPSIFunctionsMgt: Codeunit "PSI Functions Mgt";
        CodGTransferOrderNo: Code[20];

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        IF CloseAction IN [ACTION::OK, ACTION::LookupOK] THEN begin
            CurrPage.SetSelectionFilter(Rec);
            CreateSalesLines(Rec);
        end;
        //FctCreateLines;
    end;

    procedure FctCreateLines()
    begin
        CurrPage.SetSelectionFilter(Rec);
        CreateSalesLines(Rec);
    end;

    procedure CreateSalesLines(var SalesLines: Record "Sales Line")
    var
        RecLTransferLine: Record "Transfer Line";
        NextLineNo: Integer;
    begin
        with SalesLines do begin
            if FindSet() then begin
                repeat
                    RecLTransferLine.SetRange("Document No.", CodGTransferOrderNo);
                    IF RecLTransferLine.FindLast() then
                        NextLineNo := RecLTransferLine."Line No." + 10000
                    else
                        NextLineNo := 10000;

                    RecLTransferLine.init();
                    RecLTransferLine."Document No." := CodGTransferOrderNo;
                    RecLTransferLine."Line No." := NextLineNo;
                    RecLTransferLine.validate("Item No.", "No.");
                    RecLTransferLine.Validate(Quantity, Quantity);
                    RecLTransferLine.Insert()
                until Next() = 0;
            end;
        end;
    end;

    procedure SetTransferOrder(TransferOrderNo: code[20])
    begin
        CodGTransferOrderNo := TransferOrderNo;
    end;

}
