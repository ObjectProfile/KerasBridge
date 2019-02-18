# KerasBridge
Bridge between Pharo and Keras


## Installation

First, you need to install [Kython bridge](https://github.com/ObjectProfile/PythonBridge)

Second, you need to run in your image:
```Smalltalk
Metacello new
    baseline: 'PythonBridge';
    repository: 'github://ObjectProfile/PythonBridge/src';
    load.
(Smalltalk at: #PBApplication) installPipenvEnvironment
```
