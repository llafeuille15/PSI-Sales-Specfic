tableextension 60012 "ReturnReceiptLineExt" extends "Return Receipt Line" //6661
{
    fields
    {
        field(60000; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code', Comment = 'FRA="Code vendeur"';
            TableRelation = "Salesperson/Purchaser";
            Editable = false;
        }
        field(60001; "Salesperson Code 2"; code[20])
        {
            Caption = 'Salesperson Code 2', Comment = 'FRA="Code vendeur 2"';
            TableRelation = "Salesperson/Purchaser";
            Editable = false;
        }
    }
}
