<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PartnerController extends Controller
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

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $user = User::findOrFail(Auth::user()->id);

        if(isset($user->partner_email) && isset($user->user_level_id)) {
            return redirect()->route('quest');
        } elseif (isset($user->partner_email) && is_null($user->user_level_id)) {
            return redirect()->route('prefs');
        } else {
            return view('partner');
        }
    }

    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);

        $validatedData = $request->validate([
            'partner_email' => 'bail|required|string|email|max:255|exists:users,email',
        ]);

        $user->partner_email = $validatedData['partner_email'];
        $user->save();

        return redirect()->route('prefs');
    }
}
