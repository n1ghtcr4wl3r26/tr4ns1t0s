function validarep() {
  f=document.forms[1];
  var Mensaje=""; 
  var sw="0";
  var sw2="0";

  if((f.i_aduana.value == f.d_aduana.value) && f.i_aduana.value == '%')
    Mensaje=Mensaje + "Tiene que seleccionar Aduana de Partida o Destino. \n";
  if (! foFecha(f.i_fecha.value))
    Mensaje=Mensaje + "Ingrese la Fecha Partida de Inicio válida. \n";
  if (! foFecha(f.d_fecha.value))
    Mensaje=Mensaje + "Ingrese la Fecha Partida de Finalización Salida. \n";
  if (Mensaje == "") {
    var fecini=fFormato(f.i_fecha.value, "00:00");
    var fecfin=fFormato(f.d_fecha.value, "00:00");
    if (fcFechas(fecini, fecfin))
      Mensaje=Mensaje + "La fecha de inicio debe ser menor a la fecha de finalización\n";
    if (fcFechasPuerto(fecini, fecfin))
      Mensaje=Mensaje + "El rango de fechas a buscar no puede ser mayor a 5 días\n";
    
 
  }
  
  
  
  if(Mensaje == "") {
    return true;
  } else {
  
  Mensaje = "Reporte de Tránsitos de Puerto \n\n" +Mensaje;
  Mensaje = "SISTEMA WEB TRANSITOS. \n" +Mensaje;
    alert (Mensaje);
    return false;
  }
}


function fcFechasPuerto( fecinf, fecsup )
{
  if( fecsup - fecinf > 50000 )
    return true;
  else
    return false;
}

function fFormatofecha( fecha, hora )
{
  var fReg = fecha.substring( 6, 10) + fecha.substring( 3, 5) + fecha.substring( 0, 2) + hora.substring( 0, 2) + hora.substring( 3, 5);
  return fReg;
}