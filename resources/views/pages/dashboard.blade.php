@extends('layouts.default')

@section('content')
@if(!$user->isParticipating())
<div class="row">
    <div class="col m12 s12">
        <h1 class="black-text">REGISTER ANY EVENT</h1> 
    </div>
</div>
@endif
<div class="row">
    @foreach($events as $event)
        <div class="col m6 s12">
            @include('partials.event', ['event' => $event])
        </div>
    @endforeach
    @foreach($teamEvents as $event)
        <div class="col m6 s12">
            @include('partials.event', ['event' => $event])
        </div>
    @endforeach
</div>
@if($user->rejections()->count())
    <div class="row">
        <div class="col s12">
            <ul class="collection with-header z-depth-4">
                <li class="collection-header">
                    <strong>Your registrations for following events are rejected as maximum participants have already been confirmed</strong>
                </li>
                @foreach($user->rejections as $rejection)
                    <li class="collection-item">{{ $rejection->event->title }}</li>
                @endforeach
            </ul>
        </div>
    </div>
@endif
<div class="row">
    <ul class="stepper">
          
            <li class="step">
                <div class="step-title waves-effect waves-dark">Registeration Form</div>
                <div class="step-content">
                <p>
                         <a class="btn waves-effect waves-light green {{ $user->isParticipating()?'':'disabled' }}" href="{{ route('pages.ticket.download') }}">Download Registration Form</a>
                    </p>
                </div>
            </li>
            
        

@endsection