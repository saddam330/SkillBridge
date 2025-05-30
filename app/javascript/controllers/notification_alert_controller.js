import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notification-alert"
export default class extends Controller {
  connect() {
    console.log("Something Unique")
  }
}
