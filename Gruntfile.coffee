module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean:
      files: ["tmp/"]

    haml:
      app:
        files: 
          "app/index.html" : "app/_pre/index.haml"

    sass:
      dist:
        files: 
          'app/css/app.css' : 'app/css/_pre/app.sass'

    coffee:
      glob_to_multiple: 
        expand: true,
        cwd: 'app/js/_pre',
        src: ['*.coffee'],
        dest: 'app/js',
        ext: '.js'

  grunt.loadTasks "tasks"

  grunt.loadNpmTasks('grunt-haml')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-clean')

  grunt.registerTask "default", ["clean", "haml", "coffee", "sass"]

