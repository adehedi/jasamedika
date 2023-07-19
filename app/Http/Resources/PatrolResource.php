<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PatrolResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $data = parent::toArray($request);

        // Manipulating image url
        $data['photo_one'] = isset($data['photo_one']) ? $this->getFullUrl($data['photo_one']) : null;
        $data['photo_two'] = isset($data['photo_two']) ? $this->getFullUrl($data['photo_two']) : null;
        $data['photo_three'] = isset($data['photo_three']) ? $this->getFullUrl($data['photo_three']) : null;
        $data['video'] = isset($data['video']) ? $this->getFullUrl($data['video']) : null;

        return $data;
    }

    private function getFullUrl($filename)
    {
        // Mendapatkan base URL dari environment atau menggunakan nilai tetap jika Anda telah menentukannya secara manual
        $baseUrl = env('APP_URL', 'http://localhost');

        // Menggabungkan base URL dengan path foto untuk mendapatkan URL lengkap
        return $baseUrl . '/' . $filename;
    }
}
