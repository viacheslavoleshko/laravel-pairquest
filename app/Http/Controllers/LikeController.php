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
            $like = Like::updateOrCreate(
                ['task_id' => $id, 'user_id' => $user->id], 
                ['is_like' => $request->is_like]
            );
            $like->save();

        return redirect()->route('quest');
    }
}
