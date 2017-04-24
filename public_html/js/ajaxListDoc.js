function ListaDocAdic()
{
  
  $("#tip_documento").val('');
  //$("#key_cuo").val()
  //AJAX('util/ajaxListDoc.jsp?adu='+f.key_cuo.value+'&vnber='+f.car_voy_nber.value+'&vdepd='+f.car_dep_date.value+'&vbolr='+f.doc_embarque.value);
  AJAX('util/ajaxListDoc.jsp?adu='+$("#key_cuo").val()+'&vnber='+encodeURIComponent($("#car_voy_nber").val())+'&vdepd='+$("#car_dep_date").val()+'&vbolr='+encodeURIComponent($("#doc_embarque").val()));
}

function AJAX(url)
{
  var ale=Math.floor(Math.random()*1000);
  url=url + '&ale='+ale;
   
  ajax=eAjaxz();
  ajax.open("GET", url, true);
  ajax.onreadystatechange=function()
  {
    if(ajax.readyState==1)
      vacio();
    else
      if(ajax.readyState==4)
      {
        if(ajax.status==200)
          pDespliegaz(ajax.responseXML);
        else
        {
          if(ajax.status==404)
            vacio();
          else
            vacio();
        }
      }
  }
  ajax.send(null);
}

function eAjaxz()
{
  var xmlhttp=false;
  try {
    xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
  } catch(e) {
    try {
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
    } catch(E) {
      xmlhttp=false;
    }
  }
  if(!xmlhttp && typeof XMLHttpRequest!='undefined') {
    xmlhttp=new XMLHttpRequest();
  }
  return xmlhttp;
}

function vacio()
{ }


function pDespliegaz(xmldoc)
{
  var f=document.forms["formulariocarpeta"];
  var aux = xmldoc.getElementsByTagName('ans').item(0).firstChild.data;
  if (aux == 'Error')  
  //if(xmldoc.getElementsByTagName("ans").item(0).firstChild.data=='Error')
  {
    alert('No tiene se encontro documentos adicionales');
    return;
  }
    $("#tip_documento").val('');
    f.tip_documento.options.length = 1;
    // Obtenemos todos los nodos denominados foro del archivo xml
    var items=xmldoc.getElementsByTagName("items");
    // Hacemos un bucle por todos los elementos foro
    for(var i=0;i<items.length;i++)
    {
            // Del elemento foro, obtenemos del primer elemento denominado "titulo"
            // el valor del primer elemento interno
            
            texto=items[i].getElementsByTagName("atddsc")[0].childNodes[0].nodeValue
     
            valor=items[i].getElementsByTagName("doccod")[0].childNodes[0].nodeValue
            
            addOption(f.tip_documento,texto,valor);
            
            mostrar=items[i].getElementsByTagName("mostrar")[0].childNodes[0].nodeValue
            obligar=items[i].getElementsByTagName("obligatorio")[0].childNodes[0].nodeValue
            condicion=items[i].getElementsByTagName("condicion")[0].childNodes[0].nodeValue
            fecha=items[i].getElementsByTagName("fecha")[0].childNodes[0].nodeValue
            numero=items[i].getElementsByTagName("numero")[0].childNodes[0].nodeValue
            
            listaMostrar[i+1]= mostrar;
            listaObligar[i+1]= obligar;
            listaCondicion[i+1]= condicion;
            listaFecha[i+1]= fecha;
            listaNumero[i+1]= numero;
    }
}

function addOption(selectbox,text,value )
{
    var optn = document.createElement("OPTION");
    optn.text = value + ' - '+ text;
    optn.value = value;
    selectbox.options.add(optn);
}