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
        Schema::table('services_products', function (Blueprint $table) {
            // $table->text('summery')->nullable()->after('name');
            $table->text('summery')->change();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('services_products', function (Blueprint $table) {
            $table->string('summery', 255)->change();
        });
    }
};
