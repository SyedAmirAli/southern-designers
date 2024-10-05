import './assets/main.css';

import { createApp } from 'vue';
import { createPinia } from 'pinia';

import App from './App.vue';
import router from './router';
import PrimeVue from 'primevue/config';

const app = createApp(App);

window.info = info;
app.config.globalProperties.info = info;
app.config.globalProperties.asset = window.asset;
app.config.globalProperties.route = window.route;
app.config.globalProperties.mainUrl = window.mainUrl;

app.use(createPinia());
app.use(router);
app.use(PrimeVue);

app.mount('#app');

function info(...args) {
    if (args.includes('ignore')) return null;
    if (args.includes('ignored')) return console.log('console log ignored');

    if (import.meta.env.MODE === 'development') {
        if (args.includes('chain')) {
            args.splice(args.indexOf('chain'), 1);
            args.forEach((arg) => console.log(arg));
            return null;
        }

        if (args.length <= 1) {
            console.log(args[0]);
        } else console.log(args);

        return null;
    }

    return null;
}
