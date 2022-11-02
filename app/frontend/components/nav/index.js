// import "./index.css"
// We reserve Controller for the export name
import { Controller as BaseController } from "@hotwired/stimulus";

const IdSelectorsByPath = {
  "/text_inputs": "nav-item-text-inputs",
  "/": "nav-item-text-inputs",
};

export default class Controller extends BaseController {
  connect() {
    this.selectNavItem(IdSelectorsByPath[window.location.pathname]);
  }

  selectNavItem(id) {
    console.log("Nav tab switched to: ",id);
  }
}
