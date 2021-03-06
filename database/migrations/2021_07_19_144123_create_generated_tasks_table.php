<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGeneratedTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('generated_tasks', function (Blueprint $table) {
            $table->id();

            $table->unsignedBigInteger('user_id')->index();
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');

            $table->unsignedBigInteger('partner_id');

            $table->unsignedBigInteger('location_id')->index();
            $table->foreign('location_id')->references('id')->on('locations')->onDelete('cascade');

            $table->unsignedBigInteger('location_description_id')->index()->nullable();
            $table->foreign('location_description_id')->references('id')->on('location_descriptions');

            $table->timestamp('started_at')->nullable();

            $table->unsignedBigInteger('task_id')->index();
            $table->foreign('task_id')->references('id')->on('tasks')->onDelete('cascade');


            $table->unsignedBigInteger('detailed_task_id')->index();
            $table->foreign('detailed_task_id')->references('id')->on('detailed_tasks')->onDelete('cascade');


            $table->unsignedBigInteger('partner_task_id')->index()->nullable();
            $table->foreign('partner_task_id')->references('partner_task_id')->on('task_combinations');

            $table->boolean('is_rejected')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('generated_tasks');
    }
}
