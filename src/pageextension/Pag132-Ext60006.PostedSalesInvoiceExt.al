pageextension 60006 "PostedSalesInvoiceExt" extends "Posted Sales Invoice" //132
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
