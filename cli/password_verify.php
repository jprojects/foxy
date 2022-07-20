#!/usr/bin/php -q
<?php
if (PHP_SAPI !== 'cli') { die(); }
echo "Test your password:\n";
echo "What is your unencrypted password (enter below):\n";
$pass = fread(STDIN, 80); // Read up to 80 characters or a newline
echo "What is your encrypted password (enter below):\n";
$cpass = fread(STDIN, 80); // Read up to 80 characters or a newline
if(password_verify($pass, $pass)) {
  echo "Correct!\n";
} else {
  echo "Incorrect!\n";
}
?>
