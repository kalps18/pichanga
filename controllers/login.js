const { response, request } = require('express');
const {pool} = require('../models/database');

const LoginView = (req = request, res=response)=>{
    res.render('authentication/login');
}
const getNamesUsers = async (req = request, res=response)=>{
    const users = await pool.query('SELECT * FROM tbusuarios WHERE idusuario=?',1);
    console.log(users);
    res.render('autentication/login');
}

//funcion de logeo


module.exports = {
    LoginView
}