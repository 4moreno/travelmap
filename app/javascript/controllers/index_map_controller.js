import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

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
      style: "mapbox://styles/mapbox/streets-v10"
      // style: map_style

    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    const nav_zoom = new mapboxgl.NavigationControl();
    this.map.addControl(nav_zoom, 'bottom-left');
  }


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #addMarkersToMap() {
     this.markersValue.forEach((marker) => {

        // const filter = new mapboxgl.Popup().setHTML(marker.filter_cards)
        const customMarker = document.createElement("div")
        customMarker.className = "marker"
        customMarker.style.backgroundImage = `url('${marker.image_url}')`
        customMarker.style.backgroundSize = "contain"
        customMarker.style.width = "25px"
        customMarker.style.height = "25px"

      if (marker.filter_cards){
        const filter = new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat])
        .addTo(this.map);
        // filtering the marker with city_id
        filter.getElement().addEventListener('click', () => {
          this.showHideCards(marker)
        });
      } else {
        new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
      }
    });

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
