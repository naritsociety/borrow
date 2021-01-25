<?php
/* database.php */
return array (
  'mysql' => 
  array (
    'dbdriver' => 'mysql',
    'username' => 'root',
    'password' => '12345678',
    'dbname' => 'fameline_eborrow',
    'prefix' => 'brw',
    'hostname' => 'localhost',
  ),
  'tables' => 
  array (
    'category' => 'category',
    'language' => 'language',
    'number' => 'number',
    'borrow' => 'borrow',
    'borrow_items' => 'borrow_items',
    'repair' => 'repair',
    'inventory' => 'inventory',
    'user' => 'user',
  ),
);