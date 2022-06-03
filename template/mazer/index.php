<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="<?= $config->description; ?>">
    <meta name="author" content="<?= $config->sitename; ?>">
    <title><?= $config->sitename; ?></title>
    
    <script src="<?= $config->site; ?>/template/<?= $config->template; ?>/vendor/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<?= $config->site; ?>/template/<?= $config->template; ?>/dist/assets/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.1/font/bootstrap-icons.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="<?= $config->site; ?>/template/<?= $config->template; ?>/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<?= $config->site; ?>/template/<?= $config->template; ?>/vendor/datatables/datatables.min.css"/>
    <link rel="stylesheet" href="<?= $config->site; ?>/template/<?= $config->template; ?>/vendor/messenger-hubspot/build/css/messenger.css">
    <link rel="stylesheet" href="<?= $config->site; ?>/template/<?= $config->template; ?>/vendor/messenger-hubspot/build/css/messenger-theme-flat.css">
    <link rel="stylesheet" href="<?= $config->site; ?>/assets/css/selectizer.min.css" crossorigin="anonymous" />
    <link rel="stylesheet" href="<?= $config->site; ?>/template/<?= $config->template; ?>/dist/assets/css/app.css">
    <?php if($settings->dark_mode == 1): ?>
    <link rel="stylesheet" href="<?= $config->site; ?>/template/<?= $config->template; ?>/dist/assets/css/dark.css">
    <?php endif; ?>
    <?php
  	if(count($app->stylesheets) > 0) :
  		foreach($app->stylesheets as $stylesheet) : ?>
  		    <link href="<?= $stylesheet; ?>" rel="stylesheet">
  		<?php endforeach;
  	endif;
  	?>
    <link rel="shortcut icon" href="<?= $config->site; ?>/favicon.ico" type="image/x-icon">
</head>

<body>
    
    <div id="app">
        
        <?= $app->getModule('sidebarmenu');?>

        <div id="main" <?= $app->view == "home" ? "class='img-fluid' style='background-image: url(". $config->site ."/assets/img/principal.jpg);'" : "" ?>>
            <?= $app->getModule('header'); ?>
            <?php @include($app->getLayout()); ?>
        </div>

    </div>

    <script src="<?= $config->site; ?>/template/<?= $config->template; ?>/dist/assets/js/bootstrap.bundle.min.js"></script>
    <script src="<?= $config->site; ?>/template/<?= $config->template; ?>/vendor/datatables/datatables.min.js"></script>
    <script src="<?= $config->site; ?>/assets/js/repeatable-fields.js"></script>
    <script src="<?= $config->site; ?>/template/<?= $config->template; ?>/vendor/messenger-hubspot/build/js/messenger.min.js"></script>
    <script src="<?= $config->site; ?>/template/<?= $config->template; ?>/vendor/messenger-hubspot/build/js/messenger-theme-flat.js"></script>
    <script src="<?= $config->site; ?>/assets/js/selectizer.js" crossorigin="anonymous"></script>
    <script src="<?= $config->site; ?>/template/<?= $config->template; ?>/dist/assets/js/main.js"></script>
    <?php
    if(count($app->scripts) > 0) :
    foreach($app->scripts as $script) : ?>
    <script src='<?= $script; ?>'></script>
    <?php endforeach;
    endif; ?>
    <script src="<?= $config->site; ?>/assets/js/app.js"></script>
    <?php include('template/'.$config->template.'/message.php'); ?>
</body>

</html>