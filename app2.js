const express = require('express')               // Because we need express
const app = express()                           //Instantiate express and call the object "app"
const mongoose = require('mongoose')             //Because we need mongoose for the database
const bodyParser = require('body-parser')
const login = require('./models/login')
const SignUp = require('./models/signup')
app.use(bodyParser.json());

// const DB = "mongodb+srv://venotify:venotify123@cluster0.bxgwe.mongodb.net/venotifyDB?retryWrites=true&w=majority"   //Database link + authentication

// mongoose.connect(DB, { useNewUrlParser: true, useUnifiedTopology: true }).then(() => { //This function connects to the database
//     console.log('connection successful');
//   }).catch((err)=>console.log('Connection Failed'));
mongoose.connect('mongodb://localhost/mongo')

app.post('/login', async(req,res) => {
  const Name = req.body["Name"];
  const password = req.body["password"];

  console.log(Name);
  console.log(password);

  const records = await login.findOne({Name : Name, password : password})
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

app.post('/SignUp', async(req,res) => {
    const signUpAs = req.body["signUpAs"]
    const Name = req.body["Name"];
    const sid = req.body["sid"];
    const email = req.body["email"]
    const branch = req.body["branch"]
    const phoneNumber = req.body["phoneNumber"]
    const password = req.body["password"]

    console.log(Name);
    console.log(sid);
  
    const records = await SignUp.findOne({Name : Name, sid : sid})
    console.log(records)
    if(records == null || records.length == 0){
      const newEntry = {
          signUpAs: signUpAs,
          Name: Name,
          sid:sid,
          email : email,
          branch: branch,
          phoneNumber : phoneNumber,
          password:password
        }
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


/*
{
    "signUpAS" = "student"
    "Name" = "Ansh Ohri"
    "sid "= "20104026"
    "email" = "uiesa@uadhb.com"
    "branch" =  "EE"
    "phoneNumber" = "0987133"
    "password "= "daihkf"
}
*/