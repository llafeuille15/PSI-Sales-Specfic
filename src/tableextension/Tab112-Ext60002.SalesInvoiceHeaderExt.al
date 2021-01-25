tableextension 60002 "SalesInvoiceHeaderExt" extends "Sales Invoice Header" //112
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
