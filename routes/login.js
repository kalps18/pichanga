const { Router } = require('express');

const { LoginView,loginUser } = require('../controllers/login');

const router = Router();

router.get('/login', LoginView)
router.post('/login', loginUser)
// router.get('/index', );
// router.put('/:id', );
// router.post('/', );
// router.delete('/', );
// router.patch('/', );


module.exports = router;