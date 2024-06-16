import { Controller } from "@hotwired/stimulus";
import EditorJS from "@editorjs/editorjs";
import Header from "@editorjs/header";
import List from "@editorjs/list";
import CodeTool from "@editorjs/code";
import Paragraph from "@editorjs/paragraph";
// Connects to data-controller="editor"
export default class extends Controller {
  static targets = ["blog_content"];
  connect() {
    console.log("THis is editor controller");
    const initialContent = this.getInitialContent();
    this.contentEditor = new EditorJS({
      holder: this.blog_contentTarget,
      data: initialContent,
      tools: {
        header: {
          class: Header,
        },
        list: {
          class: List,
        },
        paragraph: {
          class: Paragraph,
          config: {
            inlineToolbar: true,
          }
        },
        code: CodeTool,
      },
    });
    this.element.addEventListener("submit", this.submit.bind(this));
  }

  getInitialContent() {
    const hiddenContentField = document.getElementById("blog_content_hidden");
    if(hiddenContentField && hiddenContentField.value) { 
      return JSON.parse(hiddenContentField.value);
    }
    return {};
  }

  async submit(event) {
    event.preventDefault();
    const content = await this.contentEditor.save();
    const articleForm = this.element;

    const hiddenInput = document.getElementById("blog_content_hidden");
    hiddenInput.value = JSON.stringify(content);

    articleForm.submit();
  }
}
