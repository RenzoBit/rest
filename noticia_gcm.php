<?php

require_once './autoload.php';

$titulo = $_REQUEST['txtTitulo'];
$descripcion = $_REQUEST['txtDescripcion'];

$vo = new Noticia();
$vo->titulo = $titulo;
$vo->descripcion = $descripcion; 

$dao = new NoticiaDAO();
$dao->insertar($vo);    

define('API_ACCESS_KEY', 'AIzaSyCK4m3Pkem-z6_ckXfBNsKVicNlTfyKBCs');

$registrationIds = array('APA91bGfm0p03WmgwPQRLfwBfnEjCtsbfhunggxRg5OAQBYc9EMXolshpmJ05VsMozdxRRov1sjzJMZ-CF_EV5vddnBmPOtH5pFzfPflzij02JDPqQw05CgIHtU5dnCYcyEJFLTHPoT8',
'APA91bECRSbwirhc5jj6LTobrcqQiagsDqE-ZexSHOIRqXcyLzpM33lwCBrROXrZufSiSEG19gUJH7Vb5ne8gBXzj92RD8_rNl0Sbvw6kCiYzcl1mBib-M_mOe30a8zl9ktL2u6h9mac',
'APA91bFVsxQ3h5GaX1kpxxhzcL_GnF_HJhWjPZxqlARhYP2hISGI2oQBrBuPRDyxnzAMfX66_6447xQo7zqJsgnWPPLhJ4snb-0segmYMYUB0sOI9N65AVBY3Xg2fZeasKj_fl9II3ML');

$msg = array('message' => $titulo);
$fields = array('registration_ids' => $registrationIds, 'data' => $msg);
$headers = array('Authorization: key=' . API_ACCESS_KEY, 'Content-Type: application/json');

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'https://android.googleapis.com/gcm/send');
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
$result = curl_exec($ch);
curl_close($ch);
echo $result;

?>