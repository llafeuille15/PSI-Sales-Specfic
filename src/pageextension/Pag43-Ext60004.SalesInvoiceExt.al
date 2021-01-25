pageextension 60004 "SalesInvoiceExt" extends "Sales Invoice" //43
{
    layout
    {
        addafter("Salesperson Code")
        {
            field("Salesperson Code 2"; "Salesperson Code 2")
            {
                ApplicationArea = all;
            }
        }
    }
}
