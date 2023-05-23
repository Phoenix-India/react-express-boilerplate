---
to: src/services/<%= name %>.service.js
---
const httpStatus = require('http-status');
const { <%= Name %> } = require('../models');
const ApiError = require('../utils/ApiError');

/**
 * Create a <%= name %>
 * @param {Object} <%= name %>Body
 * @returns {Promise<<%= Name %>>}
 */
const create<%= Name %> = async (<%= name %>Body) => {
  if (await <%= Name %>.isSlugTaken(<%= name %>Body.title)) {
    throw new ApiError(httpStatus.BAD_REQUEST, '<%= Name %> Slug already exists');
  }
  return <%= Name %>.create(<%= name %>Body);
};

/**
 * Query for <%= name %>s
 * @param {Object} filter - Mongo filter
 * @param {Object} options - Query options
 * @param {string} [options.sortBy] - Sort option in the format: sortField:(desc|asc)
 * @param {number} [options.limit] - Maximum number of results per page (default = 10)
 * @param {number} [options.page] - Current page (default = 1)
 * @returns {Promise<QueryResult>}
 */
const query<%= Name %>s = async (filter, options) => {
  const <%= name %>s = await <%= Name %>.paginate(filter, options);
  return <%= name %>s;
};

/**
 * Get <%= name %> by id
 * @param {ObjectId} id
 * @returns {Promise<<%= Name %>>}
 */
const get<%= Name %>ById = async (id) => {
  return <%= Name %>.findById(id);
};

/**
 * Update <%= name %> by id
 * @param {ObjectId} <%= name %>Id
 * @param {Object} updateBody
 * @returns {Promise<<%= Name %>>}
 */
const update<%= Name %>ById = async (<%= name %>Id, updateBody) => {
  const <%= name %> = await get<%= Name %>ById(<%= name %>Id);
  if (!<%= name %>) {
    throw new ApiError(httpStatus.NOT_FOUND, '<%= Name %> not found');
  }
  Object.assign(<%= name %>, updateBody);
  await <%= name %>.save();
  return <%= name %>;
};

/**
 * Delete <%= name %> by id
 * @param {ObjectId} <%= name %>Id
 * @returns {Promise<<%= Name %>>}
 */
const delete<%= Name %>ById = async (<%= name %>Id) => {
  const <%= name %> = await get<%= Name %>ById(<%= name %>Id);
  if (!<%= name %>) {
    throw new ApiError(httpStatus.NOT_FOUND, '<%= Name %> not found');
  }
  await <%= name %>.remove();
  return <%= name %>;
};

module.exports = {
  create<%= Name %>,
  query<%= Name %>s,
  get<%= Name %>ById,
  update<%= Name %>ById,
  delete<%= Name %>ById,
};
