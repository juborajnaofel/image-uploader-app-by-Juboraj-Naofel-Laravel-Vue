<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use App\Jobs\DownloadImage;
class UserController extends Controller
{

    public function load_images(){
        $images = DB::table('uploads')->where('user_id', auth()->user()->id)->get();
        return response(['images' => $images, 200]);
    }
    public function uplaod_image(Request $request){
        $attr = $request->validate([
            'url' => 'required|string'
        ]);
        $details['url'] = $request->url;
        $details['id'] = auth()->user()->id;
        dispatch(new DownloadImage($details));
    }

    public function register(Request $request)
    {
        try{
            $attr = $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|string|email|unique:users,email',
                'password' => 'required|string|confirmed'
            ]);

            $user = User::create([
                'name' => $attr['name'],
                'password' => Hash::make($attr['password']),
                'email' => $attr['email']
            ]);

            return response(['user_info'=> ['id'=> $user->id, 'name'=> $user->name ] , 'token' => $user->createToken('API Token')->plainTextToken], 201);
        }catch(Exception $e){
            return response(['user_info'=> [] , 'token' => NULL], 406);
        }
    }
    public function login(Request $request)
    {
        try{
            $attr = $request->validate([
                'email' => 'required|string|email|',
                'password' => 'required|string'
            ]);
            
            $user = User::where('email', $request->email)->first();
            if($user){
                if(Hash::check($request->password, $user->password)){
                    
                    return response(['user_info'=> ['id'=> $user->id, 'name'=> $user->name ] , 'token' => $user->createToken('API Token')->plainTextToken], 200);
                }
            }
        }catch(Exception $e){
            return response(['user_info'=> [] , 'token' => NULL], 406);
        }
    }


    public function logout()
    {
        DB::table('personal_access_tokens')->where('tokenable_id', auth()->user()->id)->delete();
        return response(['user_info'=> [] , 'token' => NULL], 200);
        
    }
}
