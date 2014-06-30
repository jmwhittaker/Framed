module.exports = ->
    #Load tasks
    require('load-grunt-tasks')(@)

    @initConfig

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
                port: 35730
            html:
                files: ['index.html', 'images/**']
            css:
                files: 'styles/*.scss',
                tasks: ['sass']
            coffee:
                files: ['source/**/*.coffee']
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
                cwd: 'source/'
                src: ['*.coffee']
                dest: 'js/app'
                ext: '.js'

        sass:
            dist:
                files: [
                    expand: true
                    cwd: 'styles'
                    src: '*.scss'
                    dest: 'css'
                    ext:'.css'
                ]

        # Default webserver options
        connect:
            server:
                options:
                    livereload: true
                    port: 4000
                    hostname: '*'
                    open: true

    # Register custom tasks
    @registerTask 'buildFramerSource', ['clean:localFramer', 'browserify:framerSrc']
    @registerTask 'server', ['connect:server', 'coffee', 'sass', 'watch']
    @registerTask 'default', ['buildFramerSource', 'server']
