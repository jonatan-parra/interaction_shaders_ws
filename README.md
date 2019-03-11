# Taller de shaders

## Propósito

Estudiar los [patrones de diseño de shaders](http://visualcomputing.github.io/Shaders/#/4).

## Tarea

Escoja una de las siguientes dos:

1. Hacer un _benchmark_ entre la implementación por software y la de shaders de varias máscaras de convolución aplicadas a imágenes y video.
2. Estudiar e implementar el [shadow mapping](http://www.opengl-tutorial.org/intermediate-tutorials/tutorial-16-shadow-mapping/). Se puede emplear la escena del [punto 2 del taller de transformaciones](https://github.com/VisualComputing/Transformations_ws), así como la librería [frames](https://github.com/VisualComputing/frames). Ver el ejemplo [ShadowMap](https://github.com/VisualComputing/frames/tree/master/examples/demos/ShadowMap).

## Integrantes

Máximo tres.

Complete la tabla:

| Integrante    | github nick |
|---------------|-------------|
| Kevin Castro  | keacastroga |
| Jonatan Parra | jonatan360  |

## Informe

Para la primera parte del taller (interacción) se elaboro un entorno en el cual se puede controlar un helicóptero usando un control de Xbox 360, la configuración de los botones esta representada en la siguiente tabla:

| Botón             | Acción                                      |
|-------------------|---------------------------------------------|
| Y                 | Cambiar control entre helicóptero y entorno |
| X                 | Poner el helicóptero en la posición inicial |
| B                 | Resetear cámara                             |
| Select            | Cambiar a cámara tercera persona            |
| Stick Izquierdo   | Desplazamiento en los ejes X y Y            |
| Stick Derecho     | Rotación en los ejes X y Y                  |
| Trigger Izquierdo | Desplazamiento en el eje Z positivo         |
| Trigger Derecho   | Desplazamiento en el eje Z negativo         |
| Bumper Izquierdo  | Rotación positiva en el eje Z               |
| Bumper Derecho    | Rotación negativa en el eje Z               |

En la elaboración se obtuvo un modelo de helicóptero gratuito y se realizaron algunas formas básicas usando el software Blender para rellenar el entorno.

Para la segunda parte del taller (shaders) se implementaron varios shaders de iluminación para observar como cada uno crea diferentes efectos sobre el entorno, los controles para manejar los shaders se representan en la siguiente tabla:

| Tecla             | Shader                                      |
|-------------------|---------------------------------------------|
| a                 | Per pixel diffuse light                     |
| d                 | Per pixel specular light                    |
| z                 | Per vertex diffuse light                    |
| c                 | Per vertex specular light                   |

Para la realización se tuvo como base los shaders que se encontraban en la presentación de [Shaders](http://visualcomputing.github.io/Shaders) de la clase, con modificaciones para el soporte de las texturas de los elementos del entorno.

## Entrega

Fecha límite Domingo 10/3/19 a las 24h.
