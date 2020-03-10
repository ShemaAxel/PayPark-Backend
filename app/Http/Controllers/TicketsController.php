<?php

namespace App\Http\Controllers;

use App\Ticket;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class TicketsController extends Controller
{


    public function payment(Request $request){
        try{
            Log::info('Capturing payment');

            //get ticketId
            $ticketID = $request->ticketID;

            //search ticket
            Log::info('Searching ticket');
            $ticket = Ticket::find($ticketID);

            if($ticket){
                //update with amount
                Log::info('Ticket found');

                $ticket->Amount = $request->amount;
                $ticket->save();

                return response()->json([
                    "responseDescription" => "Payment Captured",
                    "meta" => [
                        "content" => $ticket,
                    ],
                ], 200);
            }else{
                Log::info('Ticket not found');

                return response()->json([
                    "responseDescription" => "Ticket not found",
                    "meta" => [
                        "content" => null,
                    ],
                ], 200);  
            }
        }catch (Exception $ex) {
            Log::error("Application . Exception : " . $ex->getMessage());

            return response()->json($ex->getMessage(), 500);
        }   
    }


    public function remove($ticketID){
        try{

            Log::info('removing car from parking');

            $ticket = Ticket::find($ticketID);

            Log::info('Updating ticket to paid');

            $ticket->status="PAID";
            $ticket->save();

            return response()->json([
                "responseDescription" => "Car Removed, Ticket Updated",
                "meta" => [
                    "content" => $ticket,
                ],
            ], 200);

        }catch (Exception $ex) {
            Log::error("Application . Exception : " . $ex->getMessage());

            return response()->json($ex->getMessage(), 500);
        }
    }



    public function create(Request $request){
        try{

            Log::info('registering a new Ticket');

            //add amount = 0;
            $ticket = new Ticket;
            $ticket->number_plate = $request->plateNumber;
            $ticket->location_id = 1;
            $ticket->agent_id= $request->agent_id;
            $ticket->status = "IN_PARKING";
            $ticket->Amount = 0;
            $ticket->date_time_out = null;
            $ticket->product_id = 1;//
            $ticket->created_At =$ticket->updated_At= date("Y-m-d H:i:s");
            $ticket->save();

            Log::info('Saved and preparing response');

            return response()->json([
                "responseDescription" => "Ticket Created",
                "meta" => [
                    "content" => $ticket,
                ],
            ], 200);

        }catch (Exception $ex) {
            Log::error("Application . Exception : " . $ex->getMessage());

            return response()->json($ex->getMessage(), 500);
        }
    }

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
