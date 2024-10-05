<template>
    <div class="w-full flex items-center justify-center">
        <div class="container mt-6">
            <div class="flex flex-col md:flex-row items-center justify-between">
                <div class="mb-4 md:mb-0">
                    <h2 class="font-bold text-xl text-primary">
                        <span class="tracking-[-4px] pr-4">----</span>
                        <span>{{ heading }}</span>
                    </h2>
                    <h1 class="text-2xl md:text-4xl font-bold mt-4">
                        {{ title }}
                    </h1>
                </div>
            </div>

            <div
                class="w-full flex flex-wrap items-center justify-center xl:justify-between mt-10 gap-10 xl:gap-0">
                <div
                    class="w-full xl:w-[32%] sm:w-[46%] gap-3 bg-slate-50 flex flex-col items-center justify-center py-10 relative group rounded-3xl border border-solid border-slate-200"
                    v-for="(item, index) in about"
                    :key="index"
                    :class="[index === 1 ? 'active' : '']">
                    <div
                        class="opacity-0 group-hover:opacity-100 group-[.active]:opacity-100 cursor-pointer duration-300 absolute left-0 bottom-0 w-full h-[70%] rounded-3xl bg-primary"></div>

                    <!-- <image-figure :src="item.image" /> -->
                    <figure class="size-80 relative">
                        <img
                            :src="assetUrl(item.image)"
                            alt="Sponsor A Child"
                            class="w-full h-full" />
                    </figure>
                    <div
                        class="w-full flex flex-col items-center justify-center z-[5]">
                        <h2
                            class="mt-4 text-xl font-semibold text-center text-primary duration-300 group-hover:text-slate-50 group-[.active]:text-slate-50">
                            {{ item.name }}
                        </h2>
                        <h2
                            class="font-bold text-slate-600 mb-3 text-lg duration-300 group-hover:text-slate-300 group-[.active]:text-slate-300">
                            {{ item.title }}
                        </h2>
                        <p
                            class="text-slate-900 font-medium tracking-wide font-comfortaa duration-300 group-hover:text-slate-100 group-[.active]:text-slate-100">
                            {{ item.phone }}
                        </p>
                        <p
                            class="text-slate-900 font-medium tracking-wide font-comfortaa duration-300 group-hover:text-slate-100 group-[.active]:text-slate-100">
                            {{ item.email }}
                        </p>
                        <div class="flex gap-3 mt-5">
                            <p
                                v-for="(icon, index) in Object.keys(
                                    socialIcons
                                )"
                                :key="index">
                                <a
                                    :href="item[icon]"
                                    v-html="socialIcons[icon]"
                                    class="block text-xl group-hover:hover:bg-slate-50 group-hover:hover:text-primary bg-slate-200 py-2 px-3 rounded-full duration-500 hover:bg-primary hover:text-slate-100"></a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    const props = defineProps({
        about: {
            type: [Array, undefined],
            default: undefined, // Default value for array prop
        },
        title: {
            type: [String, undefined],
            default: undefined, // Default value for string prop
        },
        heading: {
            type: [String, undefined],
            default: undefined, // Default value for string prop
        },
    });

    const socialIcons = {
        facebook: '<i class="fa-brands fa-facebook"></i>',
        instagram: '<i class="fa-brands fa-instagram"></i>',
        twitter: '<i class="fa-brands fa-x-twitter"></i>',
        linkedin: '<i class="fa-brands fa-linkedin"></i>',
    };
</script>
