tableextension 60005 "ReturnReceiptHeaderExt" extends "Return Receipt Header" //6660
{
    fields
    {
        field(60001; "Salesperson Code 2"; code[20])
        {
            Caption = 'Salesperson Code 2', Comment = 'FRA="Code vendeur 2"';
            TableRelation = "Salesperson/Purchaser";
        }
    }
}
