## Framed

Bolierplate project & toolchain for rapid prototyping with Framer.js

Contains all you need to get up and running with a [http://framerjs.com/](Framer.js) project.

#### Features

* Write your code using [http://coffeescript.org/](Coffeescript).
* Instant update to any changes using watch & livereload
* Write CSS using [http://sass-lang.com/](Sass)

### How to install

You will need Node and Npm installed, if you don't have these installed then [http://thechangelog.com/install-node-js-with-homebrew-on-os-x/](follow this easy guide to install using Homebrew).

* Clone the project
* Run `npm install`. Simples.

### How to run

* Type `grunt` in the terminal

A webpage will be loaded up at [http://0.0.0.0:4000](http://0.0.0.0:4000) with your prototype. Any changes you make to will be updated automagically. Nice right.

### Writing your Prototype

Write your code in `source/app.coffee`.
Any CSS code you may need can be written in the `styles/main.scss` file.

Add images exported from Sketch or Photoshop into the `images` directory. You can the reference them inside your `.coffee` file like this:

```
myImageLayer = new Layer
    image: "images/myImage.png"
```

Then you can manipulate this Layer using the awesome Framer.js commands. Example, moving states to the next state :

```
myImageLayer.on Events.Click, ->
    myImageLayer.states.next()
```
