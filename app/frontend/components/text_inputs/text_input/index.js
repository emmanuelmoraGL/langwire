// We reserve Controller for the export name
import { Controller as BaseController } from '@hotwired/stimulus';

export default class Controller extends BaseController {
  connect() {
    this.grammar_table_event_listener = document.addEventListener('grammar_table_event', (event) => this.grammarTableEventHandler(event));
  }
  
  disconnect() {
    document.removeEventListener('grammar_table_event', this.grammarTableEventHandler);
  }

  grammarTableEventHandler(event) {
    if (event.detail.textInputId == this.data.get('textInputId')){
      const elem = this.element.querySelector('#btn-vis-grammar-table')
      elem.classList.add("btn-primary-selected")

      event.preventDefault();
    }
  }
}
