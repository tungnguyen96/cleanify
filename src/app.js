const express = require('express');
const mongoose = require('mongoose');

const app = express();
const port = 3000;

mongoose.connect('mongodb://localhost/test_db', { useNewUrlParser: true });
const Dummy = mongoose.model('Dummy', { title: String, body: String });

app.get('/dummies/create', (req, res) => {
    const dummy = new Dummy({ title: 'first dummy', body: 'oh yeah~~~'});
    dummy.save().then(() => {
        res.send('dummy saved!');
    })
})

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
