tableextension 60004 "SalesHeaderArchiveExt" extends "Sales Header Archive" //5107
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
