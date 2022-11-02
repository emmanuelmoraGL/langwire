// We reserve Controller for the export name
import { Controller as BaseController } from "@hotwired/stimulus";

export default class Controller extends BaseController {
  connect() {}

  clear(event) {
    this.element.reset();
  }
}
