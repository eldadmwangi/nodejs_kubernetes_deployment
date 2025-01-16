var express = require('express');

var app = express(); // Call express as a function to create an instance

app.get('/', (req, res) => {
    res.send('{ "response": "Hey There! This is Eldad" }');
});

app.get('/will', (req, res) => {
    res.send('{ "response": "Hello World! This is the /will page" }');
});

app.get('/ready', (req, res) => {
    res.send('{ "response": "App is ready to lift" }');
});

// Specify the port the app should listen on
const PORT = 2000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});

