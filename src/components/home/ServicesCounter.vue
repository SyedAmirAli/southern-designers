<template>
    <!-- <center-breadcrumb :name="intro.name" :title="intro.title" :summery="intro.summery" /> -->
    <div
        class="w-full flex items-center justify-center -mt-28 lg:-mt-40 px-4 lg:px-0 pb-4">
        <div class="container flex flex-wrap w-full gap-8">
            <div
                class="w-full lg:w-[calc(25%_-_32px)] sm:w-[calc(50%_-_32px)]"
                v-for="(service, index) in services"
                :key="index">
                <div class="w-full">
                    <div
                        class="p-10 bg-primary w-full flex flex-col items-center justify-center rounded-xl">
                        <span
                            class="text-7xl text-slate-100 p-2 mb-3"
                            v-html="service.icon">
                        </span>
                        <div class="relative py-3">
                            <h1
                                class="text-5xl font-extrabold font-comfortaa text-slate-50 relative">
                                <span>{{ service.value }}</span>
                                <span
                                    class="absolute block text-slate-100 -top-8 -right-7 text-4xl font-bold">
                                    +
                                </span>
                            </h1>
                        </div>
                        <p class="text-slate-300 font-semibold text-xl">
                            {{ service.name }}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    defineProps({
        services: { type: Array, default: [] },
        intro: { type: Object, default: { name: '', title: '', summery: '' } },
    });
</script>
