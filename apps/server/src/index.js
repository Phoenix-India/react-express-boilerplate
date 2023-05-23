const mongoose = require('mongoose');
const cachegoose = require('recachegoose');
const app = require('./app');
const config = require('./config/config');
const logger = require('./config/logger');

let server;

mongoose.set('strictQuery', config.mongoose.strictQuery);

if (config.cache.enable) {
  cachegoose(mongoose, config.cache.config);
} else {
  mongoose.Query.prototype.cache = function () {
    return this;
  };
}

mongoose.connect(config.mongoose.url, config.mongoose.options).then(() => {
  logger.info('Connected to MongoDB');
  server = app.listen(config.port, () => {
    logger.info(`Listening to port ${config.port}`);
  });
});

const exitHandler = () => {
  if (server) {
    server.close(() => {
      logger.info('Server closed');
      process.exit(1);
    });
  } else { process.exit(1); }
};

const unexpectedErrorHandler = error => {
  logger.error(error);
  exitHandler();
};

process.on('uncaughtException', unexpectedErrorHandler);
process.on('unhandledRejection', unexpectedErrorHandler);

process.on('SIGTERM', () => {
  logger.info('SIGTERM received');
  if (server) { server.close(); }
});
