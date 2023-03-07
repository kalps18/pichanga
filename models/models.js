const express = require('express');
const cors = require('cors');
const path = require('path');
const hbs = require('express-handlebars');
const session = require('express-session');
const mysqlSession = require('express-mysql-session');
const {database} = require('./database.js');
class Server {

    //constructor
    constructor() {
        this.app = express();
        this.port = process.env.PORT || 8081;


        //configuracion hbs
        this.settinghbs();


        this.usuariosPath = '/api/usuarios';
        this.loginPath = '/account';

        //Middlewares
        this.middlewares();
        //Rutas de mi aplicacion
        this.routes();

    }

    settinghbs() {
        this.app.set('views', path.join(__dirname, '../views'));
        this.app.engine('.hbs', hbs.engine({
            defaultLayout: 'main',
            layoutsDir: path.join(this.app.get('views'), 'layouts'),
            partialsDir: path.join(this.app.get('views'), 'partials'),
            extname: '.hbs'
            //helpers:require('./lin')
        }))
        this.app.set('view engine', '.hbs');
        
    };

    middlewares() {

        //CORS
        this.app.use(cors());

        //Lectura y parseo de body
        this.app.use(express.json());
        this.app.use(express.urlencoded({ extended: false }));

        //Directorio publico
        this.app.use(express.static('public'));
        //sessiones
        this.app.use(session({
            secret:'pichangaapp',
            resave:false,
            saveUninitialized:false,
            store:mysqlSession(database)
        }))
    }

    //rutas
    routes() {
        this.app.use(this.usuariosPath, require('../routes/usuarios'));
        this.app.use(this.loginPath, require('../routes/login'));
    }

    //puerto de escucha
    listem() {
        this.app.listen(this.port, () => {
            console.log('Servidor corriendo en puerto', this.port);
        });
    }



}

module.exports = Server;