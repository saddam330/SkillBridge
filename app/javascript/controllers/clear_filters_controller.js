import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clear-filters"
export default class extends Controller {
  static targets = ["checkbox"]

  clear() {
    this.checkboxTargets.forEach((box) => {
      box.checked = false
    })
  }
}
