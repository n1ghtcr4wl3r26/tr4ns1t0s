function validarep() {
    f = document.forms[1];
    var Mensaje = "";
    var sw = "0";
    var sw2 = "0";
    
    if (!foFecha(f.i_fecha.value))
        Mensaje = Mensaje + "Ingrese la Fecha Partida de Inicio valida. \n";

    if (!foFecha(f.d_fecha.value))
        Mensaje = Mensaje + "Ingrese la Fecha Partida de Finalización Salida. \n";
        
    if (Mensaje == "") {
        var fecini = fFormato(f.i_fecha.value, "00:00");
        var fecfin = fFormato(f.d_fecha.value, "00:00");
        if (fcFechas(fecini, fecfin)){
            Mensaje = Mensaje + "La fecha de inicio debe ser menor a la fecha de finalización\n";
        } else {
            var ddi = f.i_fecha.value.substring( 0,  2);
            var mmi = f.i_fecha.value.substring( 3,  5);
            var aai = f.i_fecha.value.substring( 6, 10);
            
            var ddf = f.d_fecha.value.substring( 0,  2);
            var mmf = f.d_fecha.value.substring( 3,  5);
            var aaf = f.d_fecha.value.substring( 6, 10);
            
            var fechini = new Date(aai, mmi, ddi);
            var fechfin = new Date(aaf, mmf, ddf);
            var msecPerMinute = 1000 * 60;
            var msecPerHour = msecPerMinute * 60;
            var msecPerDay = msecPerHour * 24;
            
            var interval = fechfin - fechini;
            var days = Math.floor(interval / msecPerDay );
            if(days > 31){
                if ((f.i_aduana.value == f.d_aduana.value) && f.i_aduana.value == '%'){
                    Mensaje = Mensaje + "Tiene que seleccionar Aduana de Partida o Destino. \n";
                }
            }
        }    
    }
    if (f.check1.checked == false && f.check2.checked == false && f.check3.checked == false && f.check4.checked == false && f.check5.checked == false && f.check6.checked == false)
        Mensaje = Mensaje + "Debe seleccionar al menos un estado. \n";

    if (Mensaje == "") {
        return true;
    }
    else {
        alert(Mensaje);
        return false;
    }
}