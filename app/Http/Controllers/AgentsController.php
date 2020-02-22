<?php

namespace App\Http\Controllers;

use App\Agent;
use App\Http\Resources\Helper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class AgentsController extends Controller
{

    /**
     * @var $helpers an instance of the helpers class
     */
    private $helpers;

    public function __construct()
    {
        $this->helpers = Helper::instantiate();
    }

    /**
     * View all Active Agents
     *
     * @return Json
     */
    public function all()
    {
        try {
            Log::info('Access View Agents End Point');

            $agents = Agent::where([
                ["agent_status", "=", "Active"],
            ])->get();

            return response()->json([
                "responseDescription" => "all Active Agents",
                "meta" => [
                    "content" => $agents,
                ],
            ], 200);

        } catch (Exception $ex) {
            Log::error("Application . Exception : " . $ex->getMessage());

            return response()->json($ex->getMessage(), 500);
        }

    }

    /**
     * Find agent by phone number
     *
     * @return Json
     */
    public function find($telephone)
    {
        //search by number
        $agent = $this->helpers->find($telephone);

        return response()->json([
            "responseDescription" => "Agent Details",
            "meta" => [
                "content" => $agent,
            ],
        ], 200);

    }

    /**
     * Find agent by phone number
     *
     * @return Json
     */
    public function resetPassword($telephone)
    {
        //search by agent
        $agent = $this->helpers->find($telephone);

        if ($agent) {
            //generate new PIN
            Log::info('Generating PIN');
            $PIN = $this->helpers->generatePIN();

            //update agent with new PIN
            Log::info('Updating agent with new PIN');
            $agent->PIN = password_hash($PIN, PASSWORD_ARGON2I);
            $agent->save();

            //log a message
            Log::info('Logging SMS');
            $body = "Your PIN is : " . $PIN;
            $this->helpers->logSMS($telephone, $body);

            //response
            return response()->json([
                "responseDescription" => "PIN updated Successfully.",
                "meta" => [
                    "content" => $telephone,
                ],
            ], 200);

        } else {
            //response
            Log::error('Agent not found: ' . $telephone);
            return response()->json([
                "responseDescription" => "Agent Not Found.",
                "meta" => [
                    "content" => null,
                ],
            ], 200);
        }
    }

    /**
     * View all Active Agents
     *
     * @return Json
     */
    public function create(Request $request)
    {
        try {
            Log::info('Access Create Agent End Point');

            //validate request
            $notValid = $this->helpers->requestValidator($request);

            if ($notValid) {
                Log::error("Validation Error.");
                return response()->json([
                    "responseDescription" => "Invalid Request.",
                    "meta" => [
                        "content" => $notValid,
                    ],
                ], 200);
            }

            //search by number
            $agent = $this->helpers->find($request->telephone_number);

            if ($agent) {
                Log::error("Telephone number already taken: " . $request->telephone_number);
                return response()->json([
                    "responseDescription" => "Phone number already taken.",
                    "meta" => [
                        "content" => $request->telephone_number,
                    ],
                ], 200);
            }

            //save agent
            $agent = $this->helpers->createAgent($request);

            if (!$agent) {

                Log::error("An error occured");
                return response()->json([
                    "responseDescription" => "An error occured, while saving an Agent.",
                    "meta" => [
                        "content" => null,
                    ],
                ], 200);
            }

            Log::info('Preparing response');
            return response()->json([
                "responseDescription" => "Agent Created",
                "meta" => [
                    "content" => $agent,
                ],
            ], 200);

        } catch (Exception $ex) {

            Log::error("Application . Exception : " . $ex->getMessage());
            return response()->json($ex->getMessage(), 500);
        }

    }

    /**
     * Agents Login end point
     *
     * @return Json
     */
    public function login(Request $request)
    {
        try {

            Log::info('Access Agent-Login End Point');
            //validate request
            $notValid = $this->helpers->loginRequestValidator($request);

            if ($notValid) {
                Log::error("Validation Error.");
                return response()->json([
                    "status" => [
                        "success" => false,
                        "message" => "invalid request",
                    ],
                    "data" => [
                        "meta" => $notValid,
                    ],
                ], 200);
            }

            Log::info('Searching agent.');

            $agent = $this->helpers->find($request->telephone_number);
            if ($agent) {

                Log::info('Validating credentials.');

                $login = $this->helpers->loginProcessor($agent, $request->PIN);

                if ($login) {
                    return response()->json([
                        "status" => [
                            "success" => $login,
                            "message" => "login",
                        ],
                        "data" => [
                            "meta" => $agent,
                        ],
                    ], 200);
                } else {
                    return response()->json([
                        "status" => [
                            "success" => $login,
                            "message" => "login",
                        ],
                        "data" => [
                            "meta" => null,
                        ],
                    ], 200);
                }

            } else {

                Log::error('Agent doesnt exist.');
                return response()->json([
                    "status" => [
                        "success" => false,
                        "message" => "login",
                    ],
                    "data" => [
                        "meta" => null,
                    ],
                ], 200);
            }

        } catch (Exception $ex) {

            Log::error("Application . Exception : " . $ex->getMessage());
            return response()->json($ex->getMessage(), 500);
        }
    }

}
