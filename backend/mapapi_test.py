import urllib.request, json, pprint
#Google MapsDdirections API endpoint
endpoint = 'https://maps.googleapis.com/maps/api/directions/json?'
api_key = 'AIzaSyCLNO5mol_LjqDuOkTKLBke4Q9de-6GVy4'
#Asks the user to input Where they are and where they want to go.
origin = "london".replace(' ','+')
destination = "new york".replace(' ','+')
#Building the URL for the request
nav_request = 'origin={}&destination={}&key={}'.format(origin,destination,api_key)
request = endpoint + nav_request
#Sends the request and reads the response.
response = urllib.request.urlopen(request).read()
#Loads response as JSON
directions = json.loads(response)
print(json.dumps(directions, indent=4, sort_keys=True))