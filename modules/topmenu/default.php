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
include_once('helper.php');
$config           = factory::getConfig();
?>

<!-- navbar-->
<header class="header">
  <nav class="navbar">
    <div class="container-fluid">
      <div class="navbar-holder d-flex align-items-center justify-content-between">
        <div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i id="toggler" class="fa fa-chevron-left"> </i></a><a href="index.php" class="navbar-brand">
            <div class="brand-text d-none d-md-inline-block"><strong class="text-primary"><?= $config->sitename; ?></strong></div></a></div>
              <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                <!-- Comments dropdown-->
                <li class="nav-item dropdown"> <a id="comments" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-comment"></i><span class="badge badge-danger">0</span></a>
                </li>
                <!-- Messages dropdown-->
                <li class="nav-item dropdown"> <a id="messages" rel="nofollow" data-target="#" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link"><i class="fa fa-bell"></i><span class="badge badge-danger">0</span></a>             
                </li>
                <!-- Log out-->
                <li class="nav-item"><a href="<?= $config->site; ?>/index.php?view=register&amp;task=logout" class="nav-link logout"> <span class="d-none d-sm-inline-block">Logout</span><i class="fa fa-sign-out"></i></a></li>
            </ul>
      </div>
    </div>
  </nav>
</header>
