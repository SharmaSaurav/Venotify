const express = require('express')  // Because we need express
const app = express()   //Instantiate express and call the object "app"
const mongoose = require('mongoose')    //Because we need mongoose for the database
const bodyParser = require('body-parser');
const SignUp = require('./models/signUp')
app.use(bodyParser.json());

const DB = "mongodb+srv://venotify:venotify123@cluster0.bxgwe.mongodb.net/venotifyDB?retryWrites=true&w=majority"   //Database link + authentication

mongoose.connect(DB, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => { //This function connects to the database
    console.log('connection successful');
  }).catch((err)=>console.log('Connection Failed'));

app.post('/SignUp', async(req,res) => {
  const userName = req.body["UserName"];
  const password = req.body["Password"];

  console.log(userName);
  console.log(password);

  const records = await SignUp.findOne({UserName : userName, Password : password})
  console.log(records)
  if(records == null || records.length == 0){
    const newEntry = {Username: userName, Password: password}
    const response = await SignUp.create(newEntry)
    console.log(response)
    res.json({
      message: 'Created'
    })
  }

  else{
    res.status(403).json({
      message: 'Already There'
    })
  }
 
})

app.listen(5000,() => { //This function activates the server
    console.log('server is running on port 5000');
})