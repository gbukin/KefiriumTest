<?php

namespace Tests\Feature;

use Tests\TestCase;

class GoogleAuthTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    public function test_has_google_oauth_route(): void
    {
        $this->assertTrue(\Route::has('google.redirect'));
        $this->assertTrue(\Route::has('google.callback'));
    }

    public function test_google_oauth_id_and_secret_not_empty()
    {
        $this->assertNotEmpty(\Config::get('services.google.client_id'));
        $this->assertNotEmpty(\Config::get('services.google.client_secret'));
    }
}
