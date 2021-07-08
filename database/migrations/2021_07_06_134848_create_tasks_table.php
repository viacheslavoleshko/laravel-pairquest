<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->id();
            $table->string('name');

            $table->unsignedBigInteger('preference_id')->index();
            $table->foreign('preference_id')->references('id')->on('preferences')->onDelete('cascade');

            $table->unsignedBigInteger('duration_id')->index();
            $table->foreign('duration_id')->references('id')->on('durations')->onDelete('cascade');

            $table->unsignedBigInteger('user_level_id')->index();
            $table->foreign('user_level_id')->references('id')->on('user_levels')->onDelete('cascade');

            $table->boolean('is_partner_task');
            $table->text('description');
            $table->boolean('is_accessories');

            $table->unsignedBigInteger('gender_id')->index();
            $table->foreign('gender_id')->references('id')->on('genders')->onDelete('cascade');

            $table->string('image')->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tasks');
    }
}
