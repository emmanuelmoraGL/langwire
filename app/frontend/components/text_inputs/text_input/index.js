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
    this.selectBtnVis(event, 'btn-vis-grammar-table')
  }

  selectBtnVis(event, id){
    if (event.detail.textInputId == this.data.get('textInputId')){
      this.element.querySelectorAll("[id^='btn-vis']").forEach((btnVis) => {
        if (btnVis.id == id) {
          btnVis.classList.add('btn-primary-selected')
        } else {
          btnVis.classList.remove('btn-primary-selected')
        }
      })

      event.preventDefault();
    }
  }
}
