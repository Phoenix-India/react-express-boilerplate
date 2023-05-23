---
inject: true
to: src/controllers/index.js
skip_if: <%= name %>Controller
---
module.exports.<%= name %>Controller = require('./<%= name %>.controller');
