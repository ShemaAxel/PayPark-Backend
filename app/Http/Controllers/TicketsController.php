<?php

namespace App\Http\Controllers;

use App\Tickets;
use Illuminate\Support\Facades\Log;

class TicketsController extends Controller
{
    /**
     * View all tickets
     *
     * @return void
     */
    public function all()
    {
        try {
            Log::info('Access View Tickets End Point');

            $tickets = Tickets::all();

            return response()->json([
                "responseDescription" => "all the tickets",
                "meta" => [
                    "content" => $tickets,
                ],
            ], 200);

        } catch (Exception $ex) {
            Log::error("Application . Exception : " . $ex->getMessage());

            return response()->json($ex->getMessage(), 500);
        }

    }

    /**
     * View all tickets
     *
     * @return void
     */
    public function byAgentId($agentId)
    {
        try {
            Log::info('Access View Tickets End Point');

            $tickets = Tickets::where([
                ["agent_id", "=", $agentId],
            ])->get();

            return response()->json([
                "responseDescription" => "all the tickets",
                "meta" => [
                    "content" => $tickets,
                ],
            ], 200);

        } catch (Exception $ex) {
            Log::error("Application . Exception : " . $ex->getMessage());

            return response()->json($ex->getMessage(), 500);
        }

    }

}
