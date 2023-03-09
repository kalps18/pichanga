const passport = require('passport');
const Strategy = require('passport-local').Strategy;

const pool = require('../models/database');
const bcrypt = require('../models/bcrypt');

passport.use(
  'local.signin',
  new Strategy(
    async (req, usuario, clave, done) => {
        console.log(req);
      const rows = await pool.query(
        'SELECT * FROM tbusuarios WHERE usuario = ?',
        [usuario]
      );
      if (rows.length > 0) {
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
      const user = { usuario, fullname: req.body.fullname };
      user.password = await bcrypt.encryptPassword(clave);
      await pool.query('INSERT INTO users SET ?', [user]);
      done(null, user);
    }
  )
);

passport.serializeUser((user, done) => {
  console.log('Serialize: ');
  console.log(user);
  done(null, user.username);
});

passport.deserializeUser(async (id, done) => {
  const user = await pool.query(
    'SELECT * FROM tbusuarios WHERE idusuario = ?',
    [id]
  );
  done(null, user[0]);
});
