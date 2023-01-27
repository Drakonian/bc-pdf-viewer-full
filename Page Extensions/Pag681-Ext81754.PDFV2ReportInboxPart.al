pageextension 81754 "PDFV2 Report Inbox Part" extends "Report Inbox Part" //681
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
                Enabled = Rec."Output Type" = Rec."Output Type"::PDF;
                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    PDFViewer: Page "PDFV2 PDF Viewer";
                    PDFOutStream: OutStream;
                    PDFInStream: InStream;
                begin
                    TempBlob.CreateOutStream(PDFOutStream, TextEncoding::UTF8);
                    Rec."Report Output".CreateOutStream(PDFOutStream);
                    TempBlob.CreateInStream(PDFInStream, TextEncoding::UTF8);
                    PDFViewer.SetPDFDocument(PDFInStream);
                    PDFViewer.Run();
                end;
            }
        }
    }
}
