<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Faker\Factory as Faker;

class KelurahanSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		for ($i=1; $i < 11 ; $i++) { 
			DB::table('kelurahan')->insert([
				'province' => Str::random(20),
				'city' => Str::random(20),
				'subdistrict' => Str::random(20),
				'village_district' => Str::random(20),
				'postal_code' => random_int(10000,99999)
			]);
		}
		
    }
}
