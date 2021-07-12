<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Accessory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class AccessoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = User::with('preferences')->findOrFail(Auth::user()->id);
        return view('accessories', ['preferences' => $user->preferences]);
    }

    public function store(Request $request, $id)
    {
        // $user = User::with('locations')->findOrFail($id);

        $validatedData = $request->validate([
            // 'accessories.*' => ['required', Rule::unique('accessories', 'name')->ignore($id, 'user_id')],
            // 'accessories.*' => 'required_with:preferences[]',
            // 'preferences.*' => 'required_with:accessories[]',
        ]);

        foreach ($request->accessories as $key => $accessory) {
            // $new_accessory = Accessory::firstOrCreate(['name' => $accessory, 'preference_id' => $validatedData['preferences'][$key], 'user_id' => $id]); // 1 accessory to MANY preferences
            $new_accessory = Accessory::firstOrCreate(['name' => $accessory, 'user_id' => $id], ['preference_id' => $request->preferences[$key]]);  // 1 accessory to 1 preference
        }
        return redirect()->route('quest');
    }
}
