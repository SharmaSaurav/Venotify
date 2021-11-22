const express = require('express')  // Because we need express
const app = express()   //Instantiate express and call the object "app"

app.listen(5000,() => {
    console.log('server is running on port 5000');
})