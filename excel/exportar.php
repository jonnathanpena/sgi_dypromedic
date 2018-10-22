<?php	
	$array = json_decode($_POST['data'], true);
	$documento = $_POST['documento'];
	try {
		header('Content-Encoding: UTF-8');
		header(sprintf( 'Content-Disposition: attachment; filename='. $documento .' %s.csv', date( 'd-m-Y H_i_s' ) ) );
		header('Content-Transfer-Encoding: binary');
		header("Content-Type:  application/vnd.ms-excel; charset=utf-8");
		header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
    	header('Pragma: public');
		header("Expires: 0");
		$out = fopen("php://output", 'w');
		//This line is important:
		fputs( $out, "\xEF\xBB\xBF" ); // UTF-8 BOM !!!!!
		foreach ($array as $data)
		{
			fputcsv($out, $data);
		}
		fclose($out);
	} catch (Exception $e) {
		echo json_encode(array('success' => false, 'status' => $e->getMessage()));
	}
?>