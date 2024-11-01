import { Controller } from "@hotwired/stimulus"
import EditorJS from "@editorjs/editorjs"
import Paragraph from "@editorjs/paragraph"
import Header from "@editorjs/header"
import NestedList from "@editorjs/nested-list"
import Quote from "@editorjs/quote"
import Delimiter from "@editorjs/delimiter"
import Table from "@editorjs/table"
import Underline from "@editorjs/underline"
import ImageTool from "@editorjs/image"
import Alert from "editorjs-alert"

import { Card } from "card"

// Connects to data-controller="editor"
export default class extends Controller {
  static targets = ["content"]

  connect() {
    this.content_field = document.getElementById("content_hidden");

    let tools = {
      paragraph: {
        class: Paragraph,
        inlineToolbar: true,
      },
      header: Header,
      list: {
        class: NestedList,
        inlineToolbar: true,
        config: {
          defaultStyle: "ordered",
        },
      },
      quote: Quote,
      delimiter: Delimiter,
      table: Table,
      underline: Underline,
      alert: Alert,
      card: {
        class: Card,
        inlineToolbar: true,
        config: {
          tools() { 
            delete tools.card
            return tools
          }
        },
      },
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
      }
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
}
