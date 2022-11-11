// We reserve Controller for the export name
import { Controller as BaseController } from '@hotwired/stimulus';

export default class Controller extends BaseController {
  connect() {
    this.notifyOnConnect()
  }

  notifyOnConnect() {
    let textInputId = this.data.get('textInputId')
    let event = new CustomEvent('visualization_connect', { 
      detail: {
        type: "table",
        textInputId: textInputId
      }
    })
    document.dispatchEvent(event)
  }
}
