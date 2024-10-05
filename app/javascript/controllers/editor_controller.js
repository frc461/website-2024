import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="editor"
export default class extends Controller {
  static targets = ["content"]

  connect() {
    this.content_field = document.getElementById("content_hidden");

    this.editor = new Quill("#content", {
      theme: 'snow'
    });
    this.editor.setContents(this.getInitalContent());

    this.element.addEventListener("submit", this.saveData.bind(this))
  }

  getInitalContent() {
    return this.content_field.value ? JSON.parse(this.content_field.value) : {}
  }
  
  saveData(event) {
    event.preventDefault();

    const data = this.editor.getContents();
    this.content_field.value = JSON.stringify(data)
    this.element.submit();
  }
}
