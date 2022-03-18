<?php
/**
 * @version     1.0.0 Afi Framework $
 * @package     Afi Framework
 * @copyright   Copyright © 2014 - All rights reserved.
 * @license	    GNU/GPL
 * @author	    kim
 * @author mail kim@aficat.com
 * @website	    http://www.aficat.com
 *
*/

defined('_Afi') or die ('restricted access');

class model
{
    public $DataInici;
	public $DataFinal;
	public $NumDies;
	public $HoresJornada;

    public function getItem($table, $key)
	{
		$db = factory::getDatabase();
		$app = factory::getApplication();
		$config = factory::getConfig();

		$id = $app->getVar('id', 0);

		if($id > 0) {
			$sql = "select * from $table where $key = $id";
			if($config->debug == 1) { echo 'getItem: '.$sql.'\n'; }
			$db->query($sql);

			return $db->fetchObject();
		}
    }

    public function getTecnics() {
        $db  = factory::getDatabase();
		$db->query( "SELECT Id, Treballadors AS nom FROM #_Treballadors" );
		return $db->fetchObjectList();
    }

    public function isAdmin() {

  	    $user = factory::getUser();

  	    if($user->_level == 1) { return true; }

  	    return false;
    }

    /**
     * Method to secure the wishlist
     */
    public static function tokenCheck()
    {
      $db     = factory::getDatabase();

      //exit if its the token owner...
      $db->query('select token from #_users WHERE username = '.$_GET['username']);
      $token = $db->loadResult();
      if($token != $_GET['token']) {
          return false;
      }

      return true;
    }

    function timeElapsed($datetime, $full = false)
	{
		$now = new DateTime;
		$ago = new DateTime($datetime);
		$diff = $now->diff($ago);

		$diff->w = floor($diff->d / 7);
		$diff->d -= $diff->w * 7;

		$string = array(
		    'y' => 'any',
		    'm' => 'mes',
		    'w' => 'setmana',
		    'd' => 'dia',
		    'h' => 'hora',
		    'i' => 'minut',
		    's' => 'segon',
		);
		foreach ($string as $k => &$v) {
		    if ($diff->$k) {
		        $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
		    } else {
		        unset($string[$k]);
		    }
		}

		if (!$full) $string = array_slice($string, 0, 1);
		return $string ? 'fa '.implode(', ', $string) : 'just ara';
	}

    /**
     * Send email to the user
     * @param $mail string the user email
     * @param $name string the username
     * @param $subject string the mail subject
     * @param $body string the mail body
     * @return boolean true if success false if not
    */
    public static function sendMail($email, $name, $subject, $body)
    {
        if($email == '') { return; }
        $mail   = factory::getMailer();
        $config = factory::getConfig();

        @ob_start();
        include 'assets/mail/mail.html';
        $html = @ob_get_clean();
        $htmlbody = str_replace('{{LOGO}}', $config->site.'/assets/img/mail_logo.png', $html);
        $htmlbody = str_replace('{{BODY}}', $body, $htmlbody);

        $mail->setFrom($config->email, $config->sitename);
        $mail->addRecipient($name, $email);
        $mail->setReplyTo($config->email);
        $mail->Subject($subject);
        $mail->Body($htmlbody);
        if($mail->send()) {
            return true;
        }
        return false;
    }

    /**
     * Send email to the admin
     * @param $subject string the mail subject
     * @param $body string the mail body
     * @return boolean true if success false if not
    */
    public static function sendAdminMail($subject, $body)
    {
        $mail   = factory::getMailer();
        $config = factory::getConfig();


		@ob_start();
		include 'assets/mail/mail.html';
		$html = @ob_get_clean();
		$htmlbody = str_replace('{{LOGO}}', $config->site.'/assets/img/mail_logo.png', $html);
		$htmlbody = str_replace('{{BODY}}', $body, $htmlbody);

        $mail->setFrom($config->email, $config->sitename);
        $mail->addRecipient($config->sitename, $config->email);
        $mail->setReplyTo($config->email);
        $mail->Subject($subject);
        $mail->Body($htmlbody);
        if($mail->send()) {
            return true;
        }
        return false;
    }

	public function saveMessage($usuari, $issueid)
    {
    	$db     = factory::getDatabase();

    	$message = new stdClass();
		$message->userid = $usuari;
		$message->titol = 'Nova acció a la incidencia '.$issueid;
		$message->incidencia_id = $issueid;
		$message->estat = 0;
    $message->estatMobil = 0;
		return $db->insertRow('#_messages', $message);
    }

    /**
     * Method to cut a long text
     * @param string $string the input text
     * @param int $number the number of words in output
    */
    public function textShorterer($string, $number)
    {
        $string = str_replace('<p>', '', $string);
        $string = str_replace('</p>', '', $string);
        $string = str_word_count($string, 1, '0..9ÁáÉéÍíÓóÚúñäëïöü');
        $i = 0;
        $phrase = "";
        foreach($string as $str) {
            if($i == $number) { break; }
            $phrase .= $str . " ";
            $i++;
        }
        return $phrase;
    }

