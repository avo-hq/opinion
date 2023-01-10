import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['picker']

  connect() {
    console.log('emoji_controller', this.pickerTarget)
  }

  toggle() {
    this.pickerTarget.classList.toggle('hidden')
  }

  react({params}) {
    console.log('react->', params)
  }
}
