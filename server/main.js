var express = require('express'),
    redis = require('redis'),
    app = express.createServer(),
    io = require('socket.io').listen(app);

app.listen(6080);
app.use(express.static(__dirname + '/public'));
/*app.get('/', function (req, res) {
 console.log("sending file")
 res.sendfile(__dirname + '/public/index.html');
 });*/

io.sockets.on('connection', function (socket) {
    socket.emit('news', { hello:'world' });
    socket.on('my other event', function (data) {
        console.log(data);
    });
});

client = redis.createClient();

client.on("error", function (err) {
    console.log("Error " + err);
});
// Set a value
client.set("string key", "Hello World", redis.print);
// Get the value back
client.get("string key", function (err, reply) {
    console.log(reply.toString());
});
// Clean quit (waits for client to finish)
client.quit();