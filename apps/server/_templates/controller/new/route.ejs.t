---
to: src/routes/v1/<%= name %>.route.js
---
const express = require('express');
const auth = require('../../middlewares/auth');
const validate = require('../../middlewares/validate');
const <%= name %>Validation = require('../../validations/<%= name %>.validation');
const <%= name %>Controller = require('../../controllers/<%= name %>.controller');

const router = express.Router();

router
  .route('/')
  .get(auth('get<%= Name %>'), validate(<%= name %>Validation.get<%= Name %>s), <%= name %>Controller.get<%= Name %>s)
  .post(auth('create<%= Name %>'), validate(<%= name %>Validation.create<%= Name %>), <%= name %>Controller.create<%= Name %>);

router
  .route('/:<%= name %>Id')
  .get(auth('get<%= Name %>'), validate(<%= name %>Validation.get<%= Name %>), <%= name %>Controller.get<%= Name %>)
  .patch(auth('update<%= Name %>'), validate(<%= name %>Validation.update<%= Name %>), <%= name %>Controller.update<%= Name %>)
  .delete(auth('delete<%= Name %>'), validate(<%= name %>Validation.delete<%= Name %>), <%= name %>Controller.delete<%= Name %>);

module.exports = router;
