<?php

namespace Database\Seeders;

use App\Models\Gender;
use Illuminate\Database\Seeder;

class GenderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $genders = collect(['Male', 'Female']);

        $genders->each(function($genderName) {
            $gender = new Gender();
            $gender->name = $genderName;
            $gender->save();
        });
    }
}
