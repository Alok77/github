<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{config('app.name')}}</title>
    <!-- Styles -->
    <link href="{{ asset('bootstrap-3.3.7/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('bootstrap-3.3.7/css/bootstrap-theme.min.css') }}" rel="stylesheet">
</head>
<body>
<div class="container-fluid" style="background: #eef2f4;border-bottom: 5px solid whitesmoke">
    <img src="{{asset('images/logo.png')}}" height="100px" width="150px"/>
</div>
<div class="container-fluid">
    <div class="row-fluid" style="margin-top: 10px">
        <div class="col-md-6 col-md-offset-3" style="padding-top: 1px;padding-bottom: 50px">
            <h1 class="page-header">Login</h1>
            <div class="row">
                <div class="col-sm-5 hidden-xs" style="text-align: center">
                    <img src="{{asset("images/login.png")}}"/>
                </div>
                <div class="col-sm-7">
                    {!! Form::open(['url'=>'/login']) !!}
                    <div class="form-group{{ $errors->has('username') ? ' has-error' : '' }}">
                        {!! Form::label("username","Username") !!}
                        {!! Form::text("username",null,["class"=>"form-control","placeholder"=>"Username"]) !!}
                        {!! $errors->first('username','<span class="help-block">:message</span>') !!}
                    </div>

                    <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                        {!! Form::label("password","Password") !!}
                        {!! Form::password("password",["class"=>"form-control","placeholder"=>"Password"]) !!}
                        {!! $errors->first('password','<span class="help-block">:message</span>') !!}
                    </div>
                    <input type="hidden" name="active" value="1"/>
                    <div class="form-group">
                        {!! Form::submit("Login",["class"=>"btn btn-primary"]) !!}
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
</div>
<script src="{{ asset('js/jquery-3.1.1.min.js') }}"></script>
<script src="{{ asset('bootstrap-3.3.7/js/bootstrap.min.js') }}"></script>
</body>
</html>