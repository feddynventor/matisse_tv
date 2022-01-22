<?php

class Channel{
 
    // database connection and table name
    private $conn;
    private $table_name = "channels";
 
    // object properties
    public $id;
    public $nome;
    public $enabled;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    function list(){
        // select all query
        $query = "SELECT `id`, `nome`, `enabled`, `logo` FROM " . $this->table_name . " WHERE enabled='1' ORDER BY id";
        // prepare query statement
        $stmt = $this->conn->prepare($query);
        // execute query
        $stmt->execute();
        return $stmt;
    }

}
