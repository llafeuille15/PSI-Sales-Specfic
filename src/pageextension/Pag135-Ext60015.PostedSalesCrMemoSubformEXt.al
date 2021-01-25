pageextension 60015 "PostedSalesCrMemoSubformEXt" extends "Posted Sales Cr. Memo Subform" //135
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
