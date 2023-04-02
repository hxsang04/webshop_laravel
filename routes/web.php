<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\LoginController;
use App\Http\Controllers\Admin\HomeController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\BrandController;
use App\Http\Controllers\Admin\ProfileController;
use App\Http\Controllers\Admin\ProductDetailController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\CustomerController;
use App\Http\Controllers\Admin\StatisticController;

// Customer UI

Route::get('', [App\Http\Controllers\Customer\MainController::class, 'index']);
Route::get('/aboutus', [App\Http\Controllers\Customer\MainController::class, 'aboutUs']);
Route::get('/contact', [App\Http\Controllers\Customer\MainController::class, 'contact']);
Route::get('/shop', [App\Http\Controllers\Customer\ShopController::class, 'index']);
// Get ProudctDetail
Route::get('/{slug}.html', [App\Http\Controllers\Customer\ShopController::class, 'showProductDetail']);
// Route::get('{categroy_parent}', [ShopController::class, 'showProductByCategory']);
Route::get('/{categroy_slug}.htm', [App\Http\Controllers\Customer\ShopController::class, 'showProductByCategory']);
// Get Product Size
Route::post('/get-size' , [App\Http\Controllers\Customer\ShopController::class, 'getSize']);
Route::post('/buy-now' , [App\Http\Controllers\Customer\ShopController::class, 'buyNow']);

// Cart
Route::get('/cart', [App\Http\Controllers\Customer\CartController::class, 'view']);
Route::post('/add-to-cart', [App\Http\Controllers\Customer\CartController::class, 'addCart']);
Route::post('/remove-cart', [App\Http\Controllers\Customer\CartController::class, 'removeCart']);
Route::post('/update-cart', [App\Http\Controllers\Customer\CartController::class, 'updateCart']);
Route::post('/clear-cart', [App\Http\Controllers\Customer\CartController::class, 'clearCart']);
//Wishlist
Route::get('/wishlist', [App\Http\Controllers\Customer\WishListController::class, 'index']);
Route::post('/add-to-wishlist', [App\Http\Controllers\Customer\WishListController::class, 'addWishList']);
Route::post('/remove-wishlist', [App\Http\Controllers\Customer\WishListController::class, 'removeWishList']);
// CheckOut
Route::prefix('checkout')->group( function(){
    Route::get('', [App\Http\Controllers\Customer\CheckoutController::class, 'index']);
    Route::post('', [App\Http\Controllers\Customer\CheckoutController::class, 'addOrder']);
    Route::get('/vnPayCheck', [App\Http\Controllers\Customer\CheckoutController::class, 'vnPayCheck']);
    Route::get('/noti', [App\Http\Controllers\Customer\CheckoutController::class, 'noti']);

});
// My Account
Route::get('/my-account/profile', [App\Http\Controllers\Customer\AccountController::class, 'index']);
Route::post('/my-account/profile', [App\Http\Controllers\Customer\AccountController::class, 'update']);
Route::get('/my-account/order', [App\Http\Controllers\Customer\AccountController::class, 'orderHistory']);
Route::get('/my-account/order/{id}', [App\Http\Controllers\Customer\AccountController::class, 'orderDetail']);
Route::post('/my-account/order/updateOrderStatus', [App\Http\Controllers\Customer\AccountController::class, 'updateOrderStatus']);

    
// Paypal
Route::get('/create-transaction', [App\Http\Controllers\Customer\PaypalController::class, 'createTransaction']);
Route::get('/process-transaction', [App\Http\Controllers\Customer\PaypalController::class, 'processTransaction']);
Route::get('/success-transaction/{order_id}', [App\Http\Controllers\Customer\PaypalController::class, 'successTransaction']);
Route::get('/cancel-transaction/{order_id}', [App\Http\Controllers\Customer\PaypalController::class, 'cancelTransaction']);

// Login
Route::get('login', [App\Http\Controllers\Customer\LoginController::class, 'login']);
Route::post('login', [App\Http\Controllers\Customer\LoginController::class, 'checkLogin']);
Route::get('register', [App\Http\Controllers\Customer\LoginController::class, 'register']);
Route::post('register', [App\Http\Controllers\Customer\LoginController::class, 'checkRegister']);
Route::post('logout', [App\Http\Controllers\Customer\LoginController::class, 'logout']);
// Reset Password
Route::get('/forgot-password', [App\Http\Controllers\Customer\ResetPasswordController::class, 'forgotPassword']);
Route::post('/forgot-password', [App\Http\Controllers\Customer\ResetPasswordController::class, 'forgotPasswordPost']);
Route::get('/reset-password/{token}', [App\Http\Controllers\Customer\ResetPasswordController::class, 'resetPassword']);
Route::post('/reset-password/{token}', [App\Http\Controllers\Customer\ResetPasswordController::class, 'resetPasswordPost']);





