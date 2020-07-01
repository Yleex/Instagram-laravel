<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;

class userController extends Controller
{
	public function config(){
		return view ('user.config');
	}    

	public function update(Request $request){
		//Conseguir usuario identificado
		$user = \Auth::user()->id;

		$id = $user->id;

		//Calidacion del formulario
		$validate = $this->validate($request, [
            'name' => ['required', 'string', 'max:255'],
            'surname' => ['required', 'string', 'max:255'],
            'nick' => ['required', 'string', 'max:255', 'unique:users,nick'.$id],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email'.$id],
        ]);

		//Recoger datos del formulario
		$name = $request->input('name');
		$surname = $request->input('surname');
		$nick = $request->input('nick');
		$email = $request->input('email');

		//Asignar nuevos valores al objeto del usuario
		$user->name = $name;
		$user->surname = $surname;
		$user->nick = $nick;
		$user->email = $email;

		//subir la imagen
		$image_path = $request->file('image_path');
		if ($image_path) {
			//poner nombre unico
			$image_path_name = time().$image_path->getClientOriginalName();

			// Guardar en la carpeta storage (storage/app/users)
			Storage::disk('users')->put($image_path_name, File::get($image_path));

			// Seteo el nombre de la imagen en el objeto
			$user->image = $image_path_name;

		}

		//Ejecutar consulta y cambios en la base de datos 
		$user->update();

		return redirect()->route('config')
						->with(['message'=>'Usuario actualizado correctamente']);

	}
}
