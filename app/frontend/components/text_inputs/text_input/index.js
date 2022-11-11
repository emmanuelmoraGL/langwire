// We reserve Controller for the export name
import { Controller as BaseController } from '@hotwired/stimulus';

export default class Controller extends BaseController {
  connect() {
    this.visualization_listener = document.addEventListener('visualization_connect', 
      (event) => this.onVisualizationConnect(event));
  }
  
  disconnect() {
    document.removeEventListener('visualization_connect', this.visualization_listener);
  }

  onVisualizationConnect(event) {
    this.selectBtnVis(event, `btn-vis-${event.detail.type}`)
  }

  selectBtnVis(event, id){
    if (event.detail.textInputId == this.data.get('textInputId')){
      this.element.querySelectorAll("[id^='btn-vis']").forEach((btnVis) => {
        if (btnVis.id == id && btnVis.classList.contains('btn-primary-selected')) {
          console.log(this.element.querySelector(`#visualization_${this.data.get('textInputId')}`))
          this.element.querySelector(`#visualization_${this.data.get('textInputId')}`).replaceChildren();
          btnVis.classList.remove('btn-primary-selected')
        } else if (btnVis.id == id){
          btnVis.classList.add('btn-primary-selected')
        } else {
          btnVis.classList.remove('btn-primary-selected')
        }
      })

      event.preventDefault();
    }
  }
}
