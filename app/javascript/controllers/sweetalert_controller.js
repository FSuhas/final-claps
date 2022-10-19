import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

// Connects to data-controller="sweetalert"
export default class extends Controller {
  static values = { text: String }

  connect() {
    console.log("Hello, Stimulus!", this.element)
    console.log("The text value is:", this.textValue)
    console.log("The output target element is:", this.outputTarget)

    const Toast = Swal.mixin({
      toast: true,
      position: 'top',
      showConfirmButton: false,
      showCloseButton: true,
      timer: 3000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    })
    Toast.fire({
      icon: 'info',
      title: this.textValue
    })
  }

  success() {
    Swal.fire({
      title: 'Success!',
      text: 'You have successfully signed in.',
      icon: 'success',
      confirmButtonText: 'Continue'
    })
  }

  error() {
    Swal.fire({
      title: 'Error!',
      text: 'There was an error signing in.',
      icon: 'error',
      confirmButtonText: 'Continue'
    })
  }
}
