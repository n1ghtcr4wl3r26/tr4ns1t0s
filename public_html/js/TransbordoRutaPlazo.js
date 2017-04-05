function fEvalua()
{
  var Mensaje="";
  f=document.forms[0];

  if(bCancel==true) return true;

  if(! fTrim(f.aduanacierre.value))
    Mensaje=Mensaje + "'Aduana de Llegada' es obligatorio\n";
  if(! foFecha(f.fecha.value))
    Mensaje=Mensaje + "'Fecha de Llegada' es obligatorio o tiene valores que no son correctos (DD/MM/AAAA)\n";
  if(! foHora(f.hora.value))
    Mensaje=Mensaje + "'Hora de Llegada' es obligatorio o tiene valores que no son correctos (HH:MM; HH:00~23;MM:00~59)\n";
  if(Mensaje=="") {
    var fecing=fFormato(f.fecha.value, f.hora.value);
    if(fcFechas(fecing, fActual))
      Mensaje=Mensaje + "'Fecha y Hora de Llegada' no puede ser superior a la fecha de Hoy: " + pConvierteFecha(fActual) + "\n";
    if(fcFechas(fPartida, fecing))
      Mensaje=Mensaje + "'Fecha y Hora de Llegada' no puede ser inferior a la fecha de Partida: " + pConvierteFecha(fEstimada) + "\n";
  }

    f.placa.value=fUpper(f.placa.value);
    if(! foNumero(f.codtrans.value))
      Mensaje=Mensaje + "'Empresa Transportista' es obligatorio o tiene valores que no son correctos\n";
    if(! foLetraNumero(f.placa.value))
      Mensaje=Mensaje + "'Placa del Medio de Transporte' es obligatorio o tiene valores que no son correctos\n";
    if(f.aduana.value==adudes)
      Mensaje=Mensaje + "'Aduana Llegada y Tipo de Cierre' incompatibles\n";
  
   if(! fTrim(f.aduanades.value))
    Mensaje=Mensaje + "'Aduana de Destino' es obligatorio\n";

  if(Mensaje=="") {
    if(f.tipo.value != 24)
      Mensaje="'Tipo de Cierre' todos los Documentos de Embarque se CONCLUIRAN con la Aduana, Fecha y Hora Indicada\n";
    return confirm(Mensaje + 'Est\341 seguro de continuar, una vez procesado no se podr\341 revertir.');
  } else {
    alert(Mensaje);
    return false;
  }
}

function fdHora(fecha, hora) {
  f=document.forms[0];
  var fReg=fFormato(fecha, hora);

  if(! fFecha(fecha)) {
    alert("'Fecha de Llegada' tiene valores que no son correctos (DD/MM/AAAA)\n");
    return 0;
  }
  if(! fHora(hora)) {
    alert("'Hora de Llegada' tiene valores que no son correctos (HH:MM; HH:00~23;MM:00~59)");
    return 0;
  }
  
  if(fReg<=fEstimada) {
    f.retraso.value="";
    return 0;
  }
  
  var dEstimada=new Date(
    fEstimada.substring(0, 4),
    fEstimada.substring(4, 6)-1,
    fEstimada.substring(6, 8),
    fEstimada.substring(8,10),
    fEstimada.substring(10,12)
  );
  
  var dIngreso=new Date(
    fReg.substring(0, 4),
    fReg.substring(4, 6)-1,
    fReg.substring(6, 8),
    fReg.substring(8,10),
    fReg.substring(10,12)
  );

  var tiempoRestante=dIngreso.getTime() - dEstimada.getTime();

  if(tiempoRestante > 0) {
    var bNegativo="";
  } else {
    tiempoRestante=Math.abs(tiempoRestante);
    bNegativo="-";
  }
  var horas=Math.floor(tiempoRestante / 3600000);
  tiempoRestante=Math.abs(tiempoRestante) - (Math.abs(horas) * 3600000);
  var minutos=tiempoRestante / (60000);

  f.retraso.value=((bNegativo) + horas + ":" + minutos);
}