var d_ges;
var d_adu;
var d_num;
function salida(val){
    var f=document.forms["CarpetaDeclaracionForm"];
    f.opcion.value='0';
    f.submit();
}
function fNumero( texto )
{
  var mascara = new RegExp("^[0-9]{0,150}$","g");
  return mascara.test( texto )
}
function fEvalua(opcion){
    var f=document.getElementById("frm_man");
    var msg="";
    if(f.car_reg_year.value=='' || f.car_reg_year.value.length != 4) msg=msg + 'Gesti\u00F3n obligatorio formato aaaa\n';
    if(!fNumero(f.car_reg_year.value)) msg=msg + 'Gesti\u00F3n obligatorio formato aaaa num\u00E9rico\n';
    if(f.car_reg_nber.value == '') msg=msg + 'N\u00FAmero registro obligatorio\n';    
    if(!fNumero(f.car_reg_nber.value)) msg=msg + 'N\u00FAmero registro obligatorio num\u00E9rico\n';    
    if(msg!="")
    {
      msg="Lista de Errores: \n\n" + msg
      alert(msg);
      return false;
    }
    
    return true;
}

