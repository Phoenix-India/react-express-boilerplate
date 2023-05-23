const express = require('express');
const auth = require('../../middlewares/auth');
const validate = require('../../middlewares/validate');
const notificationValidation = require('../../validations/notification.validation');
const notificationController = require('../../controllers/notification.controller');

const router = express.Router();

router
  .route('/')
  .get(
    auth('getNotifications'),
    validate(notificationValidation.getNotifications),
    notificationController.getNotifications
  )
  .post(
    auth('createNotification'),
    validate(notificationValidation.createNotification),
    notificationController.createNotification
  );

router
  .route('/:notificationId')
  .get(
    auth('getNotification'),
    validate(notificationValidation.getNotification),
    notificationController.getNotification
  )
  .patch(
    auth('updateNotification'),
    validate(notificationValidation.updateNotification),
    notificationController.updateNotification
  )
  .delete(
    auth('deleteNotification'),
    validate(notificationValidation.deleteNotification),
    notificationController.deleteNotification
  );

module.exports = router;