    /**
     * Method to destroy session messages
    */
    public function unsetSession()
    {
    	$_SESSION['message'] = '';
		  $_SESSION['messageType'] = '';
    }

	/**
     * Method to create a pagination
    */
    public function pagination($filters, $tab=null)
    {
        $app = factory::getApplication();
        $lang = factory::getLanguage();

        $orderDir    = $app->getVar('orderDir', 'desc');
        $colDir      = $app->getVar('colDir', 'Id');
        $view        = $app->getVar('view', '');
        $page        = $app->getVar('page', 1);

    	$total_pages = $_SESSION['total_pages'];
		$html = array();
        $string = 'view='.$view;

        foreach($filters as $k => $v) {
            $string .= '&'.$k.'='.$v;
        }

        $first  = $lang->get('CW_FIRST');
        $last   = $lang->get('CW_LAST');
        $pages  = $lang->get('CW_PAGES');

      //no do not go over index
      $before5 = ($page - 5 < 1) ? 1 : $page - 5;

      $max5laps = 0;
      $after5 = $page;
      while ($after5 <= $total_pages && $max5laps < 5) {
          $after5++;
          $max5laps++;
      }
      $after5--;

      $html[] = '<div class="pager my-3">';

      $tab != null ? $string .= '&tab='.$tab : $string .= '';

      if($total_pages > 0){
        $html[] = '<nav aria-label="">';
        $html[] = '<ul class="pagination">';
        //FIRTS
        $html[] = '<li class="page-item ';
        if($page <= 1 ) $html[] = 'disabled';
        $html[] = '"><a class="page-link" href="index.php?'.$string.'&page=1">'.$first.'</a></li>';
        //BEFORE
        $html[] = '<li class="page-item ';
        if($page <= 1 ) $html[] = 'disabled';
        $html[] = '"><a class="page-link" href="index.php?'.$string.'&page='. $before5 .'&orderDir='.$orderDir.'&colDir='.$colDir.'">«</a></li>';

        //While PAGES
        $max5laps = 0;
        $field = $page;
        while ($field <= $total_pages && $max5laps < 5) {
            $html[] = '<li class="page-item ';
            if($page == $field ) $html[] = 'active';
            $html[] = '"><a class="page-link" href="index.php?'.$string.'&page='.$field.'&orderDir='.$orderDir.'&colDir='.$colDir.'">'.$field.'</a></li>';

            $field++;
            $max5laps++;
        }

        //AFTER
        $html[] = '<li class="page-item ';
        if($page == $total_pages || $after5 == $total_pages) $html[] = 'disabled';
        $html[] = '"><a class="page-link" href="index.php?'.$string.'&page='. $after5 .'&orderDir='.$orderDir.'&colDir='.$colDir.'">»</a></li>';
        //LAST
        $html[] = '<li class="page-item ';
        if($page < 1 || $page == $total_pages || $after5 == $total_pages) $html[] = 'disabled';
        $html[] = '"><a class="page-link" href="index.php?'.$string.'&page='. $total_pages .'&orderDir='.$orderDir.'&colDir='.$colDir.'">'.$last.'</a></li>';
        $html[] = '</ul>';
        $html[] = '</nav>';
        //TOTAL PAGES
        $html[] = '<p style="font-size: small">'.$pages.' '.$total_pages.'</p>';

      }

      $html[] = '</div>';

		  return implode($html);
    }

    function getHoresPrevistes($pIdTecnic, $pAny, $pMes = 99) {
		$db   = factory::getDatabase();
		$query = "SELECT SUM(Hores) TotalHores FROM #_HoresPersonal_PrevisioMensual WHERE IdTreballador=$pIdTecnic AND [Any]=$pAny";
		if ($pMes != 99) {
			$query .= " AND Mes=$pMes";
		}
		$db->query($query);
		return $db->loadResult();
	}

    function getHoresTreball($pIdTecnic, $pAny, $pMes = 99) {
        $db   = factory::getDatabase();
        $query = "SELECT SUM(Hores+HoresExtres) TotalHores FROM #_HoresPersonal WHERE IdTreballador=$pIdTecnic AND YEAR(Data)=$pAny";
        if ($pMes != 99) {
            $query .= " AND MONTH(Data)=$pMes";
        }
        $db->query($query);
        return $db->loadResult();
    }

    function getHoresBaixes($pIdTecnic, $pAny, $pMes = 99) {
        $db   = factory::getDatabase();
        $query = "SELECT SUM(Hores) TotalHores FROM #_HoresPersonal_Baixes WHERE IdTreballador=$pIdTecnic AND YEAR(Data)=$pAny";
        if ($pMes != 99) {
            $query .= " AND MONTH(Data)=$pMes";
        }
        $db->query($query);
        return $db->loadResult();
    }

