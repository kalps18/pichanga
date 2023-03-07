const { response, request } = require('express');
const {pool} = require('../models/database');

const LoginView = (req = request, res=response)=>{
    res.render('login');
}
const getNamesUsers = async (req = request, res=response)=>{
    const users = await pool.query('SELECT * FROM tbusuarios WHERE idusuario=?',1);
    console.log(users);
    res.render('login');
}

//Logging in Function

const loginUser = (req = request, res=response) => {
    const { usuario, clave } = req.body;
  console.log(usuario,clave);
    //Required
    if (!0 || !clave) {
      console.log("Please fill in all the fields");
      res.render("login", {
        usuario,
        clave,
      });
    } else {
      passport.authenticate("local", {
        successRedirect: "/dashboard",
        failureRedirect: "/login",
        failureFlash: true,
      })(req, res);
    }
  };

module.exports = {
    LoginView,
    loginUser
}