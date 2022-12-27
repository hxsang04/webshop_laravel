<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Validator;
use Illuminate\Support\Str;


class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::where('level', 1)->orWhere('level', 0)->orderByDesc('id')->paginate(10);

        return view('admin.user.view',  ['users' => $users]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.user.create');
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {  
        $validator = Validator::make($request->all(), [
            'fullname' => 'required',
            'email' => 'required|email:filter',
            'password' =>'required|confirmed|min:6',
            'password_confirmation' =>'required|min:6',
            'gender' =>'required',
            'phonenumber' =>'required|min:10|numeric',
            'level' =>'required'
        ], [
            'phonenumber.numeric' => 'Phone number must include digits.',
            'password.confirmed' => 'Confirm password does not match.'
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }
        elseif($request->hasFile('image')){
            $slug = Str::of($request->input('fullname'))->slug('-');
            $original_name = $request->file('image')->getClientoriginalName();
            $new_name = 'avatar-' . $slug . '-' . $original_name;
            $path = 'uploads/user/' . date('Y/m/d');
            $request->file('image')->storeAs(
                'public/' . $path , $new_name);
        }
        $request->merge(['avatar' => 'storage/'. $path . '/' . $new_name]);
        $user = $request->all();
        $user['password'] = Hash::make($request->get('password'));

        if (User::create($user)){
            return redirect('admin/user/create')->with('success', 'SUCCESS: New user was successfully added!');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user = User::find($id);

        return view('admin.user.show',  compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {   
        $user = User::Find($id);
        $user->delete();
        return redirect('admin/user')->with('success','WELL DONE: User has been deleted successfully!');
    }

}
