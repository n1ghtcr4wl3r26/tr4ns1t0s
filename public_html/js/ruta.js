function fEvalua() {
  var Mensaje="";
  f=document.forms[0];

  if(bCancel==true)
    return bCancel;

  if(f.p_cuo_sal.value=="")
    Mensaje=Mensaje + "'Aduana de Salida' es obligatorio\n";
  if(f.p_cuo_arr.value=="")
    Mensaje=Mensaje + "'Aduana de Llegada' es obligatorio\n";
  if(Mensaje=="") {
    if(f.p_cuo_sal.value==f.p_rou_mod.value)
      Mensaje=Mensaje + "'Aduana de Salida y Aduana de Llegada' no pueden ser iguales \n'";
  }
  if(f.p_rou_mod.value=="")
    Mensaje=Mensaje + "'Tipo de Ruta' es obligatorio\n";
  if(! foNumero(f.p_rou_ter.value))
    Mensaje=Mensaje + "'Tiempo de Recorrido' es obligatorio o tiene valores que no son correctos\n";
  if(Mensaje=="") {
    var i=f.p_cuo_sal.selectedIndex;
    var j=f.p_cuo_arr.selectedIndex;
    f.p_des.value=f.p_cuo_sal.options[ i ].text.substring(5) +
      " - " + f.p_cuo_arr.options[ j ].text.substring(5);

    return true;
  } else {
    bCancel=false;
    Mensaje="Lista de Errores Ruta(s)\n" + Mensaje
    alert(Mensaje);
    return false;
  }
}