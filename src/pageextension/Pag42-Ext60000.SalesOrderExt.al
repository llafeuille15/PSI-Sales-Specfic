pageextension 60000 "SalesOrderExt" extends "Sales Order" //42
{
    layout
    {
        addafter(Status)
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
