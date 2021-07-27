<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDetailedTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('detailed_tasks', function (Blueprint $table) {
            $table->id();
            $table->text('description');
            $table->text('custom_partner_task')->nullable();

            $table->unsignedBigInteger('location_type_id')->index();
            $table->foreign('location_type_id')->references('id')->on('location_types')->onDelete('cascade');

            $table->unsignedBigInteger('preference_id')->index();
            $table->foreign('preference_id')->references('id')->on('preferences')->onDelete('cascade');

            $table->unsignedBigInteger('duration_id')->index();
            $table->foreign('duration_id')->references('id')->on('durations')->onDelete('cascade');

            $table->unsignedBigInteger('user_level_id')->index();
            $table->foreign('user_level_id')->references('id')->on('user_levels')->onDelete('cascade');

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
        Schema::dropIfExists('detailed_tasks');
    }
}
