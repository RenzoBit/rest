<?php

// API access key from Google API's Console
define('API_ACCESS_KEY', 'AIzaSyCK4m3Pkem-z6_ckXfBNsKVicNlTfyKBCs');
//$registrationIds = array('APA91bFqI-ffFkuYS3kTex8VMV1NttV1UodJ51zZLvD8WBmoJJBXI1LjdZpsPXF8_KfNKpCbSkwdLBb8rtHwpBlJjUfQ8MTZyXjVJqx3_ZHyafv5dJI1IAL8ejd23__RZwvNtJWQ_A3V', 'APA91bHGdy7C4TjbNne9xhfe8eJVchf_rm-x00tbh9w-xiokXedVxCw1PVJ5G_A3BKUYEYKaUmWQTvxrpVcsB1hgBOL-WR4D6cqZFtLVyvVeoAVdOSAQeKehQhCcR8bpfhz-dInv1QFx');

$registrationIds = array('APA91bFPsDHJQbIgjV0a9sVU8ng7197eFUQCGJg91_yy7QBa3AAoPkySOijX65wUx60iSR_LbePHKk3vARBcGJnEWkiSvsWPeCIkO-9Vay58FMLkTfcNy7f6xQSRLVShxLLy1_nlOnnP',
'APA91bFIbRsuw5aaw6IaBHXCgVOSNKDT3tbuqf74UV1W4aenGdEMqBq5LQCK6PWukpC1TDjacDSr8E2dC2H_FCntPCVnbPq-ftyWTvj82A_L1VPv4NSIciPR3zSnFrprrCSY42L6eXNf',
'APA91bF5zOPcLuxuVTwosrELaD25mcucLXxTU_7KRc_8bFC3J3GbGorDS-5ntFGAfpqhtsxjYSWNM0iDPwI1aO5pb5RX_qkm0-pboBwPj8CW9PBl8jD_0gU0ZT9lApQbjPauLStsqN1D');

// prep the bundle
$msg = array('message' => 'Aqui va el mensaje a enviar');
$fields = array('registration_ids' => $registrationIds, 'data' => $msg);
$headers = array('Authorization: key=' . API_ACCESS_KEY, 'Content-Type: application/json');
 
$ch = curl_init();
curl_setopt($ch,CURLOPT_URL, 'https://android.googleapis.com/gcm/send');
curl_setopt($ch,CURLOPT_POST, true);
curl_setopt($ch,CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch,CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch,CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch,CURLOPT_POSTFIELDS, json_encode($fields));
$result = curl_exec($ch);
curl_close($ch);
echo $result;

?>