<template>
    <div class="container">
        <center-breadcrumb
            :name="intro.name"
            :title="intro.title"
            :summery="intro.summery" />

        <div class="w-full flex flex-wrap gap-6 py-5">
            <div
                class="w-full lg:w-[31%] relative p-5 bg-white rounded-xl group overflow-hidden"
                v-for="(service, index) in services"
                :key="index">
                <figure
                    v-if="service.image"
                    class="image-figure before:content-[''] before:block relative w-full before:pt-[100%] overflow-hidden">
                    <img
                        :src="asset(service.image)"
                        :alt="service.name"
                        class="w-full rounded-md absolute inset-0 h-full object-cover group-hover:scale-105 duration-500" />
                </figure>

                <div
                    class="absolute bottom-0 left-0 p-10 h-full inset-0 bg-gradient-to-t from-slate-700 group-hover:from-primary via-transparent to-transparent w-full duration-500">
                    <div class="w-full h-full flex items-end">
                        <div>
                            <span
                                v-html="service.icon"
                                class="text-5xl text-white"></span>
                            <h1 class="text-4xl font-semibold text-white pt-2">
                                {{ service.name }}
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
