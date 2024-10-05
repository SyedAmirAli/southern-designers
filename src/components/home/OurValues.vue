<template>
    <div class="container">
        <div class="flex flex-col items-center justify-center">
            <h1 class="text-4xl font-semibold pb-4">
                Our Values <span class="px-2 text-primary">Reviews</span>
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

        <div class="w-full flex flex-wrap gap-3 justify-between py-5 mt-2">
            <div
                class="w-full lg:w-[32.75%] relative bg-white group"
                v-for="(service, index) in services"
                :key="index">
                <figure
                    v-if="service.image"
                    class="image-figure before:content-[''] before:block relative w-full before:pt-[100%] overflow-hidden">
                    <img
                        :src="service.image"
                        :alt="service.title"
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
                                    service.title
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

                <!-- <div class="absolute right-0 top-0 px-6 py-1 bg-primary">
                    <span>{{ service.rating }}</span>
                </div> -->
            </div>
        </div>
    </div>
</template>

<script setup>
    defineProps({ services: { type: [Array, undefined], required: true } });
</script>
