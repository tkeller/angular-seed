module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    clean:
      files: ["tmp/"]

    haml:
      app:
        files: 
          "app/index.html" : "_app/index.haml"

    sass:
      dist:
        files: 
          'app/css/app.css' : '_app/css/app.sass'

    coffee:
      glob_to_multiple: 
        expand: true,
        cwd: '_app/js',
        src: ['*.coffee'],
        dest: 'app/js',
        ext: '.js'

    watch:
      js:
        files: ['_app/js/*']
        tasks: ['coffee']

      css:
        files: ['_app/css/*']
        tasks: ['sass']

      haml:
        files: ['_app/*']
        tasks: ['haml']

  grunt.loadTasks "tasks"

  grunt.loadNpmTasks('grunt-haml')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.registerTask "default", ["clean", "haml", "coffee", "sass"]

