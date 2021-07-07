<?php

namespace App\Http\Controllers;

use App\Models\Accessory;
use Illuminate\Http\Request;

class AccessoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('accessories');
    }

    public function store(Request $request, $id)
    {
        // $user = User::with('locations')->findOrFail($id);

        $validatedData = $request->validate([
            'accessories' => 'required',
        ]);

        foreach ($validatedData['accessories'] as $accessory) {
            $new_accessory = new Accessory();
            $new_accessory->name = $accessory;
            $new_accessory->user_id = $id;
            $new_accessory->save();
        }
        return redirect()->route('quest');
    }
}
