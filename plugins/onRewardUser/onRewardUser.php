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

abstract class onRewardUser {
	
	public static function execute($args) {
		
        $db = factory::getDatabase();
        $user = factory::getUser();
        
        $db->query('UPDATE `#_users` SET coins = coins + 5 WHERE id = '.$user->id);

        return true;
	}
}
