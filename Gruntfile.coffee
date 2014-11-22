module.exports = (grunt) ->

  require('time-grunt') grunt

  # Dynamically load npm tasks
  require('jit-grunt') grunt

  grunt.initConfig

    # Watching changes files *.js,
    watch:
      all:
        files: [
          "Gruntfile.coffee"
          "src/*.coffee"
        ]
        tasks: [
          "coffee"
        ]
        options:
          nospawn: true

    coffee:
      compile:
        expand: true,
        flatten: true,
        src: ['src/*.coffee'],
        dest: 'lib/',
        ext: '.js'

    mochaTest:
      test:
        options:
          reporter: 'spec'
          require: 'coffee-script/register'
        src: ['test/**/*.coffee']
        # src: ['test/acceptance/*.coffee']
        # src: ['test/unit/*.coffee']


  grunt.registerTask "default", [
    "watch"
  ]

  grunt.registerTask "test", [
    "coffee"
    "mochaTest"
  ]

  return
