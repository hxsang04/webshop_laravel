<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProfileController extends Controller
{
    public function index(){
        return view('admin.profile.index');
    }

    public function update(Request $request){
        Auth::user()->fill($request->all())->save();
        return redirect()->back()->with('success','SUCCESS: Your profile has been updated!');
    }

    public function changePassword(){
        return view('admin.profile.changePassword');
    }

    public function changePasswordPost(Request $request){

    }
}
