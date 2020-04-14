var http = require('http');

var handleRequest = function(request, response) {
  console.log('Received request from ' + request.connection.remoteAddress + ' for URL: ' + request.url);
  response.writeHead(200);
  response.end('{{HELLO_MSG}}\n');
};
var www = http.createServer(handleRequest);
www.listen(80);
