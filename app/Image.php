<?php

namespace App; 

use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    protected $table = 'images';

    //Relacion One to Many

    public function comments()
    {
    	return $this->hasMany('App\Comment');
    }

    // Relacion One To Many

    public function like()
    {
    	return $this->hasMany('App\Like');
    }

    //Relacion Many To One

    public function user()
    {
    	return $this->belongsTo('App\User', 'user_id');
    }
}
