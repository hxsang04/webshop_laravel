<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('fullname', 50);
            $table->string('email', 50)->unique();
            $table->string('password',20);
            $table->tinyInteger('gender');
            $table->string('phonenumber', 20);
            $table->string('address');
            $table->string('avatar')->nullable();
            $table->tinyInteger('level');
            $table->tinyInteger('active')->default(0);
            $table->string('country')->nullable();
            $table->integer('postcode')->nullable();

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
        Schema::dropIfExists('users');
    }
}
