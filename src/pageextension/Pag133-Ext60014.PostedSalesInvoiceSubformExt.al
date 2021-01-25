pageextension 60014 "PostedSalesInvoiceSubformExt" extends "Posted Sales Invoice Subform" //133
{
    layout
    {
        addbefore("Shortcut Dimension 1 Code")
        {
            field("Salesperson Code"; "Salesperson Code")
            {
                ApplicationArea = all;
            }
            field("Salesperson Code 2"; "Salesperson Code 2")
            {
                ApplicationArea = all;
            }
        }
    }
}
