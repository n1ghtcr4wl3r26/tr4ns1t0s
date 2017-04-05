function fEvalua( ) {
  f=document.forms[1];
  if(!fTrim(f.etiqueta.value)) {
    alert('Error:\n- Tiene que ingresar los datos leidos por el lector.');
    return false;
  }
  return true;
}
