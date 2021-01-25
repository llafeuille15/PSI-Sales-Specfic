tableextension 60003 "SalesCrMemoHeaderExt" extends "Sales Cr.Memo Header" //114
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
