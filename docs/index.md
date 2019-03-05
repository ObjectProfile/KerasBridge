---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: default
title: Home
nav_order: 0
permalink: /
---

# Bridge between Pharo and Keras
{: .fs-8 }

KerasBridge gives Pharo developers the capability of using Keras neural network python library directly from Pharo.
{: .fs-5 .fw-300 }

## Getting Started

First, you need to install Python, we recommend you to look at [Python bridge](https://objectprofile.github.io/PythonBridge/).
In particular, you need Python3.6 (Python3.7 is not compatible with Tensorflow yet), Pipenv and a Pharo6.1 or newer image.

Second, you need to run in your image:
```smalltalk
Metacello new
    baseline: 'KerasBridge';
    repository: 'github://ObjectProfile/KerasBridge/src';
    load.
(Smalltalk at: #Keras) installPipenvEnvironment
```

If this fails refer to the [troubleshooting section](https://objectprofile.github.io/PythonBridge/pages/installation#troubleshooting) of the PythonBridge documentation. Though remember that the pipenv environment of the KerasBridge is different from the base PythonBridge, therfore, all commands should be performed on Keras class and KerasBridge repository.

## First neural network

The following code snippet creates a neural network that learns to compute the XOR operation.

```smalltalk
Keras do: [ 
    x := #(#(0 0) #(0 1) #(1 0) #(1 1)).
    y := #((0) (1) (1) (0)).

    model := KSequentialModel inputs: 2.
    model addLayer: (KDenseLayer neurons: 8 activation: KTanh).
    model addLayer: (KDenseLayer neurons: 1).
    model addLayer: (KActivationLayer activation: KSigmoid).
    model 
        compileLoss: KBinaryCrossentropy 
        optimizer: KAdam default 
        metrics: { KBinaryAccuracy }.
    (model fit: x labels: y epochs: 700) waitForValue ]
```

The first line `Keras do: [ ... ]` initializes the Python process, executes the code in the block and then ensures the destruction of the python process to prevent having zombies. This could be replaced by using `start` and `stop` methods.
```smalltalk
Keras start.
...
Keras stop.
```

The `x` and `y` variables corresponds to the training data and the labels.

`model := KSequentialModel inputs: 2.` creates a Keras Sequential model.

`model addLayer: (KDenseLayer neurons: 8 activation: KTanh).` creates a new Dense layer with 8 neurons and a Tanh activation function, and adds it to the model.

`model addLayer: (KActivationLayer activation: KSigmoid).` creates a new Activation layer with a Sigmoid activation function. Then it adds the layer to the model.

`model compileLoss: KBinaryCrossentropy optimizer: KAdam default metrics: { KBinaryAccuracy }.` compiles the model using BinaryCrossentropy loss function, the Adam optimizer and the BinaryAccuracy metric.

`model fit: x labels: y epochs: 700` train the model using `x` data with `y` labels for 700 epochs. This method returns a promise expecting the training history, if you want to wait for the result of the computation send the promise the message `waitForValue`.