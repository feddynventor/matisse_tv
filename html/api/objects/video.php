<?php

class Video{
 
    // database connection and table name
    private $conn;
    private $table_name = "videos";
 
    // object properties
    public $id;
    public $nome;
    public $cost;
    public $air;
    public $cat;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    function list($day, $channel){
        // select all query
//        $query = "SELECT `id`, `nome`, `cost`, `air`, `inizio`, `fine`, `channel`, `descrizione`, `rec`, `giorno` FROM " . $this->table_name . " WHERE giorno=".$day." AND channel=".$channel." OR rec=1";
        $query = "SELECT `id`, `nome`, `cost`, `air`, `inizio`, `fine`, `channel`, `descrizione`, `rec`, `giorno` FROM " . $this->table_name . " WHERE (giorno=".$day." OR rec=1) AND channel=".$channel;
        // prepare query statement
        $stmt = $this->conn->prepare($query);
        // execute query
        $stmt->execute();
        return $stmt;
    }

    function details($param){
        // select all query
        $query = "SELECT
                    `nome`, `cost`, `channel`
                FROM
                    " . $this->table_name . " 
                WHERE
                    id='".$param."'";
        // prepare query statement
        $stmt = $this->conn->prepare($query);
        // execute query
        $stmt->execute();
        return $stmt;
    }

    function isLive($param){
        // select all query
        $query = "SELECT
                    `air`
                FROM
                    " . $this->table_name . " 
                WHERE
                    id='".$param."'";
        // prepare query statement
        $stmt = $this->conn->prepare($query);
        // execute query
        $stmt->execute();
        return $stmt;
    }
}
