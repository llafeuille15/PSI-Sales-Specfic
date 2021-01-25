pageextension 60017 "CustomerListExt" extends "Customer List" //22
{
    layout
    {
        modify("Salesperson Code")
        {
            Visible = true;
        }

        addafter("Salesperson Code")
        {
            field("Salesperson Code 2"; "Salesperson Code 2")
            {
                ApplicationArea = all;
            }
        }
    }
}
