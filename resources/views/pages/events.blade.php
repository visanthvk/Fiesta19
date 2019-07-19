@extends('layouts.default')

@section('content')
<div class="row">
    @foreach($events as $event)
        <div class="col m6 s12">
            @include('partials.event', ['event' => $event])
        </div>
    @endforeach
</div>
<div class="row">
    <div class="col s12 center-align">
        {{ $events->render() }}
    </div>
</div>
<script>
    $(function(){
        $('.btn-register-event').on('click', function(evt){
            evt.preventDefault();
            var eventId = $(this).attr('data-event');
            var url = "events/" + eventId + "/" + "register";
            var registerLink = $(this);
            $.ajax({
                url: url,
                success: function(res){
                    if(res.error){
                        Materialize.toast(res.message, 8000);                        
                    }
                    else{
                        registerLink.text("Go to Dashboard");                        
                        registerLink.attr('href', "{{ route('pages.dashboard') }}");
                        registerLink.unbind("click");
                        Materialize.toast('Event added to dashboard!,For Altering Events Visit Dashboard', 8000);
                    }
                },
                error: function(){
                    Materialize.toast('Something went wrong!, please try again', 8000);
                }
            });
        });
    });
</script>
@endsection