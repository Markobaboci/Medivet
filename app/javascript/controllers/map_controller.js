import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl'; // Make sure to import this

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v11",
      center: [this.markersValue[0].lng, this.markersValue[0].lat], // Center on the marker
      zoom: 12
    });

    this.markersValue.forEach(marker => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });
  }
}
