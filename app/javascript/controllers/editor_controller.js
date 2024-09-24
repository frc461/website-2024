import { Controller } from "@hotwired/stimulus"
import EditorJS from "@editorjs/editorjs"
import Paragraph from "@editorjs/paragraph"
import Header from "@editorjs/header"
import List from "@editorjs/list"
import Quote from "@editorjs/quote"
import Delimiter from "@editorjs/delimiter"
import LinkTool from "@editorjs/link"
import ImageTool from "@editorjs/image"
import AttachesTool from "@editorjs/attaches"

// Connects to data-controller="editor"
export default class extends Controller {
  static targets = ["content"]

  connect() {
    this.content_field = document.getElementById("content_hidden")
    this.editor = new EditorJS({
      holder: this.contentTarget,
      data: this.getInitalContent(),
      tools: {
        paragraph: {
          class: Paragraph,
          inlineToolbar: true,
        },
        header: Header,
        list: List,
        quote: Quote,
        delimiter: Delimiter
      }
    })

    this.element.addEventListener("submit", this.saveData.bind(this))
  }

  getInitalContent() {
    return this.content_field.value ? JSON.parse(this.content_field.value) : {}
  }
  
  async saveData(event) {
    event.preventDefault()
    
    const data = await this.editor.save()
    this.content_field.value = JSON.stringify(data)
    this.element.submit()
  }
}
