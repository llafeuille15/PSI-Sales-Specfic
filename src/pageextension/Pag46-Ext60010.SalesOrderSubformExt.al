pageextension 60010 "SalesOrderSubformExt" extends "Sales Order Subform" //46
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
