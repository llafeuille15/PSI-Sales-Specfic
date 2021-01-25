tableextension 60001 "SalesShipmentHeaderExt" extends "Sales Shipment Header" //110
{
    fields
    {
        field(60001; "Salesperson Code 2"; code[20])
        {
            Caption = 'Salesperson Code 2', Comment = 'FRA="Code vendeur 2"';
            TableRelation = "Salesperson/Purchaser";
        }
    }
}
