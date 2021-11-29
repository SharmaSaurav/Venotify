const express = require('express')  // Because we need express
const app = express()   //Instantiate express and call the object "app"
const mongoose = require('mongoose')    //Because we need mongoose for the database
const bodyParser = require('body-parser');
const SignUp = require('./models/signUp')
const Login = require('./models/login')
const Announcement = require('./models/announcement')
app.use(bodyParser.json());

const DB = "mongodb+srv://Dhruv:Dhruv123@cluster0.bxgwe.mongodb.net/Venotify?retryWrites=true&w=majority"   //Database link + authentication

mongoose.connect(DB, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => { //This function connects to the database
    console.log('connection successful');
  }).catch((err)=>console.log(err));


// ROUTE FOR SIGN UP PAGE
app.post('/SignUp', async(req,res) => {
  const signUpAs = req.body["SignUpAs"];
  const name = req.body["Name"];
  const sid = req.body["Sid"];
  const phoneNumber = req.body["PhoneNumber"];
  const email = req.body["Email"];
  const branch = req.body["Branch"];
  const password = req.body["Password"];

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


//ROUTE FOR LOGIN PAGE
app.post('/Login', async(req,res) => {
  const email = req.body["Email"];
  const password = req.body["Password"];

  const records = await SignUp.findOne({Email : email})
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



//ROUTE FOR CREATE ANNOUNCEMENT PAGE
app.post('/Announcement', async(req,res) => {
  const title =req.body["Title"]
  const organiser = req.body["Organiser"];
  const time = req.body["Time"];
  const date = req.body["Date_"];
  const place = req.body["Place"];
  const desciption = req.body["Description"];

  const newEntry = {
    Title : title,
    Organiser : organiser,
    Time : time,
    Date_ : date,
    Place : place,
    Description : desciption
  };
  const response = await Announcement.create(newEntry)
  console.log(response)
  res.json({
    message: 'Announcment Created'
  })
})

//ROUTE FOR HOME PAGE
app.get('/HomePage', async(req,res)=>{
  const records = await Announcement.find()
  console.log(records);
  res.json(records)
  //res.send('welcome')
})


//DATE FILTER 
app.post('/HomePage/Date', async(req,res)=>{
  const date = req.body["Date_"]
  const records = await Announcement.find({Date_ : date})
  if(records == null || records.length == 0 ){
    res.json({
      message : "No Events Found"
    })
  }else {
    res.json(records)
  }
})



app.listen(5000,() => { //This function activates the server
    console.log('server is running on port 5000');
})


/*
{
  "Organiser" : "ACMCSS",
  "Time" : "9:00 pm",
  "date" : "24-11-21",
  "Place" : "Cisco Webex",
  "Description" : "Ideathon!!!"
}

*/

/*{
  "SignUpAs" : "Organiser",
  "Name" : "Dhruv",
  "Sid" : "291387",
  "PhoneNumber" : "81937413",
  "Email" : "efjisk@iwuk.com",
  "Branch" : "uiahb",
  "Password" : "aeiud"
}
*/