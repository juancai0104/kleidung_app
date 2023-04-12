const UsersController = require('../controllers/usersController');

module.exports = (app) => {
    //TRAER DATOS
    app.get('/api/users/getAll', UsersController.getAll);

    //GUARDAR DATOS
    app.post('/api/users/create', UsersController.register);

    //AUTENTIFICAR USUARIO
    app.post('/api/users/login', UsersController.login);
}