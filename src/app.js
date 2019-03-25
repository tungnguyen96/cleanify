const express = require('express');
const mongoose = require('mongoose');

const app = express();

mongoose.connect('mongodb://localhost/test_db', { useNewUrlParser: true });
const Dummy = mongoose.model('Dummy', { title: String, body: String });

app.get('/dummies/create', (req, res) => {
  const dummy = new Dummy({ title: 'first dummy', body: 'oh yeah~~~' });
  dummy.save().then(() => {
    res.send('dummy saved!');
  });
});

module.exports = app;
