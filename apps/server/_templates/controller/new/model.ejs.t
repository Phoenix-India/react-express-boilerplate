---
to: src/models/<%= name %>.model.js
---
const mongoose = require('mongoose');
const mongooseDelete = require('mongoose-delete');
const { toJSON, paginate } = require('./plugins');

const <%= name %>Schema = mongoose.Schema(
  {
    // Schema Fields Here
  },
  {
    timestamps: true,
  }
);

// add plugin that converts mongoose to json
<%= name %>Schema.plugin(toJSON);
<%= name %>Schema.plugin(paginate);
<%= name %>Schema.plugin(mongooseDelete, { indexFields: 'all' });

/**
 * @typedef <%= Name %>
 */
const <%= Name %> = mongoose.model('<%= Name %>', <%= name %>Schema);

module.exports = { model: <%= Name %> };
