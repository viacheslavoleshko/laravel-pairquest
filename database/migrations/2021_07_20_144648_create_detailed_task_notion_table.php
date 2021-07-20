<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDetailedTaskNotionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('detailed_task_notion', function (Blueprint $table) {
            $table->id();
            
            $table->unsignedBigInteger('detailed_task_id')->index();
            $table->foreign('detailed_task_id')->references('id')->on('detailed_tasks')->onDelete('cascade');

            $table->unsignedBigInteger('notion_id')->index();
            $table->foreign('notion_id')->references('id')->on('notions')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('detailed_task_notion');
    }
}
