page 81751 "PDFV2 PDF Viewer"
{
    Caption = 'PDF Viewer';
    PageType = Card;
    UsageCategory = None;
    layout
    {
        area(content)
        {
            group(General)
            {
                ShowCaption = false;
                usercontrol(PDFViewer; "PDFV2 PDF Viewer")
                {
                    ApplicationArea = All;

                    trigger ControlAddinReady()
                    begin
                        CurrPage.PDFViewer.LoadPDF(PDFAsTxt, false);
                    end;
                }
            }
        }
    }
    procedure SetPDFDocument(PDFInStream: InStream)
    var
        Base64Convert: Codeunit "Base64 Convert";
    begin
        PDFAsTxt := Base64Convert.ToBase64(PDFInStream);
    end;

    var
        PDFAsTxt: Text;
        PDFAliasLbl: Label 'data:application/pdf;base64,', Locked = true;
}
