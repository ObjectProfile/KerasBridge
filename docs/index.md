---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
---

# Bridge between Pharo and Keras

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
