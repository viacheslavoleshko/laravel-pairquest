<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Accessory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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
            'accessories.*' => 'required|unique:accessories,name',
            'preferences.*' => 'required',
        ]);

        foreach ($validatedData['accessories'] as $key => $accessory) {
            $new_accessory = Accessory::firstOrCreate(['name' => $accessory, 'preference_id' => $validatedData['preferences'][$key], 'user_id' => $id]);
        }
        return redirect()->route('quest');
    }
}
