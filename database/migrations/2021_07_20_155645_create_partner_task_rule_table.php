<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePartnerTaskRuleTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('partner_task_rule', function (Blueprint $table) {
            $table->id();
            
            $table->unsignedBigInteger('partner_task_id')->index();
            $table->foreign('partner_task_id')->references('id')->on('partner_tasks')->onDelete('cascade');

            $table->unsignedBigInteger('partner_rule_id')->index();
            $table->foreign('partner_rule_id')->references('id')->on('partner_rules')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('partner_task_rule');
    }
}
