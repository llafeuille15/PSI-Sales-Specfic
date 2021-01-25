pageextension 60016 "PostedSalesShptSubformExt" extends "Posted Sales Shpt. Subform" //131
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
