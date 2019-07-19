<div class="card hoverable">
    <div class="progress hide" id="event-{{ $event->id }}-progress">
        <div class="indeterminate"></div>
    </div>
    <div class="card-image waves-effect waves-light waves-block">
        <img src="{{ url($event->getImageUrl()) }}" alt="{{ $event->title }} image" class="activator">
    </div>
    <div class="card-content">
        <span class="card-title activator">
            {{ $event->title }}
            <i class="material-icons right activator">more_vert</i>            
        </span>
        <div class="event-details">
            <p> {{ $event->description }}</p>
            <p><i class="fa fa-calendar"></i> {{ $event->getDate() }}</p>
            <p><i class="fa fa-clock-o"></i> {{ $event->getStartTime() }} to {{ $event->getEndTime() }}</p>
       
            <p>
                @if(Auth::check() && Auth::user()->type == 'student')
                    @if(Auth::user()->hasRegisteredEvent($event->id))
                        @if($event->isGroupEvent())
                            @if(Auth::user()->isTeamLeader($event->id))
                                @include('partials.team_details', ['team' => Auth::user()->teamLeaderFor($event->id)])
                            @else
                                @include('partials.team_details', ['team' => Auth::user()->teamMemberFor($event->id)])
                            @endif
                            {{-- Check if user has confirmed if so dont show any remove buttons   --}}
                            @if(!Auth::user()->hasConfirmed())
                                @if(Auth::user()->isTeamLeader($event->id))
                                    {{ link_to_route('pages.unregisterteam', 'Remove', ['event_id' => $event->id, 'id' => Auth::user()->teamLeaderFor($event->id)->id], ['class' => 'btn red btn-waves-effect waves-light']) }}
                                @endif
                            @endif
                        @else
                            @if(!Auth::user()->hasConfirmed())                        
                                {{ link_to_route('pages.unregister', 'Remove', ['event_id' => $event->id], ['class' => 'btn red btn-waves-effect waves-light']) }} 
                            @endif
                        @endif 
                    @endif
                @endif
            </p>
        </div>
        @if(Auth::check() && Auth::user()->type == 'admin')
            <a href="{{ route('admin::events.edit', ['id' => $event->id]) }}" class="btn blue waves-effect waves-light">Edit</a>
            {!! Form::open(['url' => route('admin::events.destroy', ['id' => $event->id]), 'method' => 'delete', 'style' => 'display:inline']) !!}
                {!! Form::submit('Delete', ['class' => 'btn red waves-effect waves-light btn-delete-event']) !!}
            {!! Form::close() !!}
            @if($event->hasPrizes())
                <a href="#" class="btn waves-light dropdown-button waves-effect green" data-activates="prize-dropdown-{{ $event->id }}">Prizes</a>
                <ul id="prize-dropdown-{{ $event->id }}" class="dropdown-content">
                    <li>
                        <a href="{{ route('admin::events.prizes.edit', ['event_id' => $event->id]) }}">Edit Prizes</a>
                    </li>
                    <li>
                        <a href="{{ route('admin::events.prizes.show', ['event_id' => $event->id]) }}">View Prizes</a>
                    </li>
                </ul>
            @else
                <a href="{{ route('admin::events.prizes.create', ['event_id' => $event->id]) }}" class="btn green waves-effect waves-light">Add Prizes</a>
            @endif
        @endif
    </div>
    <div class="card-reveal">   
        <span class="card-title">
            <i class="material-icons right">close</i>                    
            {{ $event->title }} Rules
        </span>
        <ul class="browser-default">
            @foreach($event->getRulesList() as $rule)
                <li>{!! $rule !!}</li>
            @endforeach  
        </ul>      
        @if(Auth::check())
            @if(Auth::user()->type == 'student')
                {{-- Check if user has confirmed if so dont show any register buttons   --}}            
                @if(!Auth::user()->hasRegisteredEvent($event->id) && !Auth::user()->hasConfirmed())
                    @if(!$event->isGroupEvent())
                        {{ link_to('#', 'Register', ['class' => 'btn waves-effect waves-light green btn-register-event', 'data-event' => $event->id]) }}
                    @else
                        {{ link_to_route('pages.registerteam', 'Register Team', ['event_id' => $event->id], ['class' => 'btn waves-effect waves-light green btn-registerteam-event', 'data-event' => $event->id]) }}
                    @endif
                @endif
            @endif
        @else
            {{ link_to_route('auth.login', 'Login to Register', null,  ['class' => 'btn waves-effect waves-light red']) }}
        @endif
    </div>
</div>
