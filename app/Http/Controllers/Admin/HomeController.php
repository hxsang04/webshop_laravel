<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\User;

class HomeController extends Controller
{
    // protected $orderService;
    // protected $customerService;

    // public function __construct(OrderService $orderService, CustomerService $customerService){
    //     $this->orderService = $orderService;
    //     $this->customerService = $customerService;
    // }

    public function index(){
        $orders =  Order::orderByDesc('id')->limit(10)->get();
        
        $customers =  User::where('level' ,2)->orderByDesc('id')->limit(8)->get();

        $count['order'] =  Order::count();
        $count['customer'] = User::where('level' ,2)->count();

        $earn = array_sum(array_column(Order::where('status', 2)->get()->toArray(), 'total_price'));
        return view('admin.home.index', compact('orders','customers','count','earn'));
    }
}
