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

class Afimysqli {
	
  	public $last_query;
  	public $result;
  	public $connection_id;
  	public $num_queries = 0;
      
    /**
     * Constructor
    */
    function __construct() {
    
        $config = factory::getConfig();

        $this->connection_id = $this->connectDB($config->host, $config->user, $config->pass, $config->database);
		
		return $this->connection_id;
    }

    /**
     * Method to connect a database
     * @param $host
     * @param $user
     * @param $pass
     * @param $database
     * @since 1.0
    */
    public function connectDB($host, $user, $pass, $database)
    {
        $this->connection_id = new mysqli ( $host, $user, $pass, $database );
    	
		if ($this->connection_id->connect_errno) {
			die('Connect Error (' . $this->connection_id->connect_errno . ') '. mysqli_connect_error);
		}

		if (!$this->connection_id->set_charset("utf8")) {
			die('Connect Error (' . $this->connection_id->connect_errno . ') '. mysqli_connect_error);
		}
		
		return $this->connection_id;
    }
	
    /**
     * Method to query a table
     * @param $query
     * @since 1.0
    */
    public function query( $query ) {
    
        $config = factory::getConfig();
	    $this->last_query = str_replace('#_', $config->dbprefix, $query);
	    $this->num_queries++;
	    $this->result = mysqli_query( $this->connection_id, $this->last_query ) or die( $this->getError() );
	    return $this->result;
    }
    
    /**
     * Returns the first row of a query
    */
    function loadResult() {
        
        $row = mysqli_fetch_row($this->result);
		return $row[0];        
    }
    
    /**
     * Method to insert array into table
     * @param $table
     * @param $array
     * @since 1.0
    */
    function insertRow($table, $array) {
    
        $config = factory::getConfig();
        $query = "INSERT INTO ".str_replace('#_', $config->dbprefix, $table);
        $fis = array(); 
        $vars = array();
        foreach($array as $field=>$val) {
            $fis[]  = "`$field`";
            $vars[] = "".$this->quote($val, false)."";
        }
        $query .= " (".implode(", ", $fis).") VALUES (".implode(", ", $vars).")";
        if ($this->result = $this->query($query))
        return $this->result;
        else return false;
    }
    
    /**
     * Method to update table
     * @param $table
     * @param $array
     * @param $idField
     * @param $id
     * @since 1.0
    */
    function updateRow($table, $array, $idField, $id) {
    
        $config = factory::getConfig();
        $query = "UPDATE ".str_replace('#_', $config->dbprefix, $table)." SET ";
        $vars = array();
        foreach($array as $field=>$val) {
            $vars[] = "$field"." = ".$this->quote($val, false)."";
        }
        $query .= implode(", ", $vars)." WHERE $idField = ".(int)$id;
        if ($this->result = $this->query($query))
        return $this->result;
        else return false;
    }
    
    /**
     * Method to update a table single field
     * @param $table
     * @param $field
     * @param $value
     * @param $idField
     * @param $id
     * @since 1.0
    */
    function updateField($table, $field, $value, $idField, $id) {
    
        $config = factory::getConfig();
        $query = "UPDATE ".str_replace('#_', $config->dbprefix, $table)." SET ";        
        $value = "`$field`"." = ".$this->quote($value, false)."";
        $query .= $value." WHERE $idField = ".$this->quote($id);
        if ($this->result = $this->query($query))
        return $this->result;
        else return false;
    }
    
    /**
     * Method to delete a table row
     * @param $table string database table
     * @param $idField string field to delete
     * @param $id id int item id
     * @since 1.0
    */
    function deleteRow($table, $idField, $id) {
    
        $config = factory::getConfig();
        $table = str_replace('#_', $config->dbprefix, $table);
        $query = "DELETE FROM $table WHERE $idField = ".(int)$id;
        $this->result = $this->query($query);
        return $this->result;
    }
    
    /**
     * Method to return the last insert id
     * @return int
     * @since 1.0
    */
    function lastId() {
        return mysqli_insert_id($this->connection_id);
    }
	
    /**
     * Method to create an object for a single row
     * @return object
     * @since 1.0
    */
	function fetchObject( )
	{
	    return mysqli_fetch_object( $this->result );
	}
    
    /**
     * Method to create an array for a single row
     * @return array
     * @since 1.0
    */
	function fetchArray( )
	{
	    return mysqli_fetch_array( $this->result );
	}
	
	/**
     * Method to create an object for multiple rows
     * @return object
     * @since 1.0
    */
	function fetchObjectList()
	{
	    $object = array();

	    while ($row = $this->fetchObject( $this->result )) {
	        $object[] = $row;
	    }
	    
	    $this->free();
	    return $object;
	}

    /**
     * Method to create a limit clausule
     * @return string
     * @param $offset int start limit
     * @param $no_of_records_per_page int pagination limit
     * @since 1.0
    */
    public function limit($offset, $no_of_records_per_page)
    {
        return ' LIMIT '.$offset.', '.$no_of_records_per_page;
    }

    /**
     * Method to return the number of affected rows
     * @return object
     * @since 1.0
    */
	function num_rows(  )
	{
	    return mysqli_num_rows( $this->result );
	}
    
    /**
     * Method to quote and optionally escape a string to database requirements for insertion into the database.
	 * @param   string   $text    The string to quote.
     * @param   boolean  $escape true if escape variable
	 * @return  string  The quoted input string.
	 * @since   1.0
	*/
	public function quote($text)
	{
		if(is_numeric($text)) { return $text; } 
		return '\''.str_replace("'", "''", $text).'\'';
	}
	
    /**
     * Method to return the number of affected rows in the last query
     * @return int
     * @since 1.0
    */
  	function affected_rows(  )
  	{
    		return mysqli_affected_rows( );
  	}
      
    /**
     * Method to return a complete error report
     * @return string
     * @since 1.0
    */
    function getError()
    {
        return mysqli_errno($this->connection_id)." : ".mysqli_error($this->connection_id);
    }
    
    /**
     * Method to frees the memory associated with a result
    */
    function free()
    {
        return mysqli_free_result($this->result);
    }
    
    /**
     * Method to close a connection
     * @since 1.0
    */
    function close()
    {
        return mysqli_close($this->connection_id);
    }
	
	function datetimeToMySQL($var) {
		$data = str_replace('/', '-', $var);
		$segons = strtotime($data);
		if (($segons === false) || ($segons < 0)) {
			return '0000-00-00 00:00:00';
		} else {
			return date('Y-m-d', $segons);
		}
	}
}

?>
