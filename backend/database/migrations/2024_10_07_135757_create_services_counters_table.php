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
        Schema::create('services_counters', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->unsignedBigInteger('value');
            $table->string('icon', 120)->comment('Font Awesome V6 All Free Icons');
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
        Schema::dropIfExists('services_counters');
    }
};
