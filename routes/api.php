<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\UserController;


Route::get('/ping', function(){

    return ['pong' => true];

});
Route::get('/401', [AuthController::class, 'unauthorized'])->name('login');

/*Rotas Api Pronta para React*/
Route::post('/auth/login', [AuthController::class, 'login']);
Route::post('/auth/register', [AuthController::class, 'register']);

Route::middleware('auth:api')->group(function(){
    
    Route::post('/auth/validate', [AuthController::class, 'validateToken']);    
    Route::post('/auth/logout', [AuthController::class, 'logout']);

    Route::get('/auth/user', [AuthController::class, 'getUserLoogged']);

    

    Route::get('/auth/users/{p}', [UserController::class, 'getAll']);
    Route::post('/user', [UserController::class, 'create']);
    Route::delete('/user/{id}', [UserController::class, 'destroy']);
    
    Route::get('/companies/{p}', [CompanyController::class, 'getAll']);
    Route::get('/company/{id}', [CompanyController::class, 'getOne']);
    Route::post('/company', [CompanyController::class, 'create']);
    Route::put('/company/{id}', [CompanyController::class, 'update']);
    Route::delete('/company/{id}', [CompanyController::class, 'destroy']);
});

/*Rotas api teste com vue*/
/*Route::get('/companies', [CompanyController::class, 'getAll']);
Route::get('/companies/{id}', [CompanyController::class, 'getOne']);
Route::post('/company', [CompanyController::class, 'create']);
Route::put('/company/{id}', [CompanyController::class, 'update']);*/