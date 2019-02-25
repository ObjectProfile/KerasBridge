# KerasBridge
Bridge between Pharo and Keras


## Installation

First, you need to install [Python bridge](https://github.com/ObjectProfile/PythonBridge)

Second, you need to run in your image:
```Smalltalk
Metacello new
    baseline: 'KerasBridge';
    repository: 'github://ObjectProfile/KerasBridge/src';
    load.
(Smalltalk at: #Keras) installPipenvEnvironment
```
