from PythonBridge import pharo_hooks
import keras

class Pharo_Fit_Notifier(keras.callbacks.Callback):
    def __init__(self, notificationId):
        super().__init__()
        self.notificationId = notificationId

    def on_train_begin(self, logs={}):
        return
 
    def on_train_end(self, logs={}):
        return
 
    def on_epoch_begin(self, epoch, logs={}):
        return
 
    def on_epoch_end(self, epoch, logs={}):
        pharo_hooks.notifyStep("", self.notificationId)
        return
 
    def on_batch_begin(self, batch, logs={}):
        return
 
    def on_batch_end(self, batch, logs={}):
        return