import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["formTemplate", "itemsList", "item"]
    static values = { 
        patternToReplaceWithIndex: String
    }

    connect(){
    console.log("I am connected!")
    }

  addItem(e) {
     e.preventDefault();
    console.log("adding a new passenger!")

    this.itemsListTarget.insertAdjacentHTML('afterbegin', this.generateFormHTML())
  }

  remove(e) {
        e.preventDefault();
        console.log("removing passenger!")
     this.itemTarget.remove();
    }
  

  generateFormHTML() {
    console.log("generating...")
    const html = this.formTemplateTarget.innerHTML.toString()

    return html.replaceAll(this.patternToReplaceWithIndexValue, new Date().getTime())
  }
}