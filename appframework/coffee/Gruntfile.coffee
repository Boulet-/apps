###

ownCloud - App Framework

@author Bernhard Posselt
@copyright 2012 Bernhard Posselt nukeawhale@gmail.com

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU AFFERO GENERAL PUBLIC LICENSE
License as published by the Free Software Foundation; either
version 3 of the License, or any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU AFFERO GENERAL PUBLIC LICENSE for more details.

You should have received a copy of the GNU Affero General Public
License along with this library.  If not, see <http://www.gnu.org/licenses/>.

###


module.exports = (grunt) ->
	
	grunt.loadNpmTasks('grunt-contrib-coffee')
	grunt.loadNpmTasks('grunt-contrib-concat')
	grunt.loadNpmTasks('grunt-contrib-watch')
	grunt.loadNpmTasks('grunt-coffeelint')
	grunt.loadNpmTasks('gruntacular');

	grunt.initConfig
	
		meta:
			pkg: grunt.file.readJSON('package.json')
			version: '<%= meta.pkg.version %>'
			banner: '/**\n' +
				' * <%= meta.pkg.description %> - v<%= meta.version %>\n' +
				' *\n' +
				' * Copyright (c) <%= grunt.template.today("yyyy") %> - ' +
				'<%= meta.pkg.author %>\n' +
				' *\n' +
				' * This file is licensed under the Affero General Public License version 3 or later.\n' +
				' * See the COPYING-README file\n' +
				' *\n' + 
				' */'
			prefix: '(function(angular, $, OC, oc_requesttoken){'
			suffix: '})(window.angular, jQuery, OC, oc_requesttoken);'
			build: 'build/'
			production: '../js/'

		concat:
			app: 
				options:
					banner: '<%= meta.banner %>\n'
				src: '<%= meta.build %>app.js'
				dest: '<%= meta.production %>app.js'
		coffee: 
			compile:
				files:
					'<%= meta.build %>app.js': [
						'app.coffee'
						'services/*.coffee'
						'directives/*.coffee'
					]
		coffeelint:
			app: [
				'app.coffee'
				'services/*.coffee'
				'directives/*.coffee'
			]
		coffeelintOptions:
			'no_tabs':
				'level': 'ignore'
			'indentation':
				'level': 'ignore'

		watch: 
			app: 
				files: './**/*.coffee',
				tasks: 'compile'


	grunt.registerTask('run', ['watch'])
	grunt.registerTask('lint', ['coffeelint'])
	grunt.registerTask('compile', [
			#'coffeelint'
			'coffee'
			'concat:app'
			]
	)
