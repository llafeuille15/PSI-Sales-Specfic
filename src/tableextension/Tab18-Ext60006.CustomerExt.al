tableextension 60006 "CustomerExt" extends Customer //18
{
    fields
    {
        field(60001; "Salesperson Code 2"; code[20])
        {
            Caption = 'Salesperson Code 2', Comment = 'FRA="Code vendeur 2"';
            TableRelation = "Salesperson/Purchaser";
            trigger OnValidate()
            var
                SalespersonPurchaser: Record 13;
            begin
                IF "Salesperson Code 2" <> '' THEN
                    IF SalespersonPurchaser.GET("Salesperson Code") THEN
                        IF SalespersonPurchaser.VerifySalesPersonPurchaserPrivacyBlocked(SalespersonPurchaser) THEN
                            ERROR(SalespersonPurchaser.GetPrivacyBlockedGenericText(SalespersonPurchaser, TRUE))
            end;
        }
    }
}
