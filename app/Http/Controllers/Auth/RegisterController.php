<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use App\Models\Gender;
use App\Mail\UserRegistered;
use App\Http\Controllers\Controller;
use App\Notifications\Telegram;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Notification;


class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Show the application registration form.
     *
     * @return \Illuminate\View\View
     */
    public function showRegistrationForm()
    {
        return view('auth.register', ['genders' => Gender::all()]);
    }

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'telegram_user_id' => ['nullable', 'numeric', 'unique:users'],
            'password' => ['required', 'string', 'min:8'],
            'gender' => ['required'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\Models\User
     */
    protected function create(array $data)
    {
        return $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'telegram_user_id' => $data['telegram_user_id'],
            'password' => Hash::make($data['password']),
            'role_id' => 2,
            'gender_id' => $data['gender'],
        ]);
    }

    /**
     * The user has been registered.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  mixed  $user
     * @return mixed
     */
    protected function registered($user)
    {
        Mail::to($user)->send(new UserRegistered);
        // Notification::send($user, new Telegram);
    }
}
