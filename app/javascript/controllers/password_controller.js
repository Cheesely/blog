import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="password"
export default class extends Controller {
  static targets = ["field", "icon"]

  toggleVisibility() {
    const type = this.fieldTarget.type === 'password' ? 'text' : 'password'
    this.fieldTarget.type = type
    const iconClass = type === 'password' ? 'fa-eye' : 'fa-eye-slash'
    const removeIconClass = type === 'password' ? 'fa-eye-slash' : 'fa-eye'
    this.iconTarget.classList.remove(removeIconClass)
    this.iconTarget.classList.add(iconClass)
  }
}
