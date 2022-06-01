<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UserController extends Controller{

        public function getAll($p){
            $array = ['error' => '', 'success' => '', 'list' => []];
            $userLogged = auth()->user();
            
            $query = User::select();
          
            if($p !== '0'){
                $query->orWhere('id', '=', $p)
                      ->orWhere('name', 'LIKE', '%'.$p.'%')
                      ->orWhere('email', 'LIKE', '%'.$p.'%');  

            }
            $users = $query->get(); 
               
                                
            
            $array['list'] = $users;
            return response()->json($array);
            
              
            
        }
}
