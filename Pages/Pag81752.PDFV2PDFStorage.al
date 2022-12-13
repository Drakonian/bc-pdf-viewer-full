page 81752 "PDFV2 PDF Storage"
{

    ApplicationArea = All;
    Caption = 'PDF Storage';
    PageType = List;
    SourceTable = "PDFV2 PDF Storage";
    UsageCategory = Lists;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("PDFV2 View PDF")
            {
                ApplicationArea = All;
                Image = Text;
                Caption = 'View PDF';
                ToolTip = 'View PDF';
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    PDFViewer: Page "PDFV2 PDF Viewer";
                    PDFInStream: InStream;
                begin
                    Rec.CalcFields("PDF Value");

                    if not Rec."PDF Value".HasValue() then
                        exit;
                    Rec."PDF Value".CreateInStream(PDFInStream);
                    PDFViewer.SetPDFDocument(PDFInStream);
                    PDFViewer.Run();
                end;
            }
            action(UploadContent)
            {
                ApplicationArea = All;
                Image = MoveUp;
                Caption = 'Upload';
                ToolTip = 'Upload';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    PDFStorage: Record "PDFV2 PDF Storage";
                    SourceRecordID: RecordId;
                begin
                    if Rec.GetFilter("Source Record ID") <> '' then
                        Evaluate(SourceRecordID, Rec.GetFilter("Source Record ID"));
                    PDFStorage.UploadContent(SourceRecordID);
                    CurrPage.Update(true);
                end;
            }

            action(DownloadContent)
            {
                ApplicationArea = All;
                Image = MoveDown;
                Caption = 'Download';
                ToolTip = 'Download';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    Rec.DownloadContent();
                    CurrPage.Update(true);
                end;
            }
        }

    }

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.Update(true);
    end;

}
