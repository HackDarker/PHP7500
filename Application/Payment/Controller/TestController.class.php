<?php

namespace Payment\Controller;


class TestController extends \Think\Controller 
{
    public function index()
    {
        $conf = C("klt_conf_info");

        print_r($conf);
        
        echo "I'm controller Test";
        
        echo "<br>";

        echo CONTROLLER_NAME;

        echo "<br>";

        echo substr(__CLASS__, 0, -10);
    }
}