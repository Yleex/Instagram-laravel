@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
 
            <div class="card">
                <div class="card-header">Subir nueva imagen</div>
            </div>

            <div class="card-body">
                <form method="POST" enctype="multipart/form-data">
                    @csrf

                    <div class="form-group row">
                        <label for="image_path">Imagen</label>
                        <div class="col-md-6">
                            <input type="" name="">
                        </div>
                    </div>
                </form>
            </div>
            
        </div>
    </div>
</div>

@endsection