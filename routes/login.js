const { Router } = require('express');
const router = Router();
const passport = require('passport');
const { LoginView } = require('../controllers/login');
const { isAuthenticated, isNotAuthenticated } = require('../models/protected');


router.get('/login', LoginView)
// router.post('/login', loginUser)
// router.get('/index', );
// router.put('/:id', );
// router.post('/', );
// router.delete('/', );
// router.patch('/', );


// iniciar session
router.get('/signin', (req, res) => {
    res.render('authentication/login');
});

router.post('/signin', (req, res, next) => {
    passport.authenticate('local.signin', {
        successRedirect: 'portal',
        failureRedirect: 'signin',
        failureFlash: true
    })(req, res, next);
});

// Crear usuario
router.get('/signup', isNotAuthenticated, (req, res) => {
    res.render('authentication/signup');
});

router.post('/signup', passport.authenticate('local.signup', {
    successRedirect: 'home/index',
    failureRedirect: 'signin',
    failureFlash: true
}));

// Profile
router.get('/portal', isAuthenticated, (req, res) => {
    res.render('home/index');
});

// Log Out
router.get('/logout', isAuthenticated, (req, res) => {
    req.logOut();
    res.redirect('signin');
})


module.exports = router;