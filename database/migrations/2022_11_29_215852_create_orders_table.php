<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id')->unsigned();
            $table->string('user_fullname');
            $table->string('user_email');
            $table->string('user_phonenumber');
            $table->string('user_country');
            $table->string('user_address');
            $table->string('user_postcode');
            $table->tinyInteger('status')->default(0);
            $table->integer('discount')->default(0);
            $table->text('message')->nullable();
            $table->string('payment');
            $table->double('total_price');

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
        Schema::dropIfExists('orders');
    }
}
