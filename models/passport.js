const passport = require('passport');
const Strategy = require('passport-local').Strategy;

const {pool} = require('../models/database');
const bcrypt = require('../models/bcrypt');

passport.use(
  'local.signin',
  new Strategy(
    {
      usernameField: 'usuario',
      passwordField: 'clave',
      passReqToCallback: true,
    },
    async (req, usuario, clave, done) => {
      const rows = await pool.query(
        'SELECT * FROM tbusuarios WHERE usuario = ?',
        [usuario]
      );
      if (rows.length > 0) {
        console.log(rows)
        const user = rows[0];
        const validPassword = await bcrypt.comparePasswords(clave, user.clave);
        if (validPassword) done(null, user);
        else done(null, false, req.flash('message', 'Incorrect Password'));
      } else done(null, false, req.flash('message', 'Incorrect Username'));
    }
  )
);

passport.use(
  'local.signup',
  new Strategy(
    {
      usernameField: 'usuario',
      passwordField: 'clave',
      passReqToCallback: true,
    },
    async (req, usuario, clave, done) => {

      try{
          const user = { usuario: req.body.usuario, apepaterno: req.body.apepaterno, apematerno: req.body.apematerno, nombres: req.body.nombres, telefono: req.body.telefono, correo: req.body.correo, fechacreacion:new Date(), estado: req.body.estado ='on'? true:false };
          user.clave = await bcrypt.encryptPassword(clave);
          await pool.query('INSERT INTO tbusuarios SET ?', [user]);
          done(null, user);
      }
      catch (err){
        console.log(err)
      }
    }
  )
);

passport.serializeUser((user, done) => {
  console.log('Serialize: ');
  console.log(user);
  done(null, user.usuario);
});

passport.deserializeUser(async (idusuario, done) => {
  const user = await pool.query(
    'SELECT * FROM tbusuarios WHERE idusuario = ?',
    [idusuario]
  );
  console.log(user);
  done(null, user);
});
