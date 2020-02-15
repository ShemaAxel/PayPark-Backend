<?php
namespace App\Http\Resources;

use App\Agent;
use App\pp_sms;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Illuminate\Validation\Validator;

class Helper
{
    /**
     * Holds the real PIN value
     */
    public $PIN;

    /**
     * Singleton instance of the class
     */
    public static $singleton = null;

    /**
     * find agent by telephone number
     *
     * @param Telephone_number $telephone
     * @return Agent
     */

    public function find($telephone)
    {
        $agent = Agent::where([
            ["agent_status", "=", "Active"],
            ["telephone_number", "=", $telephone],
        ])->first();

        return $agent;
    }

    /**
     * creates a new agent.
     *
     * @param Illuminate\Http\Request $request containing all the Agents details
     * @return Agent
     */

    public function createAgent($request)
    {

        Log::info('registering new Agent');

        $agent = new Agent;
        $agent->agent_name = $request->agent_name;
        $agent->telephone_number = $request->telephone_number;
        $agent->date_of_birth = $request->date_of_birth;
        $agent->gender = $request->gender;
        $agent->nid_number = $request->nid_number;
        $agent->agent_status = "Active";
        $agent->PIN = password_hash($this->generatePIN(), PASSWORD_ARGON2I);
        $agent->created_At = $agent->updated_At = date("Y-m-d H:i:s");
        $agent->save();

        Log::info('Logging SMS');
        $body = "Your PIN is : " . $this->PIN;
        $this->logSMS($request->telephone_number, $body);

        Log::info('Agent saved : ' . $agent->agent_id);

        return $agent;
    }

    /**
     * Validate reuest.
     * @param  Illuminate\Http\Request $request containing all the customer details
     * @return array
     */

    public function requestValidator($request)
    {
        try {

            $validator = \Validator::make($request->all(), [
                "agent_name" => "required",
                "telephone_number" => "required",
                "date_of_birth" => "required",
                "gender" => "required",
                "nid_number" => "required",
            ])->validate();

            return null;

        } catch (ValidationException $e) {
            $arr = [];
            foreach ($e->errors() as $key => $value) {
                $arr[$key] = $value[0];
            }

            return $arr;
        }
    }

    //generate hash password

    public function generatePIN()
    {
        $this->PIN = mt_rand(1000, 9999);
        return $this->PIN;
    }

    //log sms

    public function logSMS($tel, $body)
    {
        $sms = new pp_sms;
        $sms->telephone_number = $tel;
        $sms->body = $body;
        $sms->sent = 0;
        $sms->created_At = $sms->updated_At = date("Y-m-d H:i:s");
        $sms->save();
    }

    public static function instantiate()
    {
        if (is_null(self::$singleton)) {
            self::$singleton = new Helper();
        }
        return self::$singleton;
    }
}
