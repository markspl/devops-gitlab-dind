error: Unexpected var, use let or const instead (no-var) at imed\server_imed.js:1:1:
> 1 | var amqp = require("amqplib/callback_api");
    | ^
  2 | 
  3 | amqp.connect("amqp://rabbit", function(error0, connection) {
  4 |   if (error0) throw error0;


error: 'message' is never reassigned. Use 'const' instead (prefer-const) at imed\server_imed.js:29:13:
  27 | 
  28 |         // Construct message before sending
> 29 |         let message = "Got " + msg.content.toString();
     |             ^
  30 | 
  31 |         // Send message after after one second wait.
  32 |         setTimeout(function(){


warning: A space is required after ',' (comma-spacing) at imed\server_imed.js:37:8:
  35 | 
  36 |         console.log(" [x] Sent %s!", message);
> 37 |       },{
     |        ^
  38 |         noAck: true
  39 |       });
  40 |     });


error: Unexpected var, use let or const instead (no-var) at obse\server_obse.js:1:1:
> 1 | var amqp = require("amqplib/callback_api");
    | ^
  2 | var fs = require("fs");
  3 | 
  4 | amqp.connect("amqp://rabbit", function(error0, connection) {


error: Unexpected var, use let or const instead (no-var) at obse\server_obse.js:2:1:
  1 | var amqp = require("amqplib/callback_api");
> 2 | var fs = require("fs");
    | ^
  3 | 
  4 | amqp.connect("amqp://rabbit", function(error0, connection) {
  5 |   if (error0) throw error0;


error: Missing semicolon (semi) at obse\server_obse.js:10:39:
   8 |     if (error1) throw error1;
   9 | 
> 10 |     const path = "/output_data/output"
     |                                       ^
  11 | 
  12 |     try{
  13 |       if(fs.existsSync(path)){


error: Missing semicolon (semi) at obse\server_obse.js:14:28:
  12 |     try{
  13 |       if(fs.existsSync(path)){
> 14 |         fs.unlinkSync(path)
     |                            ^
  15 |         fs.writeFile(path, "", function(err){
  16 |           if(err) throw err;
  17 |         });


error: 'now' is never reassigned. Use 'const' instead (prefer-const) at obse\server_obse.js:40:13:
  38 | 
  39 |       channel.consume(q.queue, function(msg){
> 40 |         let now = new Date().toISOString();
     |             ^
  41 | 
  42 |         // Construct the message before writing
  43 |         let text = now + " Topic " + msg.fields.routingKey + " " + msg.content.toString();


error: 'text' is never reassigned. Use 'const' instead (prefer-const) at obse\server_obse.js:43:13:
  41 | 
  42 |         // Construct the message before writing
> 43 |         let text = now + " Topic " + msg.fields.routingKey + " " + msg.content.toString();
     |             ^
  44 |         console.log(text);
  45 | 
  46 |         // WRITE with extra line end


warning: A space is required after ',' (comma-spacing) at obse\server_obse.js:48:8:
  46 |         // WRITE with extra line end
  47 |         fs.appendFileSync(path, text + "\n");
> 48 |       },{
     |        ^
  49 |         noAck: true
  50 |       });
  51 |     });


error: Unexpected var, use let or const instead (no-var) at orig\server_orig.js:1:1:
> 1 | var amqp = require("amqplib/callback_api");
    | ^
  2 | 
  3 | amqp.connect("amqp://rabbit", function(error0, connection) {
  4 |   if (error0) throw error0;


warning: A space is required after ',' (comma-spacing) at orig\server_orig.js:26:6:
  24 |       channel.publish(exchange, topic, Buffer.from(msg));
  25 |       console.log("[x] Sent %s!", msg);
> 26 |     },3000);
     |      ^
  27 | 
  28 |     // Send 3rd message after 6 seconds
  29 |     setTimeout(function() {


warning: A space is required after ',' (comma-spacing) at orig\server_orig.js:33:6:
  31 |       channel.publish(exchange, topic, Buffer.from(msg));
  32 |       console.log("[x] Sent %s!", msg);
> 33 |     },6000);
     |      ^
  34 |   });
  35 | 
  36 |   // Exit process after successful work (10 seconds)


9 errors and 4 warnings found.
9 errors and 4 warnings potentially fixable with the `--fix` option.
