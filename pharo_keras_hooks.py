from PythonBridge import bridge_hooks
import keras

class Pharo_Fit_Notifier(keras.callbacks.Callback):
    def __init__(self, observer):
        super().__init__()
        self.observer = observer

    def on_train_begin(self, logs={}):
        return
 
    def on_train_end(self, logs={}):
        return
 
    def on_epoch_begin(self, epoch, logs={}):
        return
 
    def on_epoch_end(self, epoch, logs={}):
        self.observer(None)
        return
 
    def on_batch_begin(self, batch, logs={}):
        return
 
    def on_batch_end(self, batch, logs={}):
        return