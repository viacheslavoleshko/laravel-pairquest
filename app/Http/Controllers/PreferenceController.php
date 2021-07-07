<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserLevel;
use App\Models\Preference;
use Illuminate\Http\Request;

class PreferenceController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('prefs', ['preferences' => Preference::all(), 'user_levels' => UserLevel::all()]);
    }

    public function store(Request $request, $id)
    {
        $user = User::findOrFail($id);

        $validatedData = $request->validate([
            'preferences' => 'required',
            'user_level' => 'required',
        ]);

        $user->user_level_id = $request->user_level;
        $user->preferences()->detach(); // delete all preferences w/ user
        foreach ($validatedData['preferences'] as $preference) {
            $user->preferences()->syncWithoutDetaching($preference);
        }

        $user->save();
        return redirect()->route('locations');
    }
}
