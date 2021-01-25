pageextension 60007 "PostedSalesCreditMemoExt" extends "Posted Sales Credit Memo" //134
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
