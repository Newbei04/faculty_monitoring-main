<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Database\Seeders\DataSeeder;
use App\Models\User;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            DataSeeder::class
        ]);
        // \App\Models\User::factory(10)->create();

        \App\Models\User::factory()->create([
            'email' => 'admin@gmail.com',
            'password' => Hash::make('123456'),
            'first_name' => 'Admin',
            'last_name' => 'User',
            'middle_initial' => null,
            'name_extension' => null,
            'role' => 'admin'
        ]);
    }
}
