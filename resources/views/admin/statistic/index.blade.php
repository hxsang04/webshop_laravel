@extends('admin.layout.master')

@section('title', 'Statistic')

@section('body')
    <div class="details">
        <div class="recentOrders">
            <div class="cardHeader">
                <h2>Revenue</h2>
            </div>
            <div>
                <canvas class="myChart"></canvas>
            </div>
        </div>
        <div class="recentCustomers">
            <div class="cardHeader">
                <h2>Total Order</h2>
            </div>
            <div>
                <canvas class="myChart2"></canvas>
            </div>
        </div>
    </div>
@endsection