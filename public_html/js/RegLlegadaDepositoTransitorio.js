function envia() {
    var Mensaje = "";
    var f = document.forms["RegLlegDepositoTransitorioForm"];
    var o = f.file_manifiesto.value;
    
    if(f.car_reg_year.value == ""){
        Mensaje += "'Gesti\u00f3n' es obligatorio.\n";
    }
    else{
        if (!fNumero(f.car_reg_year.value)) {
            Mensaje += "'Gesti\u00f3n' debe ser un n\372mero.\n";
        }
    }
    
    if (f.key_cuo.value == "") 
        Mensaje += "'Aduana' es obligatorio.\n";
    
    if(f.car_reg_nber.value == "") {
        Mensaje += "'N\u00famero de Registro' es obligatorio.\n";
    }
    else{
        if (!fNumero(f.car_reg_nber.value)) {
            Mensaje += "'N\u00famero de Registro' debe ser un n\372mero.\n";
        }
    }
                                       
    if (!fTrim(f.file_manifiesto.value)) {
        Mensaje = Mensaje + "'Manifiesto digitalizado' es obligatorio.\n";
    }
    else {
        if (o.substr(o.lastIndexOf(".")).toLowerCase() != ".pdf")
            Mensaje = Mensaje + "Seleccione el documento 'manifiesto digitalizado' en formato PDF.\n";
    }
    if (f.cod_depositoTransitorio.value == "") 
        Mensaje += "'Dep\u00f3sito Transitorio' es obligatorio.\n";    

    if (Mensaje != "") {                    
        alert(Mensaje);
        return false;
    }
    else {
        f.boton.value = "GRABAR";
        f.submit();
    }
}

function validarTecla(evento, tipo) {
    var permitidos = "";
    // izq(37), arr(38), der(39), aba(40), fin(35), inicio(36), backSpace(8), tabulador(9), enter(13), supr(46)
    var teclas_especiales = [8, 37, 39, 46, 35, 36, 38, 40, 13, 9];
    var alfabeto = "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ";//"abcdefghijklmnñopqrstuvwxyz ABCDEFGHIJKLMNÑOPQRSTUVWXYZáéíóú??É??ÓÚüÜ"
    var numero = "0123456789";
    if (tipo==="NIT") {
        permitidos = numero;
    }else if (tipo==="NUMERO") {
        permitidos = numero;        
    } else if (tipo==="CI") { // en uso
        permitidos = alfabeto + numero;
    } else if (tipo==="TELEFONO") { // en uso
        permitidos = numero;
    } else if (tipo==="FAX") { // en uso
        permitidos = numero +"(" + ")" + "-";
    } else if (tipo==="FECHA") { // en uso
        permitidos = numero+"/";
    } else if (tipo==="CADENA") { // en uso
        permitidos = alfabeto+"-_*+.;ª!$%& ()=?¿"+numero;
    } else {
        return false;
    }
    // obtenemos la tecla pulsada
    var evn = evento || window.event;
    var codigoCaracter = evn.charCode || evn.keyCode;
    var caracter = String.fromCharCode(evn.charCode);
    // comprobamos si es una tecla especial
    if (evn.charCode===0) {
        for (var i in teclas_especiales) {
            if (evn.keyCode===teclas_especiales[i]) {
                return true;
            }
        }
        return false;
    }
    // comprobamos si la tecla es permitido
    if (permitidos.indexOf(caracter) >= 0) {
        return true;
    } else {
        return false;
    }
}
