module.exports = {
    isAuthenticated(req, res, next) {
        if (req.isAuthenticated())
            return next();
        else 
            return res.redirect('authentication/login');
    },

    isNotAuthenticated(req, res, next) {
        if (!req.isAuthenticated())
            return next();
        return res.redirect('/profile');
    }
}