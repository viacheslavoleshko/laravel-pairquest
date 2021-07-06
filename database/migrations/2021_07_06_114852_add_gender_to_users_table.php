<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddGenderToUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('partner_email')->nullable();

            $table->unsignedBigInteger('gender_id')->index()->nullable();
            $table->foreign('gender_id')->references('id')->on('genders')->onDelete('cascade');

            $table->unsignedBigInteger('user_level_id')->index()->nullable();
            $table->foreign('user_level_id')->references('id')->on('user_levels')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropForeign(['gender_id', 'user_level_id']);
            $table->dropIndex(['gender_id', 'user_level_id']);
            $table->dropColumn(['gender_id', 'user_level_id', 'partner_email']);
        });
    }
}
