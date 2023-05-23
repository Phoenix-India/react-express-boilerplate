const mongoose = require('mongoose');
const mongooseDelete = require('mongoose-delete');
const { toJSON, paginate } = require('./plugins');

const notificationSchema = mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  description: {
    type: String,
    required: true,
  },
  user: {
    type: mongoose.Schema.Types.ObjectId,
    required: true,
  },
  important: {
    type: Boolean,
    default: false,
  },
  viewed: {
    type: Boolean,
    default: false,
  },
  createdBy: {
    type: String,
    default: 'system',
  },
},
{
  timestamps: true,
});

// add plugin that converts mongoose to json
notificationSchema.plugin(toJSON);
notificationSchema.plugin(paginate);
notificationSchema.plugin(mongooseDelete, {
  indexFields: 'all',
});

/**
 * @typedef Notification
 */
const Notification = mongoose.model('Notification', notificationSchema);

module.exports = {
  model: Notification,
};