    function getHoresVacances($pIdTecnic, $pAny, $pMes = 99) {
        $db   = factory::getDatabase();
        $query = "SELECT SUM(Hores) TotalHores FROM #_HoresPersonal_Vacances WHERE IdTreballador=$pIdTecnic AND YEAR(Data)=$pAny";
        if ($pMes != 99) {
            $query .= " AND MONTH(Data)=$pMes";
        }
        $db->query($query);
        return $db->loadResult();
    }

    function s_datediff($str_interval, $dt_menor, $dt_maior, $relative=false){
        if( is_string( $dt_menor)) $dt_menor = date_create( $dt_menor);
        if( is_string( $dt_maior)) $dt_maior = date_create( $dt_maior);
        $diff = date_diff( $dt_menor, $dt_maior, ! $relative);
        switch( $str_interval){
          case "y":
             $total = $diff->y + $diff->m / 12 + $diff->d / 365.25; break;
          case "m":
             $total= $diff->y * 12 + $diff->m + $diff->d/30 + $diff->h / 24;
            break;
          case "d":
             $total = $diff->y * 365.25 + $diff->m * 30 + $diff->d + $diff->h/24 + $diff->i / 60;
            break;
          case "h":
             $total = ($diff->y * 365.25 + $diff->m * 30 + $diff->d) * 24 + $diff->h + $diff->i/60;
            break;
          case "i":
             $total = (($diff->y * 365.25 + $diff->m * 30 + $diff->d) * 24 + $diff->h) * 60 + $diff->i + $diff->s/60;
            break;
          case "s":
             $total = ((($diff->y * 365.25 + $diff->m * 30 + $diff->d) * 24 + $diff->h) * 60 + $diff->i)*60 + $diff->s;
            break;
         }
        if( $diff->invert)
            return -1 * $total;
        else  return $total;
    }

    function getPeriodes($pIdTreballador, $pDataInici, $pDataFinal) {
        // $pDataInici i $pDataFinal han de ser de tipus DateTime
        $db = factory::getDatabase();
        // Ajustem la data inicial, per si resulta que és anterior a la data d'alta del treballador!
        $db->query("SELECT Alta FROM Treballadors WHERE Id=" . $pIdTreballador);
        $Alta = $db->loadResult();
        if ($treb!==false) {
            if ($Alta > $pDataInici) {
                $pDataInici = $Alta;
            }
            if ($pDataInici > $pDataFinal) {
                return false;
            }
        }
        // Busquem el període al qual pertany la data inicial, per situar-se al principi
        $db->query(
            "SELECT MAX(Data) AS DataPeriode1 " .
            "FROM TreballadorsExercici " .
            "WHERE IdTreballador=" . $pIdTreballador . " AND Data <= STR_TO_DATE($pDataInici)");
        $result = $db->fetchObject();
        if ($result->dataPeriode1==null) {
            $dataPeriode1 = $pDataInici;
        } else {
            $dataPeriode1 = $result->dataPeriode1;
        }
        // Obtenim la llista de períodes
        $query = "SELECT * FROM TreballadorsExercici WHERE IdTreballador = " . $pIdTreballador;
        $dataPeriode1 == null ? $query .= "" : $query .= " AND Data >= STR_TO_DATE($dataPeriode1)";
        $query .= " ORDER BY Data";
        $db->query($query);
        $rows = $db->fetchObjectList();
        // Inicializem variables abans del bucle
        $dataAnt = null;
        $periodes = array();
        // Bucle per resseguir tots els períodes
        foreach ($rows as $row) {
            if ($row->Data > $pDataFinal) {
                break;
            }
            if ($dataAnt != null) {
                $periode = new Periode;
                $periode->DataInici = $dataAnt;
                $periode->DataFinal = date('Y-m-d', strtotime( $row->Data . " -1 days"));
                $periode->NumDies = s_datediff('d', $periode->DataInici, $periode->DataFinal);
                $periode->HoresJornada = $hJornada;
                $periodes[] = $periode;
            }
            $dataAnt = max($row->Data, $pDataInici);
            $hJornada = $row->HoresJornada;
        }
        if ($dataAnt==null) {
            $dataAnt = $pDataInici;
            $hJornada = 8;
            //$dVacances = 23;
        }
        $periode = new Periode;
        $periode->DataInici = $dataAnt;
        $periode->DataFinal = $dataFinal;
        $periode->NumDies = s_datediff('d', $periode->DataInici, $periode->DataFinal);
        $periode->HoresJornada = $hJornada;
        $periodes[] = $periode;
        return $periodes;
    }

    function getPercHoresSobrePrevisio($pHoresPrev, $pHoresTreb, $pHoresVac, $pHoresBaixa) {
        if ($pHoresPrev==0) {
            return false;
        } else {
            return ($pHoresTreb + $pHoresVac + $pHoresBaixa) / $pHoresPrev * 100;
        }
    }
}
