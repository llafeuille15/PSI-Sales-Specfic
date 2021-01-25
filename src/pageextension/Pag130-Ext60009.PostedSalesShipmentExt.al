pageextension 60009 "PostedSalesShipmentExt" extends "Posted Sales Shipment" //130
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
