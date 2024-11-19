import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="template"
export default class extends Controller {
  static targets = ["templateId"]

  connect() {
    this.editor_content = document.getElementById("content")
  }

  update() {
    if (isNaN(Number(this.templateIdTarget.value))) {
      this.update_editor("{\"blocks\":[]}", false, true)
      return
    }

    if (this.templateIdTarget.value) {
      fetch(`/page_templates/${this.templateIdTarget.value}/json`)
            .then((response) => response.json())
            .then((data) => this.update_editor(data.template, !this.templateIdTarget[0].value, false))
    } else {
      this.update_editor("{\"blocks\": []}", false, Boolean(this.templateIdTarget[0].value))
    }
  }

  update_editor(data, save_original, load_original) {
    this.dispatch("update", { detail: { content: data, save_original: save_original, load_original: load_original } })
    if (!this.templateIdTarget[0].value) {
      this.templateIdTarget[0].value = "og"
      this.templateIdTarget[0].label = "<Original Content>"
    }
  }
}
