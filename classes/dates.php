<?php

/**
 * @version     1.0.0 Afi framework $
 * @package     Afi framework
 * @copyright   Copyright © 2016 - All rights reserved.
 * @license	    GNU/GPL
 * @author	    kim
 * @author mail kim@afi.cat
 * @website	    http://www.afi.cat
 *
*/

defined('_Afi') or die ('restricted access');

class Dates
{
    /**
     * Timezone
     *
     * @var  array
     * @access   private
    */
    var $timezone = 'Europe/Madrid';

    /**
     * Takes a date and return a EU format
     * @param date $date the date
     * @return date
     *
    */
    public function dateToEU($ddate) {
        $date = new DateTime($ddate);
        return $date->format('d-m-Y H:i:s');
    }

    /**
     * Takes a date and return a USA format
     * @param date $date the date
     * @return date
     *
    */
    public function dateToUSA($ddate) {
        $date = new DateTime($ddate);
        return $date->format('Y-m-d H:i:s');
    }

    /**
     * Get the difference between two given dates
     * @param date $date1 the start date
     * @param date $date2 the end date
     * @param string $format the returned format
     * @return date
     *
    */
    public function getDateDiff($date1, $date2, $format = '%H:%I'){
    	$datetime1 = new DateTime($date1);
        $datetime2 = new DateTime($date2);
        $interval = $datetime1->diff($datetime2);
        return $interval->format($format);
    }

    /**
     * Turns a date into a nice 1 hour ago or 2 days ago
     * @param time $time time created
     * @return string
     *
    */
    public function getTimeAgo($time) {
        $periods = array("second", "minute", "hour", "day", "week", "month", "year", "decade");
        $lengths = array("60","60","24","7","4.35","12","10");

        $now        = time();
        $difference = $now - $time;
        $tense      = "ago";

        for($j = 0; $difference >= $lengths[$j] && $j < count($lengths)-1; $j++) {
            $difference /= $lengths[$j];
        }

        $difference = round($difference);

        if($difference != 1) {
            $periods[$j].= "s";
        }

        return "$difference $periods[$j] 'ago' ";
    }

    /**
     * Takes a date and tells how many days and hours are remaining until the aforementioned date
     * @param date $date the start date
     * @return string
     *
    */
    public function getCountDown($date) {
        $dt_end = new DateTime($date);
        $remain = $dt_end->diff(new DateTime());
        return $remain->d . ' days and ' . $remain->h . ' hours';
    }

    /**
     * Takes a date and add or substract a modifier, use this format "+1 month" or "-1 year +1 month"
     * @param date $date the start date
     * @param string $modifier time to add or substract from date
     * @param string $format the returned format
     * @return date
     *
    */
    public function modifyDate($ddate, $modifier, $format = "d-m-Y H:i:s") {
        $date = new DateTime($ddate);
        $date->modify($modifier);
        return $date->format($format);
    }
    
}
?>
