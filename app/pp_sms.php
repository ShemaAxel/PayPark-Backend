<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class pp_sms extends Model
{

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'pp_sms';
    protected $primaryKey = "smsId";
    const CREATED_AT = 'created_At';
    const UPDATED_AT = 'updated_At';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'smsId', 'telephone_number', 'body', 'sent',
    ];

}
