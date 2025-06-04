import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "content"]

  connect() {
    this.loaded = false
  }

  toggle() {
    this.menuTarget.classList.toggle("d-none")

    if (!this.loaded) {
      fetch("/notifications/list", {
        headers: { Accept: "text/vnd.turbo-stream.html" },
      })
        .then((response) => response.text())
        .then((html) => {
          this.contentTarget.innerHTML = html
          this.loaded = true
        })
    }
  }
}
