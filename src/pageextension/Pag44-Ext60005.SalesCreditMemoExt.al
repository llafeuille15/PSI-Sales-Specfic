pageextension 60005 "SalesCreditMemoExt" extends "Sales Credit Memo" //44
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
