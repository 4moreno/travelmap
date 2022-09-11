import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/satellite-streets-v11"
    })
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
      if (marker.info_window) {
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

}
