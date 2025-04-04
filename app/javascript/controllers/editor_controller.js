import { Controller } from "@hotwired/stimulus"
import EditorJS from "@editorjs/editorjs"
import Alert from "editorjs-alert"
import Delimiter from "@editorjs/delimiter"
import Embed from "@editorjs/embed"
import Header from "@editorjs/header"
import ImageTool from "@editorjs/image"
import NestedList from "@editorjs/nested-list"
import Paragraph from "@editorjs/paragraph"
import Quote from "@editorjs/quote"
import Table from "@editorjs/table"
import Underline from "@editorjs/underline"

import { Card } from "card"

// Connects to data-controller="editor"
export default class extends Controller {
  static targets = ["content"]

  connect() {
    this.content_field = document.getElementById("content_hidden");

    let tools = {
      alert: Alert,
      card: {
        class: Card,
        inlineToolbar: true,
        config: {
          tools() {
            delete tools.card
            return tools
          }
        }
      },
      delimiter: Delimiter,
      embed: Embed,
      header: Header,
      image: {
        class: ImageTool,
          config: {
            endpoints: {
              byFile: "/page_assets/upload_image"
            }, 
            additionalRequestHeaders: {
              "X-CSRF-Token": this.getCSRFToken()
            }
          }
      },
      list: {
        class: NestedList,
        inlineToolbar: true,
        config: {
          defaultStyle: "ordered"
        }
      },
      paragraph: {
        class: Paragraph,
        inlineToolbar: true
      },
      quote: Quote,
      table: Table,
      underline: Underline
    };

    this.editor = new EditorJS({
      holder: this.contentTarget,
      data: this.content_field.value ? JSON.parse(this.content_field.value) : {},
      tools: tools,
      minHeight: 50,
    });

    this.element.addEventListener("submit", this.saveData.bind(this))
  }

  getCSRFToken() {
    const meta = document.querySelector("meta[name='csrf-token']");
    return meta ? meta.content : "";
  }
  
  async saveData(event) {
    event.preventDefault()
    
    const data = await this.editor.save()
    this.content_field.value = JSON.stringify(data)
    this.element.submit()
  }

  async update({ detail: { content, save_original, load_original } }) {
    if (save_original) { this.original_data = await this.editor.save() }
    if (load_original) {
      this.editor.render(this.original_data)
      return
    }

    this.editor.render(JSON.parse(content))
  }
}
