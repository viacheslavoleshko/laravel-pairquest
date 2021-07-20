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
            $table->text('description');
            $table->text('partner_description');
            
            $table->unsignedBigInteger('location_type_id')->index();
            $table->foreign('location_type_id')->references('id')->on('location_types')->onDelete('cascade');

            $table->unsignedBigInteger('preference_id')->index();
            $table->foreign('preference_id')->references('id')->on('preferences')->onDelete('cascade');
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
