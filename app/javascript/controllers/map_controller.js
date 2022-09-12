import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    let map_style = "mapbox://styles/mapbox/streets-v10"

    // when you want to change the map style
    // if (document.getElementsByClassName("mapstyle_white").length === 1) {
    //   map_style = "mapbox://styles/mapbox/light-v10"
    // }

    this.map = new mapboxgl.Map({
      container: this.element,
<<<<<<< HEAD
      style: "mapbox://styles/mapbox/satellite-streets-v11"
=======
      style: map_style
>>>>>>> master
    })

    // this.map.style = "mapbox://styles/mapbox/light-v10";
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    const nav_zoom = new mapboxgl.NavigationControl();
    this.map.addControl(nav_zoom, 'bottom-left');
    const user_loc = new mapboxgl.GeolocateControl();
    this.map.addControl(user_loc, 'bottom-left');

    var mapboxgl = require('mapbox-gl');
    var MapboxDirections = require('@mapbox/mapbox-gl-directions');

    var directions = new MapboxDirections({
      accessToken: 'mapboxgl.accessToken',
      unit: 'metric',
      profile: 'mapbox/cycling'
    });

    var map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v9'
    });

    map.addControl(directions, 'top-left');



  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      if (marker.filter_cards){
        const filter = new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat])
        .addTo(this.map);
        // filtering the marker with city_id
        filter.getElement().addEventListener('click', () => {
          this.showHideCards(marker)
        });
      }
      else if(marker.info_window) {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window)
        new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
      } else {
        new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
      }
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

<<<<<<< HEAD
=======
  showHideCards(marker) {
    // console.log(marker)
    let elements = document.getElementsByClassName("hide_city");
    for (let element of elements) {
      element.style.display = "none";
    }

    elements = document.getElementsByClassName("cityid_" + marker.city);
    for (let e of elements) {
      e.style.display = "block";
    }
  }
>>>>>>> master
}
