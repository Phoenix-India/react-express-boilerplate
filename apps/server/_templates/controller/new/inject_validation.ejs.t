---
inject: true
to: src/validations/index.js
skip_if: <%= name %>Validation
---
module.exports.<%= name %>Validation = require('./<%= name %>.validation');
