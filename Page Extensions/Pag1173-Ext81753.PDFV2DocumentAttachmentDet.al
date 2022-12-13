pageextension 81753 "PDFV2 Document Attachment Det" extends "Document Attachment Details" //1173
{
    actions
    {
        addlast(processing)
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
                Enabled = Rec."File Extension" = 'pdf';
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    PDFViewer: Page "PDFV2 PDF Viewer";
                    PDFOutStream: OutStream;
                    PDFInStream: InStream;
                begin
                    TempBlob.CreateOutStream(PDFOutStream, TextEncoding::UTF8);
                    Rec."Document Reference ID".ExportStream(PDFOutStream);
                    TempBlob.CreateInStream(PDFInStream, TextEncoding::UTF8);
                    PDFViewer.SetPDFDocument(PDFInStream);
                    PDFViewer.Run();
                end;
            }
        }
    }
}
