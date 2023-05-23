---
inject: true
to: src/services/index.js
skip_if: <%= name %>Service
---
module.exports.<%= name %>Service = require('./<%= name %>.service');
