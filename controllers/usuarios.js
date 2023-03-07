const { response, request } = require('express');
const {pool} = require('../models/database');

const usuariosGet =(req = request, res = response) => {
    // const { q, nombre = "No name", apikey, page="1", limit = "10" } = req.query;

    // res.json({
    //     msg: 'get API - controller',
    //     q, nombre, apikey, page, limit
    // })
    res.render('usuarios/index')
}

const usuariosPut = (req, res = response) => {

    const id = req.params.id;

    res.status(500).json({
        msg: 'put API - controller',
        id
    })
}

const usuariosPost = (req, res = response) => {

    const { nombre, edad, id } = req.body;


    res.status(201).json({
        msg: 'post API - controller',
        nombre, edad, id
    })
}

const usuariosDelete = (req, res = response) => {
    res.json({
        msg: 'delete API - controller'

    })
}

const usuariosPatch = (req, res = response) => {
    res.json({
        msg: 'delete PATCH - controller'

    })
}

module.exports = {
    usuariosGet,
    usuariosPut,
    usuariosPost,
    usuariosDelete,
    usuariosPatch
}