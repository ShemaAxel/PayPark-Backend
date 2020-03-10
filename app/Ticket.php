<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'pp_parking_tickets';
    protected $primaryKey = "ticket_no";
    const CREATED_AT = 'created_At';
    const UPDATED_AT = 'updated_At';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'ticket_no', 'number_plate', 'location_id', 'agent_id', 'status', 'date_time_out', 'product_id','updated_At','created_At',
    ];

}
