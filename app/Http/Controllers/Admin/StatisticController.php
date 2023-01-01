<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Models\Order;

class StatisticController extends Controller
{
    public function index(){
        $result = DB::table('orders')->whereBetWeen('created_at', [Carbon::now()->startOfMonth(), Carbon::now()->endOfMonth()])
                ->select( DB::raw('CAST(created_at as date) as date'), DB::raw('COUNT(*) as orders'),
                          DB::raw('SUM(total_price) as total_price'))
                ->groupBy(DB::raw('CAST(created_at as date)'))
                ->get();
        $barCharData['date'] = array();
        $barCharData['orders'] = array();
        foreach($result as $val){
            array_push($barCharData['date'], $val->date);
            array_push($barCharData['orders'], $val->orders);
        }

        $orders = DB::table('orders')->select(DB::raw('COUNT(*) as orders'))
                                     ->groupBy('status')
                                     ->get();
        
        $pieChartData = array();
        foreach($orders as $val){
            array_push($pieChartData, $val->orders);
        }

        $dataRevenue = DB::table('orders')->whereBetWeen('created_at', [Carbon::now()->startOfYear(), Carbon::now()->endOfYear()])
                ->select( DB::raw('MONTH(created_at )'), DB::raw('SUM(total_price) as total_price'))
                ->where('status', 2)
                ->groupBy(DB::raw('MONTH(created_at )'))
                ->get();
        return view ('admin.statistic.index', compact('barCharData','pieChartData'));
    }

}
