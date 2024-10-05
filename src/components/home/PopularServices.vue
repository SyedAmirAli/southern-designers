<template>
    <div
        class="bg-secondary bg-gradient-to-tr from-blue-300/10 to-pink-300/10 via-purple-300/10 w-full flex items-center justify-center pb-20 my-6">
        <div class="container py-10 lg:py-16">
            <h3 class="font-bold text-lg text-primary text-center uppercase">
                Popular services
            </h3>
            <h1
                class="text-center text-3xl capitalize text-slate-200 font-medium mt-3">
                Our Professional Solutions For Business
            </h1>
            <div
                class="w-full flex flex-wrap justify-between items-center mt-10 lg:my-16 gap-y-10">
                <div
                    v-for="service in services"
                    :key="service.id"
                    class="w-full xl:w-[23%] sm:w-[46%] bg-slate-900 p-8 flex flex-col items-center justify-center rounded-xl border border-solid border-slate-600 text-slate-100">
                    <figure
                        class="image-figure before:content-[''] before:block relative w-full min-h-48">
                        <img
                            :src="service.image"
                            :alt="service.name"
                            class="w-full rounded-md absolute inset-0 h-full object-cover" />
                    </figure>
                    <h2 class="mt-4 font-semibold text-lg capitalize">
                        {{ service.name }}
                    </h2>
                    <p class="py-3 leading-5 text-center text-slate-300">
                        {{ service.title }}
                    </p>
                    <a
                        :href="service.btn_url"
                        :target="service.btn_target"
                        class="text-center bg-slate-700 uppercase font-semibold px-6 rounded border border-primary/50 duration-500 hover:tracking-wide hover:bg-primary py-2 mt-2">
                        <span>{{ service.btn_title }}</span>
                        <span v-html="service.btn_icon"></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    defineProps({ services: { type: [Array, undefined], required: true } });
</script>
