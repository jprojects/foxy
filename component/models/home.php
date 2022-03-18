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

include('includes/model.php');

class home extends model
{
    public function setTemplateMode()
    {
        $db       = factory::getDatabase();
        $lang     = factory::getLanguage();
        $settings = factory::getSettings();
        $app      = factory::getApplication();

        $settings->dark_mode == 1 ? $mode = 0 : $mode = 1;
  
        $result = $db->query("UPDATE #_settings SET dark_mode = ".$mode);

        if($result) {
          $app->setMessage($lang->get('CW_SETTINGS_SAVE_SUCCESS'), 'success');
        } else {
          $app->setMessage($lang->get('CW_SETTINGS_SAVE_ERROR'), 'danger');
        }
    }
}
