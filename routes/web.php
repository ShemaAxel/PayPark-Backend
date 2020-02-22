<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
 */

$router->get('/', function () use ($router) {
    return $router->app->version();
});

//a group of all tickets end-points
$router->group(["prefix" => "api"], function () use ($router) {
    $router->get('/tickets/all', ['uses' => 'TicketsController@all']);
    $router->get('/tickets/{id}', ['uses' => 'TicketsController@byAgentId']);
    $router->get('/tickets', ['uses' => 'TicketsController@byAgentIdAndStatus']);
});

//a group of all agents end-points
$router->group(["prefix" => "api"], function () use ($router) {
    $router->get('/agents/all', ['uses' => 'AgentsController@all']);
    $router->post('/agents/create', ['uses' => 'AgentsController@create']);
    $router->get('/agents/find/{telephone}', ['uses' => 'AgentsController@find']);
    $router->get('/agents/reset/{telephone}', ['uses' => 'AgentsController@resetPassword']);
    $router->post('/agents/login', ['uses' => 'AgentsController@login']);
});
