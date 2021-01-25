pageextension 60008 "TransferOrderSubformExt" extends "Transfer Order Subform" //5741
{
    actions
    {
        addafter("Item &Tracking Lines")
        {
            action(GetSalesLines)
            {
                Caption = 'Get Sales Lines', Comment = 'FRA="Extraire ligne de vente"';
                ApplicationArea = All;
                Ellipsis = true;
                Image = Order;
                trigger OnAction()
                var
                    CduGPSIFunctionsMgt: Codeunit "PSI Functions Mgt";
                begin
                    CduGPSIFunctionsMgt.GetSalesLines("Document No.");
                end;
            }
        }
    }
}
