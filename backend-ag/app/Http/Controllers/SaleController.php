<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;


class SaleController extends Controller
{
    //
    public function index()
    {

        try {
            $data = DB::select("call SP_GetSales()");

            if ($data == null) {
                return response()->json([
                    'status' => 'true',
                    'message' => 'No hay datos para mostrar.',
                    'ventas' => null
                ]);
            }

            return response()->json([
                'status' => 'true',
                'message' => 'Lista de ventas cargada correctamente.',
                'ventas' => $data
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'true',
                'message' => 'Ha ocurrido un error.',
                'ventas' => null
            ]);
        }
    }

    public function store(Request $request)
    {
        try {
            // Obtiene de la solicitud el id del cliente 
            $id_customer = $request->venta['id_cliente'];
            // 
            $detailSale = $request->detalle_venta;
            // Se registra una venta y se optiene el id de la ultima venta.
            $lastSale = DB::select('call SP_InsertSale(?)', array($id_customer));
            // Comprueba que la ultima venta no este vacia 
            if ($lastSale !== null) {
                // Se recorre el arreglo detalle de venta 
                foreach ($detailSale as $product) {
                    // Se obtiene el precio de cada producto 
                    $productPrice = DB::select(
                        'call SP_GetProductPrice(?)',
                        array($product['productos_id_producto'])
                    );
                    /*
                    Se insertan los productos en detalle de venta y el subtotal es calculado
                    en MySql
                    */
                    DB::select(
                        'call SP_InsertDetailSale(?,?,?,?)',
                        array(
                            $lastSale[0]->id_venta,
                            $product['productos_id_producto'],
                            $product['cantidad'],
                            $productPrice[0]->precio
                        )
                    );
                }
                return response()->json([
                    'status' => true,
                    'message' => 'Se ha realizado la venta correctamente.'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'message' => 'Ha ocurrido un error.' . $e,
            ]);
        }
    }
}
