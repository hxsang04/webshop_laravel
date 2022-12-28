<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Services\Category\CategoryService;
use App\Http\Services\Account\AccountService;
use App\Http\Services\Checkout\CheckoutService;
use App\Models\Order;
use Auth;

class AccountController extends Controller
{
    protected $categoryService;
    protected $accountService;
    protected $checkoutService;

    public function __construct(CategoryService $categoryService, AccountService $accountService,
                                CheckoutService $checkoutService){
        $this->categoryService = $categoryService;
        $this->accountService = $accountService;
        $this->checkoutService = $checkoutService;
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

    public function updateOrderStatus(Request $request){
        $this->accountService->updateOrderStatus($request);
    }
}
