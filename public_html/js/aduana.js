function fEvalua() {
  var Mensaje = "";
  f = document.forms[0];

  if(bCancel==true) return true;

  if(! fTrim(f.aduana.value))
    Mensaje = Mensaje+"'Aduana Destino' es obligatorio\n";

  if(Mensaje=="") {
    return true;
  } else {
    alert(Mensaje);
    return false;
  }
}
