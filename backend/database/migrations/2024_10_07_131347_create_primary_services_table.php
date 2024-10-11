<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('primary_services', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('image');
            $table->text('summery')->nullable();
            $table->string('btn_title');
            $table->string('btn_url');
            $table->string('btn_target', 20);
            $table->string('btn_icon', 120)->comment('Font Awesome V6 All Free Icons');
            $table->boolean('status')->default(true);
            $table->unsignedBigInteger('serial')->nullable();
            $table->foreignId('created_by')->nullable()->constrained('users')->cascadeOnDelete()->cascadeOnUpdate();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('primary_services');
    }
};
