(function(){try{if(typeof document<"u"){var e=document.createElement("style");e.appendChild(document.createTextNode('.ce-delimiter{line-height:1.6em;width:100%;text-align:center}.ce-delimiter:before{display:inline-block;content:"***";font-size:30px;line-height:65px;height:30px;letter-spacing:.2em}')),document.head.appendChild(e)}}catch(e){console.error("vite-plugin-css-injected-by-js",e)}})();const e='<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><line x1="6" x2="10" y1="12" y2="12" stroke="currentColor" stroke-linecap="round" stroke-width="2"/><line x1="14" x2="18" y1="12" y2="12" stroke="currentColor" stroke-linecap="round" stroke-width="2"/></svg>';
/**
 * Delimiter Block for the Editor.js.
 *
 * @author CodeX (team@ifmo.su)
 * @copyright CodeX 2018
 * @license The MIT License (MIT)
 * @version 2.0.0
 */class n{static get isReadOnlySupported(){return!0}static get contentless(){return!0}
/**
   * Render plugin`s main Element and fill it with saved data
   *
   * @param {{data: DelimiterData, config: object, api: object}}
   *   data — previously saved data
   *   config - user config for Tool
   *   api - Editor.js API
   */constructor({data:e,config:t,api:i}){this.api=i,this._CSS={block:this.api.styles.block,wrapper:"ce-delimiter"},this._element=this.drawView(),this.data=e}drawView(){let e=document.createElement("div");return e.classList.add(this._CSS.wrapper,this._CSS.block),e
/**
   * Return Tool's view
   * @returns {HTMLDivElement}
   * @public
   */}render(){return this._element}
/**
   * Extract Tool's data from the view
   * @param {HTMLDivElement} toolsContent - Paragraph tools rendered view
   * @returns {DelimiterData} - saved data
   * @public
   */save(e){return{}}static get toolbox(){return{icon:e,title:"Delimiter"}}static get pasteConfig(){return{tags:["HR"]}}
/**
   * On paste callback that is fired from Editor
   *
   * @param {PasteEvent} event - event with pasted data
   */onPaste(e){this.data={}}}export{n as default};

