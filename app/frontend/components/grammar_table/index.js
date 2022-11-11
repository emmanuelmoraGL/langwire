// We reserve Controller for the export name
import { Controller as BaseController } from '@hotwired/stimulus';

export default class Controller extends BaseController {
  connect() {
    let textInputId = this.data.get('textInputId')
    let event = new CustomEvent('grammar_table_event', { 
      detail: {
        type: 'connect',
        textInputId: textInputId
      }
    })
    document.dispatchEvent(event)
  }
}
