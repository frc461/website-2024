import EditorJS from "@editorjs/editorjs"

export class NestedEditor {
    constructor(data, tools, minHeight) {
        this.tools = tools;
        this.editor = undefined;
        this.data = data ? data : {};
        this.minHeight = minHeight == undefined ? 50 : minHeight;
    }

    async _rerender() {
        if (this.editor) { this.editor.destroy() }

        this.wrapper.innerHTML = "";

        let editorElem = document.createElement("div");

        this.wrapper.appendChild(editorElem);

        let editor = new EditorJS({
            defaultBlock: "paragraph",
            holder: editorElem,
            tools: this.tools,
            data: this.data,
            readOnly: false,
            minHeight: this.minHeight,
        });

        this.editor = editor;
    }

    render() {
        this.wrapper = document.createElement("div");

        this.wrapper.addEventListener('paste', (event) => {
            event.stopPropagation();
        }, true);

        this.wrapper.addEventListener('keydown', (event) => {
            if (event.key === "Enter") {
                event.preventDefault();
                event.stopImmediatePropagation();
                event.stopPropagation();
            }
            if (event.key === "Tab") {
                event.preventDefault();
                event.stopImmediatePropagation();
            }
        });

        this._rerender();
        return this.wrapper;
    }

    async save() {
        this.data = await this.editor.save();
        return this.data;
    }
}
