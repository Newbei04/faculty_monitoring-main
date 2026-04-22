<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // For PostgreSQL
        if (DB::getDriverName() === 'pgsql') {
            DB::statement('ALTER TABLE subjects ALTER COLUMN code TYPE VARCHAR(255)');
            DB::statement('ALTER TABLE subjects ADD CONSTRAINT subjects_code_unique UNIQUE (code)');
        }

        // For MySQL
        if (DB::getDriverName() === 'mysql') {
            DB::statement('ALTER TABLE subjects MODIFY COLUMN code VARCHAR(255)');
            DB::statement('ALTER TABLE subjects ADD UNIQUE (code)');
        }
    }

    public function down(): void
    {
        if (DB::getDriverName() === 'pgsql') {
            DB::statement('ALTER TABLE subjects DROP CONSTRAINT IF EXISTS subjects_code_unique');
        }

        if (DB::getDriverName() === 'mysql') {
            DB::statement('ALTER TABLE subjects DROP INDEX code');
        }
    }
};
