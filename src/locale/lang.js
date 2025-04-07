// using with vue-i18n in CDN
/*eslint-disable */
import Vue from 'vue';
const isServer = Vue.prototype.$isServer;

export default function (lang) {
    if (!isServer) {
        if (typeof window.atm-ds !== 'undefined') {
            if (!('langs' in atm-ds)) {
                atm-ds.langs = {};
            }
            atm-ds.langs[lang.i.locale] = lang;
        }
    }
};
/*eslint-enable */