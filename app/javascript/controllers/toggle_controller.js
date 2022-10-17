import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [ "caret", "toggleable"]
  connect() {
  }
  toggle() {
    this.toggleableTarget.classList.toggle("hidden")
    this.caretTarget.classList.toggle("fa-caret-down")
    this.caretTarget.classList.toggle("fa-caret-up")
  }
}
