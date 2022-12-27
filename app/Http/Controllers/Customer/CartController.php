<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Services\Cart\CartService;
use App\Http\Services\Product\ProductService;
use App\Http\Services\Category\CategoryService;
use Validator;

class CartController extends Controller
{
    protected $cartService;
    protected $productService;
    protected $categoryService;
    
    public function __construct(CartService $cartService,
                                ProductService $productService,
                                CategoryService $categoryService){
        $this->cartService = $cartService;
        $this->productService = $productService;
        $this->categoryService = $categoryService;
    }

    public function view(){
        $categories = $this->categoryService->getParent();
        $productBestSolds = $this->cartService->getProductBestSold();
        $carts = $this->cartService->view();
        
        return view('customer.main.cart', compact('carts', 'categories','productBestSolds'));
    }

    public function addCart(Request $request){
        $result = $this->cartService->addCart($request);
        return $result;
    }

    public function removeCart(Request $request){

        $result =  $this->cartService->removeCart($request);
        return $result;
    }

    public function updateCart(Request $request){

        $result =  $this->cartService->updateCart($request);
        return $result;
    }

    public function clearCart(Request $request){
        $result = $this->cartService->clearCart($request);
        return $result;
    }

}