//Admin Page

Route::prefix('admin')->group(function () {
    Route::get('login', [LoginController::class, 'index'])->name('login');
    Route::post('login', [LoginController::class, 'store']);
    Route::post('logout', [LoginController::class, 'logout']) ->name('logout');
});

Route::group(['prefix'=> 'admin', 'middleware'=>'auth' ] , function () {
    
    // Home
    Route::get('home', [HomeController::class, 'index'])->name('home');

    // Product
    Route::prefix('product')->group(function () {
        Route::get('', [ProductController::class, 'index']); 
        Route::get('create', [ProductController::class, 'create']); 
        Route::post('store', [ProductController::class, 'store']);
        Route::get('edit/{product}', [ProductController::class, 'edit']); 
        Route::post('edit/{product}', [ProductController::class, 'update']); 
        Route::get('{product}', [ProductController::class, 'show']); 
        Route::delete('delete/{product}', [ProductController::class, 'destroy']); 
        // Product detail
        Route::get('{product}/detail', [ProductDetailController::class, 'index']); 
        Route::get('{product}/detail/create', [ProductDetailController::class, 'create']); 
        Route::post('{product}/detail/create/store', [ProductDetailController::class, 'store']); 
        Route::get('{product}/detail/edit/{productDetail}', [ProductDetailController::class, 'edit']); 
        Route::post('{product}/detail/edit/{productDetail}', [ProductDetailController::class, 'update']); 
        Route::delete('{product}/detail/delete/{productDetail}', [ProductDetailController::class, 'destroy']); 

    });

    // User
    Route::middleware(['adminRole'])->group(function () {
        Route::get('user', [UserController::class, 'index']);
        Route::get('user/create', [UserController::class, 'create']);
        Route::post('user/store', [UserController::class, 'store']);
        Route::get('user/{id}', [UserController::class, 'show']);
        Route::delete('user/delete/{id}', [UserController::class, 'destroy']);
    // Brand
        Route::prefix('brand')->group(function () {
            Route::get('', [BrandController::class, 'index']);
            Route::get('create', [BrandController::class, 'create']); 
            Route::post('store', [BrandController::class, 'store']);
            Route::get('edit/{brand}', [BrandController::class, 'show']); 
            Route::post('edit/{brand}', [BrandController::class, 'update']); 
            Route::delete('delete/{id}', [BrandController::class, 'destroy']);
        });
    // Category
        Route::prefix('category')->group(function () {
            Route::get('', [CategoryController::class, 'index']); 
            Route::get('create', [CategoryController::class, 'create']); 
            Route::post('store', [CategoryController::class, 'store']); 
            Route::get('edit/{category}', [CategoryController::class, 'show']); 
            Route::post('edit/{category}', [CategoryController::class, 'update']); 
            Route::delete('delete/{id}', [CategoryController::class, 'destroy']); 
        });
    //Statistic
        Route::get('/statistic', [StatisticController::class, 'index']);
        Route::post('/statistic', [StatisticController::class, 'show']);
    });

    // Order    
    Route::prefix('order')->group(function () {
        Route::get('', [OrderController::class, 'index']);
        Route::get('{id}', [OrderController::class, 'show']);
        Route::post('/confirm', [OrderController::class, 'confirmOrder']);
    });

    // Customer    
    Route::prefix('customer')->group(function () {
        Route::get('', [CustomerController::class, 'index']);
        Route::get('{id}', [CustomerController::class, 'show']);
        Route::post('action', [CustomerController::class, 'action']);
    });

    // Profile
    Route::get('profile', [ProfileController::class, 'index']);
    Route::post('profile', [ProfileController::class, 'update']);
    Route::get('password', [ProfileController::class, 'changePassword']);
    Route::post('password', [ProfileController::class, 'changePasswordPost']);

    Route::get('403', function() {
        return view('admin.403');
    });
});

// Route::get('test', function() {
//     Artisan::call('storage:link');
// });
// Route::get('/customer-action', [CustomerController::class, 'action']);
