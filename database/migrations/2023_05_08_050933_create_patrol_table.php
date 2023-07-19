<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('patrol', function (Blueprint $table) {
            $table->id();
            $table->integer('location_id');
            $table->integer('user_id');
            $table->string('condition');
            $table->text('condition_note');
            $table->text('photo_one')->nullable();
            $table->text('photo_two')->nullable();
            $table->text('photo_three')->nullable();
            $table->text('video')->nullable();
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
        Schema::dropIfExists('patrol');
    }
};
