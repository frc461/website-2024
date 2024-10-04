export class Card {
    static get toolbox() {
        return {
            title: "Card",
            icon: '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24"><path stroke="currentColor" stroke-width="2" d="M5 10H19"/><rect width="14" height="14" x="5" y="5" stroke="currentColor" stroke-width="2" rx="4"/></svg>'
        }
    }

    constructor({data}){
        this.data = {
            header: data.header ? data.header : '',
            body: data.body ? data.body : '',
            footer: data.footer ? data.footer : '',
            hasHeader: data.hasHeader ? true : false,
            hasFooter: data.hasFooter ? true : false,
        };
        this.settings = [
            {
                name: 'hasHeader',
                icon: `<svg width="24" height="24" fill="none" version="1.1" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g transform="matrix(1,0,0,-1,0,24)" fill="none" stop-color="#000000" stroke="currentColor" stroke-width="1.9994" style="font-variation-settings:normal"><path d="m3.0049 15.649h17.995" stop-color="#000000"/><rect x="3" y="4" width="18" height="16" rx="4" stop-color="#000000"/></g></svg>`
            },
            {
                name: 'hasFooter',
                icon: `<svg width="24" height="24" fill="none" version="1.1" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g transform="matrix(1,0,0,-1,0,24)" fill="none" stop-color="#000000" stroke="currentColor" stroke-width="1.9994" style="font-variation-settings:normal"><path d="m3.0049 8.351h17.995" stop-color="#000000"/><rect transform="scale(1,-1)" x="3" y="-20" width="18" height="16" rx="4" stop-color="#000000"/></g></svg>`
            }
        ];
        this.settingNames = {
            "hasHeader": "Header",
            "hasFooter": "Footer",
        };
        this.card = undefined;
    }

    render() {
        this.card = document.createElement("div");
        this.card.classList.add("card");

        let parts = Array(3).fill().map(() => {
            let elem = document.createElement("div");
            elem.style.outline = "none";
            elem.contentEditable = true;
            return elem;
        });

        parts[0].classList.add("card-header");
        parts[1].classList.add("card-body");
        parts[2].classList.add("card-footer");

        parts[0].innerText = this.data.header;
        parts[1].innerText = this.data.body;
        parts[2].innerText = this.data.footer;

        parts.forEach(part => this.card.appendChild(part));

        this._refreshRender();

        return this.card;
    }

    save(blockContent) {
        let header = this.card.querySelector(".card-header");
        let body = blockContent.querySelector(".card-body");
        let footer = this.card.querySelector(".card-footer");
        return Object.assign(this.data, {
            header: header.innerText,
            body: body.innerText,
            footer: footer.innerText,
        })
    }

    validate(savedData) {
        return true;
    }

    renderSettings() {
        return this.settings.map(setting => ({
            icon: setting.icon,
            label: this.settingNames[setting.name],
            onActivate: () => this._toggleSetting(setting.name),
            isActive: this.data[setting.name],
            closeOnActivate: true,
        }));
    }

    _refreshRender() {
        let header = this.card.querySelector(".card-header");
        let footer = this.card.querySelector(".card-footer");
        header.contentEditable = this.data.hasHeader;
        footer.contentEditable = this.data.hasFooter;
        header.classList.toggle("d-none", !this.data.hasHeader);
        footer.classList.toggle("d-none", !this.data.hasFooter);
    }

    _toggleSetting(setting) {
        this.data[setting] = !this.data[setting];
        this._refreshRender();
    }
}