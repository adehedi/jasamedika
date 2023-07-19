<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        \App\Models\User::factory()->create([
            'employee_id' => 'E0001',
            'name' => 'Test User',
            'birth_place' => 'Jakarta',
            'birth_date' => '2023-05-08',
            'address' => 'Jakarta',
            'gender' => 'L',
            'employee_position' => 'Manajer',
            'email' => 'test@example.com',
            'email_verified_at' => null,
            'password' => '$2y$10$m7KDgdGfpxKaEbaxiKZTWukuFsphvT7PFKgGQM1Qwzqx1WB0Gvgee'
        ]);
    }
}
