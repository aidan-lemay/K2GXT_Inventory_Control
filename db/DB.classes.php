<?php
    class DB {
        private $dbh;

        function __construct() {
            try {
                $this->dbh = pg_connect("host=localhost port=3306 dbname=k2_inventory user=k2_control password=K2GXT@2019");
            } catch (PDOException $pde) {
                echo $pde->getMessage();
            }
        }
    }
?>