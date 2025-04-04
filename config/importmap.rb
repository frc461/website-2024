# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript"
pin "bootstrap", to: "bootstrap.min.js"
pin "@editorjs/editorjs", to: "@editorjs--editorjs.js" # @2.30.6
pin "@editorjs/attaches", to: "@editorjs--attaches.js" # @1.3.0
pin "@editorjs/delimiter", to: "@editorjs--delimiter.js" # @1.4.2
pin "@editorjs/header", to: "@editorjs--header.js" # @2.8.7
pin "@editorjs/image", to: "@editorjs--image.js" # @2.9.3
pin "@editorjs/paragraph", to: "@editorjs--paragraph.js" # @2.11.6
pin "@editorjs/quote", to: "@editorjs--quote.js" # @2.7.2
pin "@editorjs/link", to: "@editorjs--link.js" # @2.6.2
pin "@editorjs/table", to: "@editorjs--table.js" # @2.4.1
pin "@editorjs/underline", to: "@editorjs--underline.js" # @1.1.0
pin "@editorjs/nested-list", to: "@editorjs--nested-list.js" # @1.4.3
pin "editorjs-alert" # @1.1.4
pin "@editorjs/embed", to: "@editorjs--embed.js" # @2.7.6
