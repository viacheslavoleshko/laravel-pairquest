<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\Post;
use Illuminate\Database\Seeder;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $postCount = (int)$this->command->ask('How many posts would you like?', 20);
        $categories = Category::all();

        Post::factory($postCount)->make()->each(function($post) use ($categories) { // создать 20 постов использовать созданные категории
            $post->category_id = $categories->random()->id; // в каждом посту category_id выбрать рандомный id из категорий
            $post->save();
        });
    }
}
