<template>
    <div class="container">
        <center-breadcrumb
            :name="intro.name"
            :title="intro.title"
            :summery="intro.summery" />

        <div class="w-full flex flex-wrap sm:gap-3 justify-between py-5 mt-2">
            <div
                class="w-full lg:w-[calc(50%_-_12px)] xl:w-[calc(33.33%_-_12px)] relative bg-white group"
                v-for="(service, index) in services"
                :key="index">
                <figure
                    v-if="service.image"
                    class="image-figure before:content-[''] before:block relative w-full before:pt-[100%] overflow-hidden">
                    <img
                        :src="asset(service.image)"
                        :alt="service.name"
                        class="w-full absolute inset-0 h-full object-cover group-hover:scale-105 duration-500" />
                </figure>

                <div
                    class="absolute bottom-0 left-0 p-10 h-full inset-0 bg-gradient-to-t from-slate-700 group-hover:from-primary via-transparent to-transparent w-full duration-500">
                    <div class="w-full h-full flex items-end">
                        <div>
                            <span
                                v-html="service.icon"
                                class="text-5xl text-white"></span>
                            <h1
                                class="text-4xl font-semibold text-white pt-2 flex w-full justify-between items-center">
                                <span class="break-all block">{{
                                    service.name
                                }}</span>
                                <span class="break-all block">
                                    <span class="text-xl">
                                        {{ service.rating }}
                                    </span>
                                    <span class="text-2xl pl-2">
                                        <i class="fa-solid fa-star"></i>
                                    </span>
                                </span>
                            </h1>

                            <p
                                class="text-white leading-5 pt-2 h-0 overflow-hidden group-hover:h-28 duration-500">
                                {{ service.summery }}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    defineProps({
        services: { type: [Array, undefined], required: true },
        intro: { type: Object, default: { name: '', title: '', summery: '' } },
    });
</script>
