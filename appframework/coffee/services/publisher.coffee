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


# Used for properly distributing received model data from the server
angular.module('OC').factory '_Publisher', ->


	class Publisher

		constructor: ->
			@subscriptions = {}


		# Use this to subscribe to a certain hashkey in the returned json data
		# dictionary.
		# If you send JSON from the server, you'll receive something like this
		#
		# 	{
		#		data: {
		#			modelName: {
		#				create: [{id: 1, name: 'john'}, {id: 2, name: 'ron'}],
		#               update: [],
		#               delete: []
		#           }
		#		}
		# 	}
		#
		# To get the array ['one', 'two'] passed to your model, just subscribe
		# to the key:
		#	Publisher.subscribeModelTo('modelName', myModelInstance)
		#
		subscribeModelTo: (model, name) ->
			@subscriptions[name] or= []
			@subscriptions[name].push(model)


		# This will publish data from the server to all registered subscribers
		# The parameter 'name' is the name under which subscribers have registered
		publishDataTo: (data, name) ->
			for subscriber in @subscriptions[name] || []
				subscriber.handle(data)


	return Publisher