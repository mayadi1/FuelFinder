# FuelFinder app
# main server application

print("FuelFiner server has started")

# from flask import Flask, jsonify,abort, request
# list = []


# app = Flask(__name__)
# @app.route('/api/v1/<string:lat>/<string:long>/<int:radius>', methods=['GET'])
# def send_location(lat,long,radius):
# 	# list_of_locations = cregs_funtion_here
# 	info = {'latitude':lat,'longitude':long, "radius":radius}
# 	return jsonify(info)


# def get_gas_station_list(location):
# 	test = {'list':""}
# 	return jsonify({'list':""})
# if __name__ == '__main__':
# 	app.run(debug=True, port=8080)



# from flask import Flask, render_template, jsonify
import requests
from key import key
# import imghdr
app = Flask(__name__)

search_url = "https://maps.googleapis.com/maps/api/place/textsearch/json"
photos_url = "https://maps.googleapis.com/maps/api/place/photo"

@app.route("/", methods=["GET"])
def retreive():
    return render_template('layout.html') 

@app.route("/sendRequest/<string:query>")
def results(query):
	search_payload = {"key":key, "query":query}
	search_req = requests.get(search_url, params=search_payload)
	search_json = search_req.json()
	print(search_json)

	# photo_id = search_json["results"][0]["photos"][0]["photo_reference"]

	# photo_payload = {"key" : key, "maxwidth" : 500, "maxwidth" : 500, "photoreference" : photo_id}
	# photo_request = requests.get(photos_url, params=photo_payload)

	# photo_type = imghdr.what("", photo_request.content)
	# photo_name = "static/" + query + "." + photo_type

	# with open(photo_name, "wb") as photo:
	# 	photo.write(photo_request.content)

	return search_json
	# '<img src='+ photo_name + '>'


if __name__ ==  "__main__":
    app.run(debug=True)