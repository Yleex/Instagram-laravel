@if (Auth::user()->image)
	<div class="container-avatar">
		<img src="{{ url('/user/avatar/'.Auth::user()->image) }}" class="avatar" >
	</div>
@endif