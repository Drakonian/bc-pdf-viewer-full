permissionset 81751 "PDFV2 PDF Viewer"
{
    Assignable = true;
    Caption = 'PDF Viewer', MaxLength = 30;
    Permissions =
        table "PDFV2 PDF Storage" = X,
        tabledata "PDFV2 PDF Storage" = RMID,
        page "PDFV2 PDF Viewer" = X,
        page "PDFV2 PDF Storage" = X;
}
