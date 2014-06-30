# Create a basic animation you just create a layer
layerA = new Layer
  width: 80, height: 80, backgroundColor: "blue"

# Start a simple animation for the y property to move 300px down
layerA.animate
  properties:
    y: 300

# Now let's create an animation with some more options. We'll animate both the y property and the rotation of the red square. You can animate as many properties as you want at the same time. The time property controls the speed of the animation in seconds.

layerB = new Layer
  width: 80, height: 80, x: 100, backgroundColor: "red"

layerB.animate
  properties:
    y: 300
    rotationZ: 360
  time: 5

# The curve options describe the animation curve. The default is linear, but you can use other curves like "cubic-bezier" or "spring".

layerC = new Layer
  width: 80, height: 80, x: 200, backgroundColor: "orange"

layerC.animate
  properties:
    y: 300
  time: 5
  curve: "cubic-bezier"
