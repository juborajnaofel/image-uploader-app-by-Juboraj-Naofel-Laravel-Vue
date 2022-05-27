<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Broadcast;
class ImageUploadNotify implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;
    protected $devent_;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($devent)
    {
        $this->devent_ = $devent;
    }

    public function broadcastWith(){
        return [
            'id' => $this->devent_
        ];
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        Broadcast::routes(['middleware' => ['auth:sanctum']]);
        return new PrivateChannel('channel');
    }
}
