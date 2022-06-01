<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Company;


class CompanyController extends Controller{
    


    public function getAll(){

        $array = ['error' => '', 'success' => '', 'list' => []];

        $user = auth()->user();
        $companies = Company::select()->get();

        $array['list'] = $companies;
        
        $user = auth()->user();
        $array['user'] = $user;
 
        return response()->json($array);
    }

    public function getOne($id){
        $array = ['error' => '', 'list' => []];
        $id = preg_replace("/[^0-9]/", "", $id); 
       
        if($id){

            $user = auth()->user();
            $companies = Company::select()->find($id);
    
            $array['list'] = $companies;
     
            return response()->json($array);  
        }
        $user = auth()->user();
        $array['user'] = $user;
       
        return null;
      
    }

    public function create(Request $request){
        
        $array = ['error' => '', 'success' => '', 'list' => []];
        $user = auth()->user();
        

        $validator = Validator::make($request->all(),[
            'social_reason' => 'required|string|max:255',
            'abbreviated' => 'required|string|max:255',
            'email' => 'required|email|unique:companies,email',
            'cnpj' => 'required|unique:companies,cnpj',
           
        ]);
        
        if(!$validator->fails()){

                $social_reason = $request->input('social_reason');
                $abbreviated = $request->input('abbreviated');
                $cnpj = $request->input('cnpj');
                $fone = $request->input('fone');
                $ie = $request->input('ie');
                $im = $request->input('im');
                $email = $request->input('email');
                $status = 1;
                $cep = $request->input('cep');
                $andress = $request->input('andress');
                $number = $request->input('number');
                $district = $request->input('district');
                $city = $request->input('city');
                $state = $request->input('state');
                $uf = $request->input('uf');

                $newCompany = new Company();
                $newCompany->social_reason = $social_reason;
                $newCompany->abbreviated = $abbreviated;
                $newCompany->cnpj = $cnpj;
                $newCompany->fone = $fone;
                $newCompany->ie = $ie;
                $newCompany->im = $im;
                $newCompany->email = $email;
                $newCompany->status = $status;
                $newCompany->cep = $cep;
                $newCompany->andress = $andress;
                $newCompany->number = $number;
                $newCompany->district = $district;
                $newCompany->city = $city;
                $newCompany->state = $state;
                $newCompany->uf = $uf;
                $newCompany->save();

                $array['success'] = 'Dados cadastrados com sucesso!!!';

        }else{

            $array['error'] = "Erro: Não foi possível cadastrar dos dados!!!";
            return $array;
        }              
       
       return $array; 
       
    }


    public function update(Request $request, $id){
    
        $array = ['error' => '', 'success' => '', 'list' => []];
        $user = auth()->user();
        $resCompany = Company::find($id);

        $data = $request->all();

        
     
        $validator = Validator::make(
        [

            'social_reason' => $data['social_reason'],
            'abbreviated' => $data['abbreviated'],
            


        ],        
        [
            'social_reason' => 'required',
            'abbreviated' => 'required'
          
        ]);
        
        if(!$validator->fails()){
           
             
             if($resCompany){

                $social_reason = $data['social_reason'];
                $abbreviated = $data['abbreviated'];
             

                if($resCompany->cnpj != $data['cnpj']){

                    $hasCnpj = Company::where('cnpj', $data['cnpj'])->get();
                    if(count($hasCnpj) === 0){
                        $cnpj = $data['cnpj'];
                    }else{
                        $validator->errors()->add('cnpj', __('validation.unique',[
                            'attribute' => 'cnpj'
                            
                        ]));
                    }
                }     
                $cnpj = $data['cnpj'];
                $fone = $data['fone'];
                $ie = $data['ie'];
                $im = $data['im'];

                if($resCompany->email != $data['email']){

                    $hasEmail = Company::where('email', $data['email'])->get();
                    if(count($hasEmail) === 0){
                        $email = $data['email'];
                    }else{
                        $validator->errors()->add('email', __('validation.unique',[
                            'attribute' => 'email'
                            
                        ]));
                    }
                }     
                $email = $data['email'];
                $status = $data['status'];
                
                $cep = $data['cep'];
                $andress = $data['andress'];
                $number = $data['number'];
                $district = $data['district'];
                $city = $data['city'];
                $state = $data['state'];
                $uf = $data['uf'];

                
                     
                Company::where('id', $id)->update([

                    'social_reason' => $social_reason,
                    'abbreviated' => $abbreviated,
                    'cnpj' => $cnpj,
                    'fone' => $fone,
                    'ie' => $ie,
                    'im' => $im,
                    'email' => $email,
                    'status' => $status,
                    'cep' => $cep,
                    'andress' => $andress,
                    'number' => $number,
                    'district' => $district,
                    'city' => $city,
                    'state' => $state,
                    'uf' => $uf


                ]);

                $array['success'] = 'Dados alterados com sucesso!!!';
            }else{
                $array['error'] = 'Dados não foram enviados, contate o administrador!!!';
                return $array;
            }  
        }else{
            $array['error'] = $validator->errors()->first();
            return $array;
        }
           
        $user = auth()->user();
        $array['user'] = $user;
       
       return $array; 
       
    }

    public function destroy($id){
        $array = ['error' => '', 'success' => ''];
        $user = auth()->user();
        
        if($id){

            Company::where('id', $id)->delete();
            $array['success'] = 'Registro deletado com sucesso !!!';

        }else{

            $array['error'] = 'Código não existe!!!';
            return $array;
        }

        return $array;
    }

}
