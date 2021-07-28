<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class ProfileController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware(['auth', 'accept']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('profile');
    }

    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);

        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'telegram_user_id' => 'nullable|numeric|unique:users',
            'current_password' => 'required',
        ]);

        if (!Hash::check($validatedData['current_password'], $user->password)) {
            return back()->withErrors(['current_password' => 'Password not match']);
        }

        if($request->hasFile('avatar')) {

            $path = $request->file('avatar')->store('users');

            if($user->avatar) {
                Storage::delete($user->avatar);
            }

            $user->avatar = $path;
        }

        $user->name = $validatedData['name'];
        if(isset($validatedData['telegram_user_id'])) {
            $user->telegram_user_id = $validatedData['telegram_user_id'];
        }
        $user->save();

        return back()->with('status', 'Profile Updated!');
    }
}
