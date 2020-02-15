<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Agent extends Model
{

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'pp_parking_agents';
    protected $primaryKey = "agent_id";
    const CREATED_AT = 'created_At';
    const UPDATED_AT = 'updated_At';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'agent_id', 'agent_name', 'telephone_number', 'date_of_birth', 'gender', 'nid_number', 'agent_status',
    ];

}
