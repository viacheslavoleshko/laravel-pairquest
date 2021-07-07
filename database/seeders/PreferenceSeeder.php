<?php

namespace Database\Seeders;

use App\Models\Preference;
use Illuminate\Database\Seeder;

class PreferenceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $preferenceCount = max((int)$this->command->ask('How many preferences would you like?', 12), 1);

        Preference::factory($preferenceCount)->create();
    }
}
