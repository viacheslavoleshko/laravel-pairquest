<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Location;
use App\Models\UserLevel;
use App\Models\Preference;
use Illuminate\Http\Request;

class PreferenceController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth', 'accept']);
    }

    public function index()
    {
        return view('prefs', ['preferences' => Preference::all(), 'locations' => Location::all(), 'user_levels' => UserLevel::all()]);
    }

    public function store(Request $request, $id)
    {
        $user = User::findOrFail($id);

        $validatedData = $request->validate([
            'preferences' => 'required',
            'user_levels' => 'required',
            'locations' => 'required',
        ]);

        $user->user_levels()->sync($validatedData['user_levels']);
        $user->locations()->sync($validatedData['locations']);
        $user->preferences()->sync($validatedData['preferences']);
        $user->intimate = $request->intimate;
        $user->save();

        return redirect()->route('quest');
    }
}
