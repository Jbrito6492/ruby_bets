import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="mobile-menu"
export default class extends Controller {
    static targets = ["dropdownContent"]

    toggleDropdown(event) {
        event.preventDefault()
        console.log('testing')
        this.dropdownContentTarget.classList.toggle('hidden')
    }
}
