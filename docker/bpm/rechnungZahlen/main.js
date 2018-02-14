// import Libraries
var http = require("http");
var util = require ('util');
var url = require('url');
var qs = require('querystring');

http.createServer( function ( request, response ) 
{
	if ( request.method == 'POST' ) 
	{
		  console.log( "Nr: " + request.data );
		
          var body = '';
          request.on( 'data', function (data) 
          {
              body +=data;
          });
          request.on('end',function()
          {
              var POST =  qs.parse( body );
              console.log( POST );
          });
    }          
          
	if ( request.method == 'GET' ) 
	{
        var url_parts = url.parse( request.url, true );
        console.log( url_parts.query );
	}
	
   // Send the HTTP header: HTTP Status: 200 : OK
   response.writeHead( 200, { 'Content-Type': 'text/plain' } );
   response.end( 'true\n' );
   
}).listen(8090);

// Console will print the message
console.log('Server running at http://127.0.0.1:8090/');
