<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
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
            $array['userLoged'] = $userLogged;
            return response()->json($array);
            
              
            
        }

        public function create(Request $request){
            $array = ['error' => '', 'message' => '', 'list'=> []];
            $user = auth()->user();

      
            $validator = Validator::make($request->all(),[
                'name' => 'required|string|max:255',
                'email' => 'required|email|unique:users,email',
                'cpf' => 'required|string|unique:users,cpf',                
                'password' => 'required',
               
            ]);

            
            if(!$validator->fails()){
                $name = $request->input('name');
                $email = $request->input('email');
                $cpf = $request->input('cpf');
                $password = $request->input('password');
                
                $newUser = new User();
                $newUser->name = $name;
                $newUser->email = $email;
                $newUser->cpf = $cpf;
                $newUser->password = $password;
                $newUser->save();

                $array['success'] = 'Dados cadastrados com sucesso!!!';
            }else{

                $array['error'] = "Erro: Não foi possível cadastrar dos dados!!!";
            }


            return $array;
        }              
        public function destroy($id){
            $array = ['error' => '', 'success' => ''];
            $user = auth()->user();
            
            if($id){
    
                User::where('id', $id)->delete();
                $array['success'] = 'Registro deletado com sucesso !!!';
    
            }else{
    
                $array['error'] = 'Código não existe!!!';
                return $array;
            }
    
            return $array;
        }
       
}
