function fEvalua() {

    var	today =	new	Date();
    var	yearNow	 = today.getFullYear() + 1;


  var Mensaje="";
  f=document.forms[1];

  if(bCancel==true) return true;

  if(!foNumero(f.gestion.value)) {
    Mensaje=Mensaje + "'Gestión' es obligatorio o tiene valores que no son correctos\n";
  } else {
    if((f.gestion.value < 2006) || (f.gestion.value > yearNow))
      Mensaje=Mensaje + "'Gestión tiene valores que no son correctos\n";
  }
  if(! fTrim(f.aduana.value))
    Mensaje=Mensaje + "'Aduana' es obligatorio\n";
  if(! foNumero(f.registro.value))
    Mensaje=Mensaje + "'Número de Registro' es obligatorio o tiene valores que no son correctos\n";
  

  if(Mensaje=="") {
    var indice=f.aduana.selectedIndex;
    f.saduana.value=f.aduana.options[ indice ].text;
    if(opcion==4)
      return confirm("¿Desea Cancelar el Tránsito, no podrá revertir la operación. ?");
    if(opcion==12)
      return confirm("¿Est\341 seguro de Imprimir el Tránsito/Etiqueta\n"+f.gestion.value+" / "+f.aduana.value+" - "+f.registro.value+"?");
    return true;
  } else {
    alert(Mensaje);
    return false;
  }
}
