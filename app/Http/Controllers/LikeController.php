<?php

namespace App\Http\Controllers;

use App\Models\Like;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LikeController extends Controller
{
    public function store(Request $request, $id)
    {
        $user = User::with('locations')->findOrFail(Auth::user()->id);
        if($request->is_like == 1) {
            $like = Like::firstOrCreate(
                ['task_id' => $id, 'user_id' => $user->id], 
                ['is_like' => 1]
            );
        } elseif($request->is_like == 0) {
            $like = Like::firstOrCreate(
                ['task_id' => $id, 'user_id' => $user->id], 
                ['is_like' => 0]
            );
        }
        return redirect()->route('quest');
    }
}
