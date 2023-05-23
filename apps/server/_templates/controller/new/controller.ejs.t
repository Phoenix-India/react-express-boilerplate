---
to: src/controllers/<%= name %>.controller.js
---
const httpStatus = require('http-status');
const pick = require('../utils/pick');
const ApiError = require('../utils/ApiError');
const catchAsync = require('../utils/catchAsync');
const { <%= name %>Service } = require('../services');

const create<%= Name %> = catchAsync(async (req, res) => {
  const <%= name %> = await <%= name %>Service.create<%= Name %>(req.body);
  res.status(httpStatus.CREATED).send({ status: true, <%= name %> });
});

const get<%= Name %>s = catchAsync(async (req, res) => {
  const filter = pick(req.query, [
    /* <%= name %> query filter fields */
  ]);
  const options = pick(req.query, ['sortBy', 'limit', 'page']);
  const result = await <%= name %>Service.query<%= Name %>s(filter, options);
  res.send({ status: true, ...result });
});

const get<%= Name %> = catchAsync(async (req, res) => {
  const <%= name %> = await <%= name %>Service.get<%= Name %>ById(req.params.<%= name %>Id);
  if (!<%= name %>) {
    throw new ApiError(httpStatus.NOT_FOUND, '<%= Name %> not found');
  }
  res.send({ status: true, <%= name %> });
});

const update<%= Name %> = catchAsync(async (req, res) => {
  const <%= name %> = await <%= name %>Service.update<%= Name %>ById(req.params.<%= name %>Id, req.body);
  res.send({ status: true, <%= name %> });
});

const delete<%= Name %> = catchAsync(async (req, res) => {
  await <%= name %>Service.delete<%= Name %>ById(req.params.<%= name %>Id);
  res.status(httpStatus.NO_CONTENT).send();
});

module.exports = {
  create<%= Name %>,
  get<%= Name %>s,
  get<%= Name %>,
  update<%= Name %>,
  delete<%= Name %>,
};
