<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Item;
use App\ProductCategory;
use App\Order;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;
use Maatwebsite\Excel\Facades\Excel;

class ReportController extends Controller
{
     public function dailySummary()
    {
        Session::put('report_from', Input::has('report_from') ? Input::get('report_from') : (Session::has('report_from') ? Session::get('report_from') : date("Y-m-d")));
        $order['Breakfast'] = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
            ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime(Session::get('report_from'))))
            ->whereBetween(DB::raw("date_format(orders.created_at,'%H:%i')"), ['00:00', '10:59'])
            ->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
            ->groupBy(DB::raw("date(orders.created_at)"))
            ->first();
        $order['Lunch'] = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
            ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime(Session::get('report_from'))))
            ->whereBetween(DB::raw("date_format(orders.created_at,'%H:%i')"), ['11:00', '14:59'])
            ->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
            ->groupBy(DB::raw("date(orders.created_at)"))
            ->first();
        $order['Dinner'] = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
            ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime(Session::get('report_from'))))
            ->whereBetween(DB::raw("date_format(orders.created_at,'%H:%i')"), ['15:00', '23:59'])
            ->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
            ->groupBy(DB::raw("date(orders.created_at)"))
            ->first();
        $order['Total'] = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
            ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime(Session::get('report_from'))))
            ->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
            ->groupBy(DB::raw("date(orders.created_at)"))
            ->first();
        // sale by food type
        foreach (ProductCategory::orderBy('name')->pluck('name', 'id') as $key => $value) {
            $sale[$value] = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
                ->join('products', 'products.id', '=', 'order_details.product_id')
                ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
                ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime(Session::get('report_from'))))
                ->where('products.product_category_id', $key)
                ->where('orders.status', 'Completed')
                ->where('order_details.deleted_at', NULL)
                ->groupBy(DB::raw("date(orders.created_at)"))
                ->first();
        }
        $sale['Open'] = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
            ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime(Session::get('report_from'))))
            ->whereNull('order_details.product_id')
            ->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
            ->groupBy(DB::raw("date(orders.created_at)"))
            ->first();
        return view('report.daily_summary', ['orders' => $order, 'sale' => $sale]);
    }

    public function printDailySummary()
    {
        Session::put('report_from', Input::has('report_from') ? Input::get('report_from') : (Session::has('report_from') ? Session::get('report_from') : date("Y-m-d")));
        $order['Breakfast'] = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
            ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime(Session::get('report_from'))))
            ->whereBetween(DB::raw("date_format(orders.created_at,'%H:%i')"), ['00:00', '10:59'])
            ->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
            ->groupBy(DB::raw("date(orders.created_at)"))
            ->first();
        $order['Lunch'] = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
            ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime(Session::get('report_from'))))
            ->whereBetween(DB::raw("date_format(orders.created_at,'%H:%i')"), ['11:00', '14:59'])
            ->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
            ->groupBy(DB::raw("date(orders.created_at)"))
            ->first();
        $order['Dinner'] = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
            ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime(Session::get('report_from'))))
            ->whereBetween(DB::raw("date_format(orders.created_at,'%H:%i')"), ['15:00', '23:59'])
            ->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
            ->groupBy(DB::raw("date(orders.created_at)"))
            ->first();
        $order['Total'] = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
            ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime(Session::get('report_from'))))
            ->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
            ->groupBy(DB::raw("date(orders.created_at)"))
            ->first();
        // sale by food type
        foreach (ProductCategory::orderBy('name')->pluck('name', 'id') as $key => $value) {
            $sale[$value] = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
                ->join('products', 'products.id', '=', 'order_details.product_id')
                ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
                ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime(Session::get('report_from'))))
                ->where('products.product_type_id', $key)
                ->where('orders.status', 'Completed')
                ->where('order_details.deleted_at', NULL)
                ->groupBy(DB::raw("date(orders.created_at)"))
                ->first();
        }
        $sale['Open'] = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
            ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime(Session::get('report_from'))))
            ->whereNull('order_details.product_id')
            ->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
            ->groupBy(DB::raw("date(orders.created_at)"))
            ->first();
        return view('report.print_daily_summary', ['orders' => $order, 'sale' => $sale]);
    }

    public function saleHistory()
    {
        Session::put('report_from', Input::has('report_from') ? Input::get('report_from') : (Session::has('report_from') ? Session::get('report_from') : date("Y-m-d")));
        Session::put('report_to', Input::has('report_to') ? Input::get('report_to') : (Session::has('report_to') ? Session::get('report_to') : date("Y-m-d")));
        Session::put('report_customer', Input::has('report_customer') ? Input::get('report_customer') : (Session::has('report_customer') ? Session::get('report_customer') : '-1'));
        Session::put('report_user', Input::has('report_user') ? Input::get('report_user') : (Session::has('report_user') ? Session::get('report_user') : '-1'));
        $orders = Order::whereBetween(DB::raw("date(created_at)"), [date('Y-m-d', strtotime(Session::get('report_from'))), date('Y-m-d', strtotime(Session::get('report_to')))]);
        if (Session::get('report_user') != -1)
            $orders = $orders->where('user_id', Session::get('report_user'));
        if (Session::get('report_customer') != -1)
            $orders = $orders->where('customer_id', Session::get('report_customer'));
        $orders = $orders->paginate(20);
        return view('report.sale_history', ['orders' => $orders]);
    }

    public function saleDeletedReport()
    {
        Session::put('report_from', Input::has('report_from') ? Input::get('report_from') : (Session::has('report_from') ? Session::get('report_from') : date("Y-m-d")));
        Session::put('report_to', Input::has('report_to') ? Input::get('report_to') : (Session::has('report_to') ? Session::get('report_to') : date("Y-m-d")));
        Session::put('report_user', Input::has('report_user') ? Input::get('report_user') : (Session::has('report_user') ? Session::get('report_user') : '-1'));
        $orders = Order::join('order_details', 'order_details.order_id', '=', 'orders.id')
            ->select(['order_details.*', 'orders.table_id'])
            ->whereBetween(DB::raw("date(orders.created_at)"), [date('Y-m-d', strtotime(Session::get('report_from'))), date('Y-m-d', strtotime(Session::get('report_to')))]);
        if (Session::get('report_user') != -1)
            $orders = $orders->where('orders.user_id', Session::get('report_user'));
        $orders = $orders->where('deleted_at', '!=', null)->paginate(20);
        return view('report.sale_deleted_report', ['orders' => $orders]);
    }

    public function viewDetail($id)
    {
        return view('report.view_detail', ['order' => Order::find($id)]);
    }

    public function saleDetail()
    {
        Session::put('report_from', Input::has('report_from') ? Input::get('report_from') : (Session::has('report_from') ? Session::get('report_from') : date("Y-m-d")));
        Session::put('report_to', Input::has('report_to') ? Input::get('report_to') : (Session::has('report_to') ? Session::get('report_to') : date("Y-m-d")));
        Session::put('report_category', Input::has('report_category') ? Input::get('report_category') : (Session::has('report_category') ? Session::get('report_category') : '-1'));
        $orderDetails = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->leftJoin('products', 'products.id', '=', 'order_details.product_id')
            ->select(DB::raw("product_id,description,products.product_category_id, products.product_type_id,sum(order_details.quantity) as total,order_details.price,sum(order_details.quantity * order_details.price*orders.discount/100) as discount"))
            ->whereBetween(DB::raw("date(orders.created_at)"), [date('Y-m-d', strtotime(Session::get('report_from'))), date('Y-m-d', strtotime(Session::get('report_to')))]);
        if (Session::get('report_category') != -1)
            $orderDetails = $orderDetails->where('products.product_category_id', Session::get('report_category'));
        $orderDetails = $orderDetails->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
            ->groupBy('order_details.product_id')
            ->groupBy('order_details.description')
            ->groupBy('order_details.price')
            ->orderBy('total', 'desc')
            ->get();
        return view('report.sale_detail', ['orderDetails' => $orderDetails]);
    }

    public function saleGraph()
    {
        Session::put('from', Input::has('from') ? Input::get('from') : (Session::has('from') ? Session::get('from') : date("d-M-Y", strtotime("-7 days"))));
        Session::put('to', Input::has('to') ? Input::get('to') : (Session::has('to') ? Session::get('to') : date("d-M-Y")));
        Session::put('dm', Input::has('dm') ? Input::get('dm') : (Session::has('dm') ? Session::get('dm') : 'Day'));
        $d1 = strtotime(Session::get('from'));
        $d2 = strtotime(Session::get('to'));
        $iv = array();
        $morning = array();
        $afternoon = array();
        $evening = array();
        $daily = array();
        $interval = $d2 - $d1;
        if (Session::get('dm') == 'Day') {
            $count = date('d', $interval);
        } else {
            $d1 = strtotime(date("Y-n", $d1));
            $d2 = strtotime(date("Y-n", $d2));
            $interval = $d2 - $d1;
            $count = date('n', $interval);
        }
        for ($i = 1; $i <= $count; $i++) {
            if (Session::get('dm') == 'Day') {
                $current = gmdate("d-M-Y", strtotime("+$i day", $d1));
                $iv[$i - 1] = intVal(date("d", strtotime($current)));
            } else {
                $current = gmdate("M-Y", strtotime("+$i month", $d1));
                $iv[$i - 1] = date("M", strtotime($current));
            }
            if (Session::get('dm') == 'Day') {
                $m = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
                    ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
                    ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime($current)))
                    ->where('orders.status', 'Completed')
                    ->where('order_details.deleted_at', NULL)
                    ->whereBetween(DB::raw("date_format(orders.created_at,'%H:%i')"), ['00:00', '10:59'])
                    ->first();
                $a = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
                    ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
                    ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime($current)))
                    ->where('orders.status', 'Completed')
                    ->where('order_details.deleted_at', NULL)
                    ->whereBetween(DB::raw("date_format(orders.created_at,'%H:%i')"), ['11:00', '14:59'])
                    ->first();
                $e = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
                    ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
                    ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime($current)))
                    ->where('orders.status', 'Completed')
                    ->where('order_details.deleted_at', NULL)
                    ->whereBetween(DB::raw("date_format(orders.created_at,'%H:%i')"), ['15:00', '23:59'])
                    ->first();
                $d = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
                    ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
                    ->where(DB::raw("date(orders.created_at)"), date('Y-m-d', strtotime($current)))
                    ->where('orders.status', 'Completed')
                    ->where('order_details.deleted_at', NULL)
                    ->first();
            } else {
                $m = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
                    ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
                    ->where(DB::raw("date_format(orders.created_at,'%Y-%m')"), date('Y-m', strtotime($current)))
                    ->where('orders.status', 'Completed')
                    ->where('order_details.deleted_at', NULL)
                    ->whereBetween(DB::raw("date_format(orders.created_at,'%H:%i')"), ['00:00', '10:59'])
                    ->first();
                $a = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
                    ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
                    ->where(DB::raw("date_format(orders.created_at,'%Y-%m')"), date('Y-m', strtotime($current)))
                    ->where('orders.status', 'Completed')
                    ->where('order_details.deleted_at', NULL)
                    ->whereBetween(DB::raw("date_format(orders.created_at,'%H:%i')"), ['11:00', '14:59'])
                    ->first();
                $e = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
                    ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
                    ->where(DB::raw("date_format(orders.created_at,'%Y-%m')"), date('Y-m', strtotime($current)))
                    ->where('orders.status', 'Completed')
                    ->where('order_details.deleted_at', NULL)
                    ->whereBetween(DB::raw("date_format(orders.created_at,'%H:%i')"), ['15:00', '23:59'])
                    ->first();
                $d = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
                    ->select(DB::raw('sum(order_details.quantity * order_details.price * (1-order_details.discount/100) * (1-orders.discount/100)) as total'))
                    ->where(DB::raw("date_format(orders.created_at,'%Y-%m')"), date('Y-m', strtotime($current)))
                    ->where('orders.status', 'Completed')
                    ->where('order_details.deleted_at', NULL)
                    ->first();
            }
            $morning[$i - 1] = floatval($m->total ? $m->total : 0);
            $afternoon[$i - 1] = floatval($a->total ? $a->total : 0);
            $evening[$i - 1] = floatval($e->total ? $e->total : 0);
            $daily[$i - 1] = floatval($d->total ? $d->total : 0);
        }
        return view('report.sale_graph', ['iv' => $iv, 'morning' => $morning, 'afternoon' => $afternoon, 'evening' => $evening, 'daily' => $daily]);
    }

    public function saleStock()
    {
        Session::put('report_from', Input::has('report_from') ? Input::get('report_from') : (Session::has('report_from') ? Session::get('report_from') : date("Y-m-d")));
        Session::put('report_to', Input::has('report_to') ? Input::get('report_to') : (Session::has('report_to') ? Session::get('report_to') : date("Y-m-d")));
        $stock = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->join('products', 'products.id', '=', 'order_details.product_id')
            ->join('recipes', 'recipes.product_id', '=', 'products.id')
            ->join('items', 'items.id', '=', 'recipes.item_id')
            ->select(DB::raw("items.name,items.item_category_id,items.unit,sum(recipes.quantity * order_details.quantity) as total"))
            ->whereBetween(DB::raw("date(orders.created_at)"), [date('Y-m-d', strtotime(Session::get('report_from'))), date('Y-m-d', strtotime(Session::get('report_to')))])
            ->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
            ->groupBy('recipes.item_id')
            ->orderBy('total', 'desc')
            ->get();
        return view('report.sale_stock', ['stock' => $stock]);
    }

    public function saleDiscount()
    {
        Session::put('page', 'report/sale-discount');
        Session::put('report_from', Input::has('report_from') ? Input::get('report_from') : (Session::has('report_from') ? Session::get('report_from') : date("Y-m-d")));
        Session::put('report_to', Input::has('report_to') ? Input::get('report_to') : (Session::has('report_to') ? Session::get('report_to') : date("Y-m-d")));
        Session::put('report_customer', Input::has('report_customer') ? Input::get('report_customer') : (Session::has('report_customer') ? Session::get('report_customer') : '-1'));
        $discount = Order::join('order_details', 'orders.id', '=', 'order_details.order_id');
        if (Session::get('report_customer') == 0)
            $discount = $discount->whereNull('orders.customer_id');
        elseif (Session::get('report_customer') != -1)
            $discount = $discount->where('orders.customer_id', Session::get('report_customer'));
        $discount = $discount->select(DB::raw("orders.customer_id,sum(((order_details.quantity * order_details.price * (1-order_details.discount/100))*orders.discount/100)+(order_details.quantity * order_details.price * order_details.discount/100)) as total"))
            ->whereBetween(DB::raw("date(orders.created_at)"), [date('Y-m-d', strtotime(Session::get('report_from'))), date('Y-m-d', strtotime(Session::get('report_to')))])
            ->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
//            ->where('orders.customer_id', '!=', -1)
            ->groupBy('orders.customer_id')
            ->get();
        return view('report.sale_discount', ['discount' => $discount]);
    }

    public function exportDetailReport()
    {
        Session::put('report_from', Input::has('report_from') ? Input::get('report_from') : (Session::has('report_from') ? Session::get('report_from') : date("Y-m-d")));
        Session::put('report_to', Input::has('report_to') ? Input::get('report_to') : (Session::has('report_to') ? Session::get('report_to') : date("Y-m-d")));
        Session::put('report_category', Input::has('report_category') ? Input::get('report_category') : (Session::has('report_category') ? Session::get('report_category') : '-1'));
        $orderDetails = Order::join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->leftJoin('products', 'products.id', '=', 'order_details.product_id')
            ->select(DB::raw("product_id,description,products.product_category_id, products.product_type_id,sum(order_details.quantity) as total,order_details.price,sum(order_details.quantity * order_details.price*orders.discount/100) as discount"))
            ->whereBetween(DB::raw("date(orders.created_at)"), [date('Y-m-d', strtotime(Session::get('report_from'))), date('Y-m-d', strtotime(Session::get('report_to')))]);
        if (Session::get('report_category') != -1)
            $orderDetails = $orderDetails->where('products.product_category_id', Session::get('report_category'));
        $orderDetails = $orderDetails->where('orders.status', 'Completed')
            ->where('order_details.deleted_at', NULL)
            ->groupBy('order_details.product_id')
            ->groupBy('order_details.description')
            ->groupBy('order_details.price')
            ->orderBy('total', 'desc')
            ->get();
        Excel::create('Sale Detail Report from' . date('d-M-Y', strtotime(Session::get('report_from'))) . ' to ' . date('d-M-Y', strtotime(Session::get('report_from'))), function ($excel) use ($orderDetails) {
            $excel->sheet('Detail Report', function ($sheet) use ($orderDetails) {
                $sheet->appendRow(['Code', 'Description', 'Category', 'Quantity', 'Unitprice', 'Total']);
                foreach ($orderDetails as $orderDetail) {
                    $sheet->appendRow([
                        $orderDetail->product_id,
                        $orderDetail->description,
                        empty($orderDetail->product_category_id) ? '' : ProductCategory::find($orderDetail->product_category_id)->name,
                        $orderDetail->total,
                        $orderDetail->price,
                        $orderDetail->total * $orderDetail->price,
                    ]);
                }
            });
        })->export('xlsx');
    }

    public function stockBalance()
    {
        Session::put('item_search', Input::has('ok') ? Input::get('search') : (Session::has('item_search') ? Session::get('item_search') : ''));
        Session::put('item_category', Input::has('category') ? Input::get('category') : (Session::has('item_category') ? Session::get('item_category') : -1));
        Session::put('item_field', Input::has('field') ? Input::get('field') : (Session::has('item_field') ? Session::get('item_field') : 'name'));
        Session::put('item_sort', Input::has('sort') ? Input::get('sort') : (Session::has('item_sort') ? Session::get('item_sort') : 'asc'));
        $items = new Item();
        if (Session::get('item_category') != -1)
            $items = $items->where('item_category_id', Session::get('item_category'));
        $items = $items->where('name', 'like', '%' . Session::get('item_search') . '%')->orderBy(Session::get('item_field'), Session::get('item_sort'))->paginate(20);
        return view('report.stock_balance', ['items' => $items]);
    }
}
