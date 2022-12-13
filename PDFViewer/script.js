function InitializeControl(controlId) {
    var controlAddIn = document.getElementById(controlId);
    controlAddIn.innerHTML ='<div id="my-pdf"></div>';
}

function SetVisible(IsVisible) {
    if (IsVisible){
        document.querySelector("#my-pdf").style.display = 'block';
    }else{
        document.querySelector("#my-pdf").style.display = 'none';
    }

}

function LoadPDF(PDFDocument,IsFactbox){
    var iframe = window.frameElement;

    requestAnimationFrame(() => {

        PDFObject.embed(PDFDocument, "#my-pdf");

        iframe.style.maxHeight = 1100 + 'px';
        iframe.style.height =  1100 + 'px';
    });
}

