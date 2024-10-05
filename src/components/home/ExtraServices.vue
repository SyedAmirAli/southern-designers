<template>
    <div class="container pb-5 lg:py-10">
        <div class="flex flex-col items-center justify-center py-6">
            <h1 class="text-4xl font-semibold pb-4">
                Others Services
                <span class="px-2 text-primary">Southern Designers</span>
            </h1>
            <p class="max-w-[75%] w-full text-slate-600 leading-6 text-center">
                We provide integrated and customized solutions to global
                retailers and brands. We are an ethical and entrepreneurial
                company with a strong sustainability focus. With our keen design
                sense, extensive industry experience and adoption of the latest
                techniques and technologies, we are enabling the fashion
                industry around the world catering to the fast-evolving tastes
                and preferences of consumers Sourcing.
            </p>
        </div>

        <div class="flex flex-wrap w-full gap-6 py-10 justify-center">
            <div
                v-for="service in services"
                :key="service.id"
                class="w-full lg:w-[48%] xl:w-[31%] p-6 border border-solid border-slate-300 bg-white relative rounded-xl">
                <div>
                    <h2 class="text-xl font-medium">{{ service.title }}</h2>
                    <p class="text-justify leading-6 py-6">
                        {{ service.description }}
                    </p>
                    <a :href="service.btn_url" class="mt-5 block rounded-md">
                        <button
                            class="flex gap-3 bg-primary text-white px-5 py-2 font-bold capitalize tracking-wide duration-300 hover:tracking-wider rounded hover:bg-black">
                            <span>{{ service.btn_title }}</span>
                            <span v-html="service.btn_icon"></span>
                        </button>
                    </a>
                </div>
                <div
                    class="absolute bottom-0 text-7xl pr-6 pb-6 text-slate-300 right-0">
                    <span v-html="service.icon"></span>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    defineProps({ services: { type: [Array, undefined], required: true } });
</script>

<style scoped></style>
