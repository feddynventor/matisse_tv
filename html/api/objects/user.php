<?php

function random_str(
    int $length = 10,
    string $keyspace = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
): string {
    $pieces = [];
    $max = mb_strlen($keyspace, '8bit') - 1;
    for ($i = 0; $i < $length; ++$i) {
        $pieces []= $keyspace[random_int(0, $max)];
    }
    return implode('', $pieces);
}

class User{
 
    // database connection and table name
    private $conn;
    private $table_name = "users";
 
    // object properties
    public $id;
    public $username;
    public $password;
    public $credit;
    public $created;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // signup user
    function signup(){
	
        if($this->isAlreadyExist()){
           return false;
        }

	$this->id = random_str();

        // query to insert record
        $query = "INSERT INTO " . $this->table_name . 
        " SET id=:id, username=:username, password=:password, created=:created";
    
        // prepare query
        $stmt = $this->conn->prepare($query);
    
        // sanitize
        $this->username=htmlspecialchars(strip_tags($this->username));
        $this->password=htmlspecialchars(strip_tags($this->password));
        $this->created=htmlspecialchars(strip_tags($this->created));

        // bind values
        $stmt->bindParam(":id", $this->id);
        $stmt->bindParam(":username", $this->username);
        $stmt->bindParam(":password", $this->password);
        $stmt->bindParam(":created", $this->created);

        // execute query
        if($stmt->execute()){
            return true;
        }
    
        return false;
        
    }

    // credit user
    function creditcharge($par_id, $cred){

        // query to insert record
        $query = "UPDATE " . $this->table_name .
        " SET credit=:credit WHERE id=:id";

        // prepare query
        $stmt = $this->conn->prepare($query);

        // bind values
        $stmt->bindParam(":credit", $cred);
	    $stmt->bindParam(":id", $par_id);

        // execute query
        if($stmt->execute()){
            return TRUE;
        }
        return FALSE;
    }

    // login user
    function login(){
        // select all query
       if (!isset($this->username))
           die();
       $query = "SELECT
                    `id`, `username`, `password`, `created`, `credit`
                FROM
                    " . $this->table_name . " 
                WHERE
                    username='".$this->username."' AND password='".$this->password."'";
        // prepare query statement
        $stmt = $this->conn->prepare($query);
        // execute query
        $stmt->execute();
        return $stmt;
    }
    
    function isAlreadyExist(){
        $query = "SELECT * FROM " . $this->table_name . " WHERE username='" . $this->username . "'";
	// prepare query statement
        $stmt = $this->conn->prepare($query);
        // execute query
        $stmt->execute();
        if($stmt->rowCount() > 0){
            echo $stmt->rowCount();
            return true;
        }
        else{
            return false;
        }
    }
    
}
