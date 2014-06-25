module.exports = ->
    #Load tasks
    require('load-grunt-tasks')(@)

    sourceDirectory = 'source'
    buildDirectory = 'build'
    framerSourceDirectory = 'node_modules/framerjs/framer/'

    @initConfig

        dir:
            sourceDir: sourceDirectory
            buildDir: buildDirectory
            framerSoureDir: framerSourceDirectory

        clean:
            localApp: [
                'js/app'
            ]
            localFramer: [
                'js/framer'
            ]

        watch:
            options:
                livereload: true
            html:
                files: ['index.html', 'images/**', 'app.js']
            coffee:
                files: ['*.coffee']
                tasks: ['coffee:compile']

        browserify:
            framerSrc:
                global: true
                src: 'node_modules/framerjs/framer/Framer.coffee'
                dest: 'js/framer/framer.js'
                options:
                    browserifyOptions:
                        basedir: 'node_modules/framerjs/framer/'
                        extensions: ['.coffee']
                    transform: ['coffeeify']

        coffee:
            compile:
                expand:true
                flatten: true
                cwd: 'src/'
                src: ['*.coffee']
                dest: 'js/app'
                ext: '.js'

        connect:
            server:
                options:
                    livereload: true
                    port: 4000
                    hostname: '*'
                    open: true

    # Register custom tasks
    @registerTask 'buildFramerSource', ['clean:localFramer', 'browserify:framerSrc']
    @registerTask 'server', ['connect:server', 'coffee', 'watch']
    @registerTask 'default', ['buildFramerSource', 'server']
