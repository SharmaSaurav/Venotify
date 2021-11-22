const express = require('express')  // Because we need express
const app = express()   //Instantiate express and call the object "app"
const mongoose = require('mongoose')    //Because we need mongoose for the database

const DB = "mongodb+srv://venotify:venotify123@cluster0.bxgwe.mongodb.net/venotifyDB?retryWrites=true&w=majority"   //Database link + authentication

mongoose.connect(DB, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => {
    console.log('connection successful');
  }).catch((err)=>console.log('Connection Failed'));

app.listen(5000,() => {
    console.log('server is running on port 5000');
})