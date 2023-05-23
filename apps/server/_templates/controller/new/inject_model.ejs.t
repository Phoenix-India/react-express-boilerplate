---
inject: true
to: src/models/index.js
skip_if: <%= Name %>
---
module.exports.<%= Name %> = require('./<%= name %>.model').model;
