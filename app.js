const express = require('express')  // Because we need express
const app = express()   //Instantiate express and call the object "app"
const mongoose = require('mongoose')    //Because we need mongoose for the database
const bodyParser = require('body-parser');
const SignUp = require('./models/signUp')
const Login = require('./models/login')
app.use(bodyParser.json());

const DB = "mongodb+srv://Dhruv:Dhruv123@cluster0.bxgwe.mongodb.net/Venotify?retryWrites=true&w=majority"   //Database link + authentication

mongoose.connect(DB, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => { //This function connects to the database
    console.log('connection successful');
  }).catch((err)=>console.log(err));

app.post('/SignUp', async(req,res) => {
  const signUpAs = req.body["SignUpAs"];
  const name = req.body["Name"];
  const sid = req.body["Sid"];
  const phoneNumber = req.body["PhoneNumber"];
  const email = req.body["Email"];
  const branch = req.body["Branch"];
  const password = req.body["Password"];

  console.log(sid);

  const records = await SignUp.findOne({Sid:sid});
  console.log(records)
  if(records == null || records.length == 0){
    const newEntry = {SignUpAs:signUpAs, Name:name, Sid:sid, PhoneNumber:phoneNumber, Email:email, Branch:branch, Password:password};
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

app.post('/Login', async(req,res) => {
  const name = req.body["Name"];
  const password = req.body["Password"];

  const records = await Login.findOne({Name : name})
  console.log(records)
  if(records == null || records.length == 0){
    // const newEntry = {Username: userName, Password: password}
    // const response = await login.create(newEntry)
    // console.log(response)
    res.json({
      message: 'No ID exists. Please signup.'
    })
  }

  else{
    res.status(200).json({
      message: 'Logged in'
    })
  }
 
})




app.listen(5000,() => { //This function activates the server
    console.log('server is running on port 5000');
})