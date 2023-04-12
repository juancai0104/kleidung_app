const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const logger = require('morgan');
const cors = require('cors');

//ROUTES
const users = require('./routes/usersRoutes');
//END ROUTES

const port = process.env.PORT || 3000;

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
app.use(cors());
app.disable('x-powered-by');

app.set('port', port);

//CALL ROUTES
users(app);
//END CALL ROUTES

server.listen(3000, '127.0.0.1' || 'localhost', function()
{
    console.log('NodeJS Application ' + port + ' Iniciada...');
});

/*app.get('/', (req, res) => {
    res.send('root route backend');
});

app.get('/test', (req, res) => {
    res.send('This is the TEST route');
    //res.send(usersController.getAll());
});*/



//ERROR HANDLER
app.use((err, req, res, next) => {
    console.log(err);
    res.status(err.status || 500).send(err.stack);
});

module.exports = {
    app: app,
    server: server
}