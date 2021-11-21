var express = require("express");
var app = express();

app.get('/getData' , function(req,res){
    res.status(200).send({
        success: "true",
        name:"Snehil jha",
        response:"Working"
    })
});

const PORT = 5555;
app.listen(PORT , ()=> {
    console.log(`Server running on port no ${PORT}`)
});