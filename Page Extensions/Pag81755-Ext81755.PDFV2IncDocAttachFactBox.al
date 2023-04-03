pageextension 81755 "PDFV2 Inc.Doc.Attach.FactBox" extends "Incoming Doc. Attach. FactBox" //81755
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
                ToolTip = 'View the PDF document.';
                Scope = Repeater;
                Enabled = Rec."File Extension" = 'pdf';
                trigger OnAction()
                var
                    IncomingDocumentAttachment: Record "Incoming Document Attachment";
                    TempBlob: Codeunit "Temp Blob";
                    PDFViewer: Page "PDFV2 PDF Viewer";
                    PDFOutStream: OutStream;
                    PDFInStream: InStream;
                begin
                    TempBlob.CreateOutStream(PDFOutStream, TextEncoding::UTF8);
                    if IncomingDocumentAttachment.Get(Rec."Incoming Document Entry No.", Rec."Line No.") then begin
                        IncomingDocumentAttachment.CalcFields(Content);
                        IncomingDocumentAttachment.Content.CreateInStream(PDFInStream, TextEncoding::UTF8);
                    end;
                    PDFViewer.SetPDFDocument(PDFInStream);
                    PDFViewer.Run();
                end;
            }
        }
    }
}
