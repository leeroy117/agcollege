<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;


class CustomerController extends Controller
{
    //
    public function index()
    {
        try {
            $data = DB::select("call SP_GetCustomers()");

            if ($data == null) {
                return response()->json([
                    'status' => 'true',
                    'message' => 'No hay datos para mostrar.',
                    'clientes' => null
                ]);
            }

            return response()->json([
                'status' => 'true',
                'message' => 'Lista de clientes cargada correctamente.',
                'clientes' => $data
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'false',
                'message' => 'Ha ocurrido un error.',
                'clientes' => null
            ]);
        }
    }

    public function store()
    {
    }
}
