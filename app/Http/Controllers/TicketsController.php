<?php

namespace App\Http\Controllers;

use App\Ticket;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class TicketsController extends Controller
{
    /**
     * View all tickets
     *
     * @return json
     */
    public function all()
    {
        try {
            Log::info('Access View Tickets End Point');

            $tickets = Ticket::all();

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
     * View all tickets by their log agent
     *
     * @return json
     */
    public function byAgentId($agentId)
    {
        try {
            Log::info('Access View Tickets End Point');

            $tickets = Ticket::where([
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

    /**
     * View all tickets by
     * their log agent and ticket status, Ex: Paid,In_Parking,Out_Parking
     *
     * @return json
     */
    public function byAgentIdAndStatus(Request $request)
    {
        try {

            //getting params
            $agentId = $request->get('agentId');

            //getting params
            $status = $request->get('status');

            Log::info('Access View Tickets by AgentId: ' . $agentId . ' and Status: ' . $status . ' End Point');

            $tickets = Ticket::where([
                ["agent_id", "=", $agentId],
                ["status", "=", $status],
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
