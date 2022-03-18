<?php
if(password_verify($_GET['pass'], $_GET['key'])) {
  echo 'true';
} else {
  echo 'false';
}
?>
