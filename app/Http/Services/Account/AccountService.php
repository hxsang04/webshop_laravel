<?php

namespace App\Http\Services\Account;

use App\Models\User;
use Str;
use Auth;

class AccountService{

    public function update($request){

        $user = User::find(Auth::id());

        if($request->hasFile('image')){
            $slug = Str::of($request->input('fullname'))->slug('-');
            $original_name = $request->file('image')->getClientoriginalName();
            $new_name = 'avatar-' . $slug . '-' . $original_name;
            $path = 'uploads/user/' . date('Y/m/d');
            $request->file('image')->storeAs('public/' . $path , $new_name);
            $user->avatar = 'storage/'. $path. '/' . $new_name;
        }

        $user->fullname = $request->input('fullname');
        $user->phonenumber = $request->input('phonenumber');
        $user->gender = $request->input('gender');
        $user->address = $request->input('address');
        $user->country = $request->input('country');
        $user->postcode = $request->input('postcode');
        $user->save();

        return true;
    }
}