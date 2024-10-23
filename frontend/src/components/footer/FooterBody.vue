<template>
    <div class="w-full flex items-center justify-center pt-6">
        <div class="container pb-10">
            <div class="w-full flex flex-col 2xl:flex-row gap-y-4 sm:gap-y-10">
                <div
                    class="w-full flex flex-col md:flex-row gap-y-4 sm:gap-y-10">
                    <div class="w-full">
                        <figure class="w-full">
                            <img
                                :src="asset(settings?.footer_image)"
                                :alt="settings?.app_name"
                                class="w-32" />
                        </figure>
                        <p class="py-3 px-1 text-justify text-lg font-medium">
                            {{ settings?.footer_description }}
                        </p>
                    </div>
                    <div class="w-full md:px-12">
                        <h1 class="text-xl font-bold">
                            {{ settings?.footer_title_1 }}
                        </h1>
                        <ul class="p-2 mt-2">
                            <li
                                v-for="(item, index) in menuItems"
                                :key="index"
                                class="flex gap-3 items-center justify-start my-2">
                                <i
                                    class="fa-solid fa-angles-right text-primary"
                                    aria-hidden="true"></i>
                                <router-link
                                    :to="item.url || '#'"
                                    :target="item.target || 'target'"
                                    class="duration-500 hover:ml-3 hover:text-primary font-medium hover:underline text-lg">
                                    {{ item.title }}
                                </router-link>
                            </li>
                        </ul>
                    </div>
                </div>
                <div
                    class="w-full flex flex-col md:flex-row gap-y-4 sm:gap-y-10">
                    <div class="w-full md:px-12">
                        <h1 class="text-xl font-bold">
                            {{ settings?.footer_title_2 }}
                        </h1>
                        <div
                            class="w-full"
                            v-for="(factory, index) in [
                                settings?.factory_address_1,
                                settings?.factory_address_2,
                                settings?.factory_address_3,
                                settings?.factory_address_4,
                            ]"
                            :key="index">
                            <div class="p-3 mt-2" v-if="factory?.location">
                                <p>
                                    <i
                                        v-html="factory?.icon"
                                        aria-hidden="true"></i>
                                    <span
                                        class="font-bold text-sm text-slate-400 px-2"
                                        >{{ factory?.title }}</span
                                    >
                                </p>
                                <p class="pl-2">
                                    <a
                                        target="_blank"
                                        :to="factory?.url || '#'"
                                        :target="factory?.target || 'target'"
                                        class="font-medium text-lg mt-1 leading-6 duration-300 hover:text-primary hover:underline block">
                                        {{ factory?.location }}
                                    </a>
                                    <a
                                        target="_blank"
                                        :to="
                                            'mailto:' +
                                            (factory?.email ||
                                                'example@gmail.com')
                                        "
                                        class="font-mono text-lg mt-1 leading-6 duration-300 hover:text-primary hover:underline block">
                                        {{ factory?.email }}
                                    </a>
                                    <a
                                        target="_blank"
                                        :href="
                                            'tel:' + (factory?.phone || '+8801')
                                        "
                                        class="font-mono text-lg mt-1 leading-6 duration-300 hover:text-primary hover:underline block">
                                        {{ factory?.phone }}
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="w-full">
                        <h1 class="text-xl font-bold">
                            {{ settings?.footer_title_3 }}
                        </h1>
                        <div class="px-3 py-1">
                            <div class="flex gap-4">
                                <figure
                                    class="text-primary text-2xl"
                                    v-html="
                                        settings?.main_address_icon
                                    "></figure>
                                <span class="font-bold text-lg text-slate-400">
                                    {{ settings?.main_address_name }}
                                </span>
                            </div>
                        </div>
                        <div class="px-3 py-1">
                            <div class="flex gap-4">
                                <figure
                                    class="text-primary text-2xl"
                                    v-html="settings?.main_email_icon"></figure>
                                <span class="font-bold text-lg text-slate-400">
                                    {{ settings?.main_email_name }}
                                </span>
                            </div>
                        </div>
                        <div class="px-3 py-1">
                            <div class="flex gap-4">
                                <figure
                                    class="text-primary text-2xl"
                                    v-html="settings?.main_phone_icon"></figure>
                                <span class="font-bold text-lg text-slate-400">
                                    {{ settings?.main_phone_name }}
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    const menuItems = [
        {
            id: 1,
            title: 'Home',
            url: '/',
            target: '_self',
        },
        {
            id: 7,
            title: 'About Us',
            url: '/about',
            target: '_self',
        },
        {
            id: 3,
            title: 'Products',
            url: '#',
            target: '_self',
        },
        {
            id: 2,
            title: 'Sustainability',
            url: '/sustainability',
            target: '_self',
        },
        {
            id: 6,
            title: 'Our Memories',
            url: '/media',
            target: '_self',
        },
        {
            id: 5,
            title: 'Contact Us',
            url: '/contact',
            target: '_self',
        },
    ];

    import { inject } from 'vue';

    const settings = inject('settings');
</script>
