<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Services\Category\CategoryService;
use App\Http\Services\Account\AccountService;
use App\Models\Order;
use Auth;

class AccountController extends Controller
{
    protected $categoryService;
    protected $accountService;

    public function __construct(CategoryService $categoryService, AccountService $accountService){
        $this->categoryService = $categoryService;
        $this->accountService = $accountService;
    }
        
    public function index(){
        $categories = $this->categoryService->getParent();
        
        return view('customer.main.profile', compact('categories'));
    }
    public function update(Request $request){
        
        $result = $this->accountService->update($request);
        if($result){
            return back()->with('success','Update profile successfully');
        }
    }

    public function orderHistory(){
        $categories = $this->categoryService->getParent();
        $orders = Order::where('user_id', Auth::id())->orderByDesc('id')->paginate(5);

        return view('customer.main.order', compact('categories','orders'));
    }

    public function updateStatus(Request $request){
        if($request->ajax()){
            $order = Order::find($request->order_id);
            $order->status = $request->status;
            $order->save();

            return true;
        }
    }
}
