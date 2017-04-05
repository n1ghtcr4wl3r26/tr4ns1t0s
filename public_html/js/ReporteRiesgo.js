function validarep() {
  f=document.forms[1];
  var Mensaje=""; 
  var sw="0";
  var sw2="0";

  if (! foFecha(f.i_fecha.value))
    Mensaje=Mensaje + "Fecha de Registro de Manifiesto - desde. \n";
    
  if (! foFecha(f.d_fecha.value))
    Mensaje=Mensaje + "Fecha de Registro de Manifiesto - hasta. \n";
    
  if (Mensaje == "") {
    var fecini=fFormato(f.i_fecha.value, "00:00");
    var fecfin=fFormato(f.d_fecha.value, "00:00");
    if (fcFechas(fecini, fecfin))
      Mensaje=Mensaje + "La fecha de inicio debe ser menor a la fecha de finalización\n";
  }
    
  
  if(Mensaje == "") {
    return true;
  } else {  
    alert (Mensaje);
    return false;
  }
}