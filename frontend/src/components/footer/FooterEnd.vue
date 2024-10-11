<template>
    <div
        class="bg-slate-900 border-t border-solid border-slate-700 w-full flex items-center justify-center">
        <div
            class="container flex flex-col gap-2 md:gap-0 md:flex-row py-4 items-center justify-between">
            <div class="flex flex-col sm:flex-row items-center justify-center">
                <p class="font-medium text-slate-400">
                    {{ settings?.copyright_title?.one }}
                    <b class="text-lg text-primary italic px-1.5">
                        {{ new Date().getFullYear() }}
                    </b>
                    <router-link
                        class="px-1 font-bold text-slate-300 hover:underline hover:text-primary hover:tracking-wide duration-500"
                        :target="settings?.copyright?.target || '_blank'"
                        :to="settings?.copyright?.url || '#'">
                        {{ settings?.copyright?.title }}
                    </router-link>
                    <span>{{ settings?.copyright_title?.two }}</span>
                </p>
            </div>
            <div class="flex gap-2">
                <div
                    v-for="(media, index) in [
                        settings?.facebook,
                        settings?.youtube,
                        settings?.twitter,
                        settings?.linkedin,
                        settings?.instagram,
                    ]"
                    :key="index">
                    <router-link
                        v-if="media?.icon || media?.icon !== 'null'"
                        class="block px-2.5 py-1 duration-500 bg-white text-primary border border-solid border-primary rounded-md hover:bg-primary text-lg hover:text-white"
                        :target="media?.target || '_blank'"
                        :to="media?.url || '#'">
                        <span v-html="media?.icon"> </span>
                    </router-link>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    import { inject } from 'vue';

    const settings = inject('settings');
    info('FooterEnd.vue', settings.value, 'ignore');
</script>
