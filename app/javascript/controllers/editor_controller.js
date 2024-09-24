import { Controller } from "@hotwired/stimulus"
import { EditorJS } from "@editorjs/editorjs"
import { Paragraph } from "@editorjs/paragraph"
import { Header } from "@editorjs/header"
import { List } from "@editorjs/list"
import { Quote } from "@editorjs/quote"
import { Delimiter } from "@editorjs/delimiter"
import { LinkTool } from "@editorjs/link"
import { ImageTool } from "@editorjs/image"
import { AttachesTool } from "@editorjs/attaches"

// Connects to data-controller="editor"
export default class extends Controller {
  connect() {
    const editor = new EditorJS({
      holder: 'editorjs',
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
  }
}
