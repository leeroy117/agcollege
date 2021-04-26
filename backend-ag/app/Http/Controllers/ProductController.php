<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;


class ProductController extends Controller
{
    //
    public function index()
    {

        try {
            $data = DB::select("call SP_GetProducts()");

            if ($data == null) {
                return response()->json([
                    'status' => 'true',
                    'message' => 'No hay datos para mostrar.',
                    'productos' => null
                ]);
            }

            return response()->json([
                'status' => 'true',
                'message' => 'Lista de productos cargada correctamente.',
                'productos' => $data
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'false',
                'message' => 'Ha ocurrido un error.',
                'productos' => null
            ]);
        }
    }

    public function store()
    {
    }
}
