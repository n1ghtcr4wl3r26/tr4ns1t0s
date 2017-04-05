function fEvalua() {
  var Mensaje = "";
  f = document.forms[1];

  if(bCancel==true) return true;

  if(! fNumero(f.nit.value))
    Mensaje = Mensaje + "'Identificación Empresa (NIT)' tiene valores que no son correctos\n";
  if(Mensaje=="") {
    return true;
  } else {
    alert(Mensaje);
    return false;
  }
}
