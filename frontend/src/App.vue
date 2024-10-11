<script setup>
    import { RouterView } from 'vue-router';
    import Header from '@/components/header/index.vue';
    import Footer from '@/components/footer/index.vue';
    import useVueAxiosQuery from './utils/useVueAxiosQuery';
    import { onMounted, provide, ref, watch } from 'vue';
    import { computed } from 'vue';

    const app = useVueAxiosQuery({ endpoint: '/settings' });
    const settings = ref({});

    onMounted(async function () {
        const data = await app.fetchWithAxios();
        settings.value = data?.utilities;

        updateMeta(data?.utilities);
        info('App.vue', data?.utilities, 'ignore');
    });

    const reactiveSettings = computed(() => settings.value);

    // Provide the reactive value
    provide('settings', reactiveSettings);

    function updateMeta(data) {
        // Update document title
        if ('app_title' in data) {
            document.title = data.app_title;
        }

        // Update meta description
        if ('meta_description' in data) {
            let metaDescription = document.querySelector(
                'meta[name="description"]'
            );
            if (!metaDescription) {
                metaDescription = document.createElement('meta');
                metaDescription.name = 'description';
                document.head.appendChild(metaDescription);
            }
            metaDescription.content = data.meta_description;
        }

        // Update meta Title
        if ('meta_title' in data) {
            let metaTitle = document.querySelector('meta[name="title"]');
            if (!metaTitle) {
                metaTitle = document.createElement('meta');
                metaTitle.name = 'title';
                document.head.appendChild(metaTitle);
            }
            metaTitle.content = data.meta_title;
        }

        // Update meta keywords
        if ('meta_keywords' in data) {
            let metaKeywords = document.querySelector('meta[name="keywords"]');
            if (!metaKeywords) {
                metaKeywords = document.createElement('meta');
                metaKeywords.name = 'keywords';
                document.head.appendChild(metaKeywords);
            }
            metaKeywords.content = data.meta_keywords;
        }

        // Update app title in head (if any custom use case)
        if ('app_title' in data) {
            let metaAppTitle = document.querySelector('meta[name="app-title"]');
            if (!metaAppTitle) {
                metaAppTitle = document.createElement('meta');
                metaAppTitle.name = 'app-title';
                document.head.appendChild(metaAppTitle);
            }
            metaAppTitle.content = data.app_title;
        }

        // Update other meta tags (e.g., app_name)
        if ('app_name' in data) {
            let metaAppName = document.querySelector(
                'meta[name="application-name"]'
            );
            if (!metaAppName) {
                metaAppName = document.createElement('meta');
                metaAppName.name = 'application-name';
                document.head.appendChild(metaAppName);
            }
            metaAppName.content = data.app_name;
        }

        // Update favicon
        if ('app_favicon' in data) {
            let link = document.querySelector("link[rel~='icon']");
            if (!link) {
                link = document.createElement('link');
                link.rel = 'icon';
                document.head.appendChild();
            }
            link.href = asset(data.app_favicon);
        }
    }
</script>

<template>
    <Header />
    <RouterView />
    <Footer />
</template>

<style scoped></style>
