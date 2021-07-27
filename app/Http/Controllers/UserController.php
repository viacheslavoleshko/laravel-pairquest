<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
        /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        return view('rules');
    }

    public function accept(Request $request, $id)
    {
        $user = User::findOrFail($id);
        $user->accept = true;
        $user->save();

        return redirect()->route('quest');
    }
}
