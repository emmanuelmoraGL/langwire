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
    const elem = document.querySelector(`#${id}`)
    elem.classList.remove("nav-item-deselected")
    elem.classList.add("nav-item-selected")
  }
}
