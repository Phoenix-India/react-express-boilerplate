---
to: src/validations/<%= name %>.validation.js
---
const Joi = require('joi');
const { objectId } = require('./custom.validation');

const createProduct = {
  body: Joi.object().keys({
    // Create Product Body Fields
  }),
};

const getProducts = {
  query: Joi.object().keys({
    sortBy: Joi.string(),
    limit: Joi.number().integer(),
    page: Joi.number().integer(),
  }),
};

const getProduct = {
  params: Joi.object().keys({
    <%= name %>Id: Joi.string().custom(objectId),
  }),
};

const updateProduct = {
  params: Joi.object().keys({
    <%= name %>Id: Joi.required().custom(objectId),
  }),
  body: Joi.object()
    .keys({
      // Update Product Body Fields
    })
    .min(1),
};

const deleteProduct = {
  params: Joi.object().keys({
    <%= name %>Id: Joi.string().custom(objectId),
  }),
};

module.exports = {
  createProduct,
  getProducts,
  getProduct,
  updateProduct,
  deleteProduct,
};
