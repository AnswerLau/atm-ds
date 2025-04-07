// using with vue-i18n in CDN
/*eslint-disable */
import Vue from 'vue';
const isServer = Vue.prototype.$isServer;

export default function (lang) {
    if (!isServer) {
        if (typeof window.atmDs !== 'undefined') {
            if (!('langs' in atmDs)) {
                atmDs.langs = {};
            }
            atmDs.langs[lang.i.locale] = lang;
        }
    }
};
/*eslint-enable */