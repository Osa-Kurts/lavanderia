<?php

declare(strict_types=1);

namespace App\Providers;

use Illuminate\Support\Facades\Broadcast;
use Illuminate\Support\ServiceProvider;

class BroadcastServiceProvider extends ServiceProvider
{
    /**
     * Suppress all warnings from these two rules.
     *
     * @SuppressWarnings(PHPMD)
     */
    public function boot()
    {
        Broadcast::routes();
        include base_path('routes/channels.php');
    }
}
