pageextension 60013 "SalesCrMemoSubformExt" extends "Sales Cr. Memo Subform" //96
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
