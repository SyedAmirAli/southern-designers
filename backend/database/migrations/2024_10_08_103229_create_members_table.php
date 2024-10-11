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
        Schema::create('members', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('title')->nullable();
            $table->string('phone')->nullable();
            $table->string('email')->nullable();
            $table->string('image');

            $table->string('fb_icon')->nullable();
            $table->string('fb_url')->nullable();
            $table->string('fb_target')->default('_blank');

            $table->string('x_icon')->nullable();
            $table->string('x_url')->nullable();
            $table->string('x_target')->default('_blank');

            $table->string('instagram_icon')->nullable();
            $table->string('instagram_url')->nullable();
            $table->string('instagram_target')->default('_blank');

            $table->string('linkedin_icon')->nullable();
            $table->string('linkedin_url')->nullable();
            $table->string('linkedin_target')->default('_blank');

            $table->unsignedBigInteger('serial')->nullable();
            $table->boolean('status')->default(true);
            $table->foreignId('created_by')->nullable()->constrained('users')->cascadeOnDelete()->cascadeOnUpdate();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('members');
    }
};
