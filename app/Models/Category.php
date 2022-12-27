<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class category extends Model
{
    use HasFactory;

    protected $fillable =[
        'categoryname',
        'parent_id',
        'description',
        'slug',
        'active'
    ];

    /**
     * Get all of the comments for the Category
     *
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function product()
    {
        return $this->hasMany(Product::class, 'category_id', 'id');
    }

    public function childs(){
        return $this->hasMany(Category::class, 'parent_id', 'id');
    }
}
