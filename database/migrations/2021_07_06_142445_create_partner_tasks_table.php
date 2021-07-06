<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePartnerTasksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('partner_tasks', function (Blueprint $table) {
            $table->id();
            $table->text('partner_description');

            $table->unsignedBigInteger('gender_id')->index();
            $table->foreign('gender_id')->references('id')->on('genders')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('partner_tasks');
    }
}
