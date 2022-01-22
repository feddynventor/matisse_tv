<?php
class Purchase{
 
    // database connection and table name
    private $conn;
    private $table_name = "acquisti";
 
    // object properties
    public $id;
    public $user_id;
    public $video_id;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    function addnew(){

        // query to insert record
        $query = "INSERT INTO " . $this->table_name . 
        " SET user_id=:user_id, video_id=:video_id";
    
        // prepare query
        $stmt = $this->conn->prepare($query);
    
        // bind values
        $stmt->bindParam(":user_id", $this->user_id);
        $stmt->bindParam(":video_id", $this->video_id);
    
        // execute query
        if($stmt->execute()){
            return true;
        }
        echo "FATAL SOOS i ciò si cumbnoit";
        return false;
        
    }

    function verify(){
        // select all query
        $query = "SELECT
                    `id`
                FROM
                    " . $this->table_name . " 
                WHERE
                    user_id='".$this->user_id."' AND video_id='".$this->video_id."'";
        // prepare query statement
        $stmt = $this->conn->prepare($query);
        // execute query
        $stmt->execute();
        return $stmt;
    }
}
?>