<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('birth_place')->nullable()->change();
            $table->string('birth_date')->nullable()->change();
            $table->string('address')->nullable()->change();
            $table->string('gender')->nullable()->change();
            $table->string('employee_position')->nullable()->change();
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
            $table->string('birth_place')->nullable(false)->change();
            $table->string('birth_date')->nullable(false)->change();
            $table->string('address')->nullable(false)->change();
            $table->string('gender')->nullable(false)->change();
            $table->string('employee_position')->nullable(false)->change();
        });
    }
};
