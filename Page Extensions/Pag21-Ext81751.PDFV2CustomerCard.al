pageextension 81751 "PDFV2 Customer Card" extends "Customer Card"//21
{
    actions
    {
        addfirst(processing)
        {
            action("PDFV2 PDFStorage")
            {
                ApplicationArea = All;
                Image = Database;
                Caption = 'PDF Storage';
                ToolTip = 'PDF Storage';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    PDFStorage: Record "PDFV2 PDF Storage";
                    PDFStorageList: Page "PDFV2 PDF Storage";
                begin
                    Clear(PDFStorageList);
                    PDFStorage.SetRange("Source Record ID", Rec.RecordId());
                    PDFStorageList.SetTableView(PDFStorage);
                    PDFStorageList.Run();
                end;
            }
        }
    }

}