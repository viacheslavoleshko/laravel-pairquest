<?php

namespace App\Http\Controllers;

use App\Models\Feedback;
use App\Models\FeedbackType;
use Illuminate\Http\Request;

class FeedbackController extends Controller
{
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
        return view('feedback', ['feedback_types' => FeedbackType::all()]);
    }

    public function store(Request $request, $id)
    {
        $validatedData = $request->validate([
            'feedback_type' => 'required',
            'feedback' => 'required|string|max:500',
        ]);

        $feedback = new Feedback();
        $feedback->type_id = $validatedData['feedback_type'];
        $feedback->feedback = $validatedData['feedback'];
        $feedback->user_id = $id;
        $feedback->save();

        return back()->with('status', 'Feedback Sended!');
    }
}
