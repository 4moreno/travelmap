import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"
import MapboxDirections from "@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions"


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    // let map_style = "mapbox://styles/mapbox/streets-v10"

    // when you want to change the map style
    // if (document.getElementsByClassName("mapstyle_white").length === 1) {
    //   map_style = "mapbox://styles/mapbox/light-v10"
    // }

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/satellite-streets-v11"
      // style: map_style

    })

    // this.map.style = "mapbox://styles/mapbox/light-v10";
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    const nav_zoom = new mapboxgl.NavigationControl();
    this.map.addControl(nav_zoom, 'bottom-left');
    const user_loc = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true,
      showUserLocation: true
    });
    this.map.addControl(user_loc, 'bottom-left');

    // const MapboxDirections = require('@mapbox/mapbox-gl-directions');

    let directions = new MapboxDirections({
      accessToken: this.apiKeyValue,
      unit: 'metric',
      profile: 'mapbox/cycling'
    });

    this.map.addControl(directions, 'top-left');

    map.addControl(new mapboxgl.NavigationControl());

// Edificios en 3D



  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }


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

}
