<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Fiesta19</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        {{ HTML::Style("css/materialize.min.css") }}
        {{ HTML::Style("css/font-awesome.min.css") }}  
        {{ HTML::Style("css/app.css") }}            
        {{ HTML::Style("css/materialize-stepper.min.css") }}                                                     
        {{ HTML::Style("css/material-icons.css") }}                                                    
        {{ HTML::Script("js/jquery.min.js") }}        
        {{ HTML::Script("js/materialize.min.js") }} 
        {{ HTML::Script("js/materialize-stepper.min.js") }} 
        {{ HTML::Script("js/particles.min.js") }}         
        {{ HTML::Script("js/app.js") }}      
        {{ HTML::Script("js/rollno.js") }}    
		<style>
		
body{font-family: 'Raleway', sans-serif;
}

</style> 
        @if(env('APP_ENV', 'local') == 'production')
            <script>
                (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
                ga('create', 'UA-90758540-3', 'auto');
                ga('send', 'pageview');
            </script>
        @endif 
    </head>
    <body>
        @include('layouts.partials.default_nav')    
        <div class="container">
            <div class="row">
                <div class="col s12">
                    @include('layouts.partials.flash')
                </div>
            </div>
            @yield('content')
        </div>
        <div class="footer">    
            <span class="white-text">
                &copy; MEPCO 2019
            </span>
            <span class="white-text right">
            For queries Mail:queriesfiesta19@gmail.com
            </span> 
        </div>
    </body>
    <script>
        $('.stepper').activateStepper();
    </script>
</html>