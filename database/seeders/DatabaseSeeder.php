<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            CategorySeeder::class, // php artisan db:seed --class=CategorySeeder
            PostSeeder::class, // php artisan db:seed --class=PostSeeder
        ]);
    }
}
