pageextension 60001 "SalesOrderListExt" extends "Sales Order List" //9305
{
    layout
    {
        modify("Salesperson Code")
        {
            Visible = true;
        }
        addbefore("No.")
        {
            field("Shipment Status"; "Shipment Status")
            {
                ApplicationArea = all;
            }
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
