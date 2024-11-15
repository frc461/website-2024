import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="template"
export default class extends Controller {
  static targets = ["templateId"]

  connect() {
    this.editor_content = document.getElementById("content")
  }

  update() {
    if (this.templateIdTarget.value) {
      fetch(`/page_templates/${this.templateIdTarget.value}/json`)
            .then((response) => response.json())
            .then((data) => this.update_editor(data.template))
    } else {
      this.update_editor("{\"blocks\": []}")
    }
  }

  update_editor(data) {
    this.dispatch("update", { detail: { content: data } })
  }
}
