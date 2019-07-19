@extends('layouts.root')

@section('content')

<div class="slider fullscreen">
    <ul class="slides" style="background: #058aad"> 
        <li>
            <img src="#">
            <div class="caption center-align col-12">
                <h1>Fiesta 19</h1>
                <h3>MEPCO Schlenk Engineering College (Autonomous)</h3>
                <p class="flow-text"><i class="fa fa-calendar"></i> 10 Aug 2019</p>
                <p class="flow-text">For queries contact Dr. T. Prabaharan, Sr. Professor, Mechanical Engineering.</p>
                <p class="flow-text">Mail:queriesfiesta19@gmail.com</p>
                <p class="flow-text white-text">Registration Has been Extendend till 30/01/2019</p>            
            </div>
        </li>
    </ul>
    <div class="row center-align slider-fixed-item">  
        <br><br><br>
        {{ link_to_route('auth.register', 'Register', null, ['class' => 'waves-effect center waves-light btn green']) }}
    </div> 
</div>
    
@endsection