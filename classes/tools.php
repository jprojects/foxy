<?php
/**
 * @version     1.0.0 Afi Framework $
 * @package     Afi Framework
 * @copyright   Copyright © 2014 - All rights reserved.
 * @license	    GNU/GPL
 * @author	    kim
 * @author mail kim@afi.cat
 * @website	    http://www.afi.cat
 *
*/

defined('_Afi') or die ('restricted access');

class Tools
{
	public function getBetweenExpression($field, $starting_date, $ending_date)
	{
		$starting_date = str_replace('/' , '-' , $starting_date);
		$ending_date = str_replace('/' , '-' , $ending_date);
		return $field." BETWEEN '".date('Y-m-d', strtotime($starting_date))." 00:00:00' AND '".date('Y-m-d', strtotime($ending_date))." 23:59:59'";
	}
	
	public function UTF8ToW1252($cadena) {
		return iconv('UTF-8', 'windows-1252', $cadena);
	}
}
?>
