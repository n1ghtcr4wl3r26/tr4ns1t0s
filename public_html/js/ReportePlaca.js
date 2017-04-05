function fEvalua() {
  f=document.forms[1];
  var Mensaje=""; 
  var sw="0";
  var sw2="0";

  if(!fTrim(f.p_medio.value))
    Mensaje=Mensaje + "Medio de Transporte (Placa).\n";
  if (! foFecha(f.i_fecha.value))
    Mensaje=Mensaje + "Ingrese la Fecha Partida de Inicio valida.\n";
  if (! foFecha(f.d_fecha.value))
    Mensaje=Mensaje + "Ingrese la Fecha Partida de Finalización Salida.\n";
  if (Mensaje=="") {
    var fecini=fFormato(f.i_fecha.value, "00:00");
    var fecfin=fFormato(f.d_fecha.value, "00:00");
    if (fcFechas(fecini, fecfin))
      Mensaje=Mensaje + "La Fecha Inicial debe ser menor a la Fecha Final.\n";
  }
  if(Mensaje=="") {
    return true;
  } else {  
    alert ('Corrija los siguientes errores para continuar:\n'+Mensaje);
    return false;
  }
}