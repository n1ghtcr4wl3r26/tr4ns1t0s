function anticipado (box) {
 var f=document.forms["CarpetaDecForm"];
 if (box) 
 { document.getElementById("r_gestion").style.background = "#FFFFFF"; 
   document.getElementById("r_numero").style.background = "#FFFFFF"; 
   document.getElementById("docPdf").style.background = "#F2F2F2"; 
   document.getElementById("lim_pdf").innerHTML = document.getElementById("lim_pdf").innerHTML;   
   document.getElementById("docPdf").disabled = true;    
   document.getElementById("r_gestion").disabled = false; 
   document.getElementById("r_numero").disabled = false; 
  }
 else
 { document.getElementById("r_gestion").style.background = "#F2F2F2"; 
   document.getElementById("r_numero").style.background = "#F2F2F2"; 
   document.getElementById("r_gestion").value = ''; 
   document.getElementById("r_numero").value = ''; 
   document.getElementById("r_gestion").disabled = true; 
   document.getElementById("r_numero").disabled = true; 
   document.getElementById("docPdf").style.background = "#FFFFFF"; 
   document.getElementById("docPdf").disabled = false;
  }
}
function dui(valor1, valor2, valor3)
  {
    var f = document.forms["CarpetaDecForm"];
    f.r_gestion.value = valor1;
    f.r_aduana.value = valor2;
    f.r_numero.value = valor3;
    f.opcion.value = '3';
    f.target='_blank';
    f.submit();
  }

function salir(aux)
  {
    var f = document.forms["CarpetaDecForm"];
    f.opcion.value = aux;
    f.submit();
  }
  
function cancelarArchivo(){
    $("#codigo").val('');
    $("#referencia").val('');
    $("#narchivo").val('');

		$('#mask').hide();
		$('.window').hide();

		return false;
	}

function subirArchivo(opc){
    var msg = '';
    var f=document.forms["formulariocarpeta"];  
    $("#opcion").val(opc);
    $("#r_aduana").val(opc);
    
    
    if($("#opcion").val()==1){
            var arr = $("#car_dep_date").val().split('/');
            var cpt= $("#key_cuo").val()+"-"+arr[2]+"-"+arr[1]+"/";
            
            $("#carpeta").val('/u03/oracle/user_projects/data/mira/manifiestos/'+$("#key_cuo").val()+'/'+arr[2]+'/'+arr[1]+'/'+cpt);
            //$("#carpeta").val('/u06/oracle/user_projects/data/mira/pmanifiestos/'+$("#key_cuo").val()+'/'+arr[2]+'/'+arr[1]+'/'+cpt);
            f.opcion.value= opc;
            $("#tip_documento").attr("disabled",false);
            $("#doc_embarque").attr("disabled",false);
            if($("#opcion").val()=='1')
            {   if($("#tip_documento").val()=='')
                msg=msg + "'Tipo Documentos' es obligatorio\n";
                if($("#doc_embarque").val()=='')
                msg=msg + "'Doc. de Embarque' es obligatorio\n";
            }
            var i = 0;
            $("#tip_documento option").each(function(index ){
                
                if($(this).attr("value")==$("#tip_documento option").val());
                    i=index;
            });
                
                
            for( i = 1; i<= 6; i++){
              if (listaMostrar[it]) {
                
                var $filas = $("#tr"+i).find('th');
                var $filasd = $("#tr"+i).find('td');
                if (listaObligar[it].charAt(i)=='1'){
                    if($($filasd[0]).find('input, select, file').val()=="" && listaObligar[it].charAt(i)=='1'){   
                        if($filas[0].innerHTML=='Documento (PDF):'){
                            if($("#docPdf").val()=='' && obl == 1){
                                msg=msg + 'Debe seleccionar el Archivo PDF que quiere cargar\n';
                            }
                        }else{
                            msg=msg +"'"+$filas[0].innerHTML+"' es obligatorio.\n";
                        }
                    }
                }
                      if(listaFecha[it].charAt(i)=='1')if (!fFecha2( $($filasd[0]).find('input, select').val()) && listaFecha[it].charAt(i)=='1' ) {
                        msg=msg + "'"+$filas[0].innerHTML+"' no tiene el formato dd/mm/yyyy\n";
                            
                            
                        
                      }else{
                            if(listaCondicion[it].charAt(i)=='>' && listaObligar[it].charAt(i)=='0')if(!fcFechas( $($filasd[0]).find('input, select').val(),fHoy() ) && listaCondicion[it].charAt(i)=='>' && listaObligar[it].charAt(i)=='0'){
                                msg = msg + "'"+$filas[0].innerHTML+"' debe ser mayor que hoy.\n";
                            }
                            
                            if(listaCondicion[it].charAt(i)=='<' && listaObligar[it].charAt(i)=='0')if(!fcFechas(fHoy(), $($filasd[0]).find('input, select').val() ) && listaCondicion[it].charAt(i)=='<' && listaObligar[it].charAt(i)=='0')
                                msg = msg + "'"+$filas[0].innerHTML+"' debe ser menor que hoy.\n";
                            
                            if(listaCondicion[it].charAt(i)=='>' && listaObligar[it].charAt(i)=='1')if(!fcFechas( $($filasd[0]).find('input, select').val(),fHoy() ) && listaCondicion[it].charAt(i)=='>' && listaObligar[it].charAt(i)=='1'){
                                msg = msg + "'"+$filas[0].innerHTML+"' debe ser mayor que hoy.\n";
                            }
                            
                            if(listaCondicion[it].charAt(i)=='<' && listaObligar[it].charAt(i)=='1')if(!fcFechas( fHoy(), $($filasd[0]).find('input, select').val() ) && listaCondicion[it].charAt(i)=='<' && listaObligar[it].charAt(i)=='1')
                                msg = msg + "'"+$filas[0].innerHTML+"' debe ser menor que hoy.\n";
                      }
                      
                      if(listaNumero[it].charAt(i)=='1' && listaObligar[it].charAt(i)=='1')if(!fNum2( $($filasd[0]).find('input, select').val() ) && listaNumero[it].charAt(i)=='1' && listaObligar[it].charAt(i)=='1')
                        msg = msg + "'"+$filas[0].innerHTML+"' no tiene el formato correcto\n";  
                      
                      
        
              }  
            }
            if($("#tip_documento").val()=='D05'){//D99 DESARROLLO VEHICULOS NUEVOS //D05 PRODUCCION
                if($("#dui_key_year").val() =="" || $("#dui_key_cuo").val() ==""  || $("#dui_key_dec").val()=="" ||$("#dui_key_nber").val()=="")
                {
                    msg=msg + 'Debe introducir una DUI memorizada\n';
                }else{
                    if($("#dui_key_year").val().length !=4)
                        msg=msg + 'Formato de la gestion es incorrecto\n';
                    if($("#dui_key_cuo").val().length !=3)
                        msg=msg + 'Formato de la aduana es incorrecto\n';
                    if(msg =="")
                    {
                        var temp = ($("#dui_key_year").val()).trim()+'/'+($("#dui_key_cuo").val()).trim()+'/'+($("#dui_key_dec").val()).trim()+'/'+($("#dui_key_nber").val()).trim();
                        $("#nro_referencia").val(temp);
                    }
                }
            }
    }
    if($("#opcion").val()==4){
        if($("#p_car_reg_year").val() ==""){
            msg=msg + 'Gestion del parcial es obligatorio\n';
        }
        if($("#p_key_cuo").val() ==""){
            msg=msg + 'Aduana del parcial es obligatorio\n';
        }
        if($("#p_car_reg_nber").val() ==""){
            msg=msg + 'Numero de registro del parcial es obligatorio\n';
        }
        if($("#p_key_bol_ref").val() ==""){
            msg=msg + 'Documento de embarque del parcial es obligatorio\n';
        }        
    }
        if(msg !="")
        {
          msg="Lista de Errores: \n\n" + msg;
          alert(msg);
          return false;
        }
        else{
            if(confirm('\u00BFDesea grabar el registro?')){
            f.target='';    
            $("#formulariocarpeta").submit();
                return true;
            }
            else{
                return false;            
            }
        
        }
     
}

function most_index(obj){
    it = obj.selectedIndex;
    for( i = 1; i<= 7; i++){
            if (listaMostrar[it]) {
                if (listaMostrar[it].charAt(i)=='0')
                    $("#tr"+i).fadeOut(2000);
                else
                    $("#tr"+i).fadeIn(2000);
            }
    }
    
}


function subirImagen(year,cuo,nber,cod,desc,emi,ref,fecha,imp,div,otr_d,arch,sw,cod2,bol_ref){
    obl = 0;
    $(".close").click();
    $("#key_cuo").val(cuo);
    $("#car_reg_year").val(year);
    $("#car_reg_nber").val(nber);
    
    $("#tip_documento").val(cod);
    if($("#tip_documento").val()==null){
        $('#tip_documento').append($('<option>', {
            value: cod,
            text: cod+" : "+desc
        }));
        $("#tip_documento").val(cod);
    }
    most_index(document.getElementById("tip_documento"));
    $("#emisor").val(emi);
    $("#nro_referencia").val(ref);
    $("#fecha_emision").val(fecha);
    $("#importe").val(imp);
    $("#tip_divisa").val(div);    
    $("#tip_documento").attr("disabled",true);
    $("#nreferencia").val(cod2);
    $("#doc_embarque").val(bol_ref);
    $("#doc_embarque").attr("disabled",true);
    if(arch ==" " && cod=="D05"){
        $("#dui_key_year").val(ref.substring(0,4));
        $("#dui_key_cuo").val(ref.substring(5,8));
        $("#dui_key_dec").val(ref.substring(9,ref.lastIndexOf("/")));
        $("#dui_key_nber").val(ref.substring(ref.lastIndexOf("/")+1));
    }
    if(sw == '0') 
    refer = "javascript:alert('El&nbsp;archivo&nbsp;f&iacute;sico&nbsp;no&nbsp;existe&nbsp;o&nbsp;no&nbsp;se&nbsp;almacen&oacute;&nbsp;correctamente.')";
    else
    refer = "javascript:ver_pdf('mira/manifiestos/"+$("#key_cuo").val()+"/"+$("#car_reg_year").val()+"/"+encodeURIComponent(arch.split("/")[arch.split("/").length-2]+"/"+arch.split("/")[arch.split("/").length-1])+"')";
    //refer = "javascript:ver_pdf('mira/pmanifiestos/"+$("#key_cuo").val()+"/"+$("#car_reg_year").val()+"/"+encodeURIComponent(arch.split("/")[arch.split("/").length-2]+"/"+arch.split("/")[arch.split("/").length-1])+"')";
    $("#nombreArch").html(   
        "<a href="+refer+" ><span class='glyphicon glyphicon-folder-open' style='font-size:22px' /></a>"+
        arch  
        );
    
    
    //$("#docPdf").val(arch); 
//		e.preventDefault();

		//Get the A tag
//		var id = $(this).attr('href');

		//Get the screen height and width
		//var maskHeight = $(document).height();
                var maskHeight = '100%';
		var maskWidth = '100%';
		//Set heigth and width to mask to fill up the whole screen
		$('#mask').css({'width':maskWidth,'height':maskHeight});

		//transition effect
		$('#mask').fadeIn(1000);
		$('#mask').fadeTo("slow",0.8);

		//Get the window height and width
		var winH = $(window).height();
		var winW = $(window).width();

		//Set the popup window to center
		$('#dialog').css('top',  (winH/2-$('#dialog').height()/2)+80);
		$('#dialog').css('left', (winW/2-$('#dialog').width()/2)-30);

		//transition effect
		$('#dialog').fadeIn(1000);
		//return false;
	}

function nuevo(){
    obl = 1;
    $(".close").click();
    $("#tip_documento").attr("disabled",false);
    $("#doc_embarque").attr("disabled",false);
    $("#tip_documento").val('');
    $("#emisor").val('');
    $("#nro_referencia").val('');
    $("#fecha_emision").val('');
    
    $("#importe").val('');
    $("#divisa").val('USD');    
    $("#docPdf").val('');    
    $("#nreferencia").val('-1');
    $("#nombreArch").html('');
    $("#doc_embarque").val('');
    
    //DUI MEMORIZADA
    $("#dui_key_year").val('');
    $("#dui_key_cuo").val('');
    $("#dui_key_dec").val('');
    $("#dui_key_nber").val('');
    
//		e.preventDefault();

		//Get the A tag
//		var id = $(this).attr('href');

		//Get the screen height and width
                var maskHeight = '100%';
		var maskWidth = '100%';
		//Set heigth and width to mask to fill up the whole screen
		$('#mask').css({'width':maskWidth,'height':maskHeight});

		//transition effect
		$('#mask').fadeIn(1000);
		$('#mask').fadeTo("slow",0.8);

		//Get the window height and width
		var winH = $(window).height();
		var winW = $(window).width();

		//Set the popup window to center
		$('#dialog').css('top',  (winH/2-$('#dialog').height()/2)+80);
		$('#dialog').css('left', (winW/2-$('#dialog').width()/2)-30);

		//transition effect
		$('#dialog').fadeIn(1000);
		//return false;
	}

function eliminar(dep,cuo,nber,cod,cod2,bol_ref){
    $("#key_cuo").val(cuo);
    $("#car_dep_date").val(dep);
    $("#car_voy_nber").val(nber);
    $("#nro_referencia").val(cod);
    $("#r_aduana").val('2');
    $("#nreferencia").val(cod2);    
    $("#doc_embarque").val(bol_ref);
    
    $("#formulariocarpeta").submit();
    return false;   
}

$(document).ready(function() {

	//if mask is clicked
	$('#mask').click(function () {
		$(this).hide();
		$('.window').hide();
	});			

});


function getStats(fName){

//nullIMG.src = fName;
fullName = fName;
shortName = fullName.match(/[^\/\\]+$/);
splitName = fullName.split(".");
fileType = splitName[1];
fileType = fileType.toLowerCase();
if (fileType != 'pdf')
{
alert("Debe seleccionar un archivo PDF");
document.getElementById("lim_pdf").innerHTML = document.getElementById("lim_pdf").innerHTML;
 return false;
 }
}

function ver_pdf(fi){
    //var fil = "manifiestos/201520143340.pdf";
    window.open(fi,"pdf","width=500,left=300");

}

function getStats2(fName){
     var f=document.forms["formulariocarpeta"];
    //nullIMG.src = fName;
    fullName = fName;
    shortName = fullName.match(/[^\/\\]+$/);
    splitName = fullName.split(".");
    fileType = splitName[1];
    fileType = fileType.toLowerCase();
    if (fileType != 'zip')
    {
    alert("Debe seleccionar un archivo ZIP");
    document.getElementById("lim_zip").innerHTML = document.getElementById("lim_zip").innerHTML;
    return false;
 
 }
}

function DescargaZip(aux){    
    $("#r_aduana").val(aux);
   /* var arr = $("#car_dep_date").val().split('/');
    var cpt= $("#car_reg_year").val()+"-"+$("#car_reg_nber").val();
    $("#lista_origen").val('/u03/oracle/user_projects/data/mira/comprimidos/'+$("#key_cuo").val()+'/'+arr[2]+'/'+arr[1]+'/'+cpt);*/
    var f=document.forms["formulariocarpeta"]; 
    if(confirm('\u00BFDesea descargar los documentos en un archivo comprimido?')){
    f.target='';    
    $("#formulariocarpeta").submit();
        return true;
    }
    else{
        return false;            
    }
}

function parcial(){
    obl = 1;
    $(".close").click();
    $("#tip_documento").attr("disabled",false);
    $("#doc_embarque").attr("disabled",false);
    $("#tip_documento").val('');
    $("#emisor").val('');
    $("#nro_referencia").val('');
    $("#fecha_emision").val('');
    
    $("#importe").val('');
    $("#divisa").val('USD');    
    $("#docPdf").val('');    
    $("#nreferencia").val('-1');
    $("#nombreArch").html('');
    $("#doc_embarque").val('');
    
    //DUI MEMORIZADA
    $("#dui_key_year").val('');
    $("#dui_key_cuo").val('');
    $("#dui_key_dec").val('');
    $("#dui_key_nber").val('');
    //PARCIAL
    $("#p_car_reg_nber").val('');
    $("#p_key_bol_ref").val('');
    
//		e.preventDefault();

		//Get the A tag
//		var id = $(this).attr('href');

		//Get the screen height and width
                var maskHeight = '100%';
		var maskWidth = '100%';
		//Set heigth and width to mask to fill up the whole screen
		$('#mask').css({'width':maskWidth,'height':maskHeight});

		//transition effect
		$('#mask').fadeIn(1000);
		$('#mask').fadeTo("slow",0.8);

		//Get the window height and width
		var winH = $(window).height();
		var winW = $(window).width();

		//Set the popup window to center
		$('#dialog_p').css('top',  (winH/2-$('#dialog').height()/2)+80);
		$('#dialog_p').css('left', (winW/2-$('#dialog').width()/2)-30);

		//transition effect
		$('#dialog_p').fadeIn(1000);
		//return false;
	}