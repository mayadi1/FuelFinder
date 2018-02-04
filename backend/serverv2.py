from googleplaces import GooglePlaces, types, lang
from flask import Flask, jsonify,abort, request

import json
YOUR_API_KEY = 'AIzaSyButRBDJrYCrFqXa6mTZU98YZUH94RRuE4'

google_places = GooglePlaces(YOUR_API_KEY)

# You may prefer to use the text_search API, instead.
query_result = google_places.nearby_search(
        location='San Francisco, USA', keyword='gas',
        radius=500)
# If types param contains only 1 item the request to Google Places API
# will be send as type param to fullfil:
# http://googlegeodevelopers.blogspot.com.au/2016/02/changes-and-quality-improvements-in_16.html

if query_result.has_attributions:
    print query_result.html_attributions
list = []
for place in query_result.places:
	# print(place)

    # # Returned places from a query are place summaries.
    # print( place.name)
    name = place.name
    lat = place.geo_location["lat"]
    long = place.geo_location["lng"]
    placeid = place.place_id
    # print( place.geo_location["lat"])
    # print("{}".format(placeid))
    list.append(placeid)

    # print( place.place_id)
print(json.dumps(list))

app = Flask(__name__)
@app.route('/api/v1/<string:lat>/<string:long>/<int:radius>', methods=['GET'])
def send_location(lat,long,radius):
    return json.dumps(list)


if __name__ == '__main__':
    app.run(debug=True, port=8080)