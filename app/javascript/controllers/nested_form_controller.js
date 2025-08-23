import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["formTemplate", "itemsList"]
    static values = { 
        patternToReplaceWithIndex: String
    }

    connect(){
    console.log("I am connected!")
    }

  addItem(e) {
    console.log("you clicked?")

    this.itemsListTarget.insertAdjacentHTML('afterbegin', this.generateFormHTML())
  }

  generateFormHTML() {
    console.log("generating...")
    const html = this.formTemplateTarget.innerHTML.toString()

    return html.replaceAll(this.patternToReplaceWithIndexValue, new Date().getTime())
  }
}