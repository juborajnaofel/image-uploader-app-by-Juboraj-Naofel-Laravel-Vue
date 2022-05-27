<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;
class DownloadImage implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $details;
  
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($details)
    {
        $this->details = $details;
    }
  

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        
        $url = $this->details['url'];
        $contents = file_get_contents($url);
        $name = $this->details['id'].'_'.time().'_'.substr($url, strrpos($url, '/') + 1);
        Storage::disk('public')->put($name, $contents);
        DB::table('uploads')->insert([
            'url' => $name,
            'user_id' => $this->details['id']
        ]);
    }
}
