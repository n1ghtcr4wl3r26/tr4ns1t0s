function validarepxAP() {
  f=document.forms[1];
  var Mensaje="";

  if (! foFecha(f.i_fecha.value))
    Mensaje=Mensaje + "Ingrese la Fecha Partida de Inicio valida. \n";

  if (! foFecha(f.d_fecha.value))
    Mensaje=Mensaje + "Ingrese la Fecha Partida de Finalización Salida. \n";

  if (Mensaje=="") {
    var fecini=fFormato(f.i_fecha.value, "00:00");
    var fecfin=fFormato(f.d_fecha.value, "00:00");
    if (fcFechas(fecini, fecfin))
      Mensaje=Mensaje + "La fecha de inicio debe ser menor a la fecha de finalización\n";
  }
  if (f.check1.checked==false && f.check2.checked==false && f.check3.checked==false && f.check4.checked==false && f.check5.checked==false)
    Mensaje=Mensaje + "Debe seleccionar al menos un estado. \n";
  
  if(Mensaje=="") {
    return true;
  } else {  
    alert (Mensaje);
    return false;
  }
}