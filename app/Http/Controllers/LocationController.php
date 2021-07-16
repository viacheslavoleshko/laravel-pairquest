<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Location;
use Illuminate\Http\Request;

class LocationController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('locations');
    }

    public function store(Request $request, $id)
    {
        // $user = User::with('locations')->findOrFail($id);

        $validatedData = $request->validate([
            'locations.*' => 'required',
        ]);

        foreach ($validatedData['locations'] as $location) {
            $new_location = Location::firstOrCreate(['name' => $location, 'user_id' => $id]);
        }
        return redirect()->route('quest');
    }
}
