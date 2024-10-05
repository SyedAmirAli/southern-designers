<template>
    <div class="container">
        <div class="flex flex-col items-center justify-center py-6">
            <h1 class="text-4xl font-semibold pb-4">
                Your platform to the world
            </h1>
            <p class="max-w-[75%] w-full text-slate-600 leading-6 text-center">
                We provide integrated and customized solutions to global
                retailers and brands. We are an ethical and entrepreneurial
                company with a strong sustainability focus. With our keen design
                sense, extensive industry experience and adoption of the latest
                techniques and technologies, we are enabling the fashion
                industry around the world catering to the fast-evolving tastes
                and preferences of consumers Sourcing We enable our esteemed
                customers to source multiple across all products and categories
                through our partners in key markets. We provide them our market
                know-how, in- house design-led capabilities while we are able to
                manage the entire supply chain execution for our customers.
                Manufacturing We have a created our own manufacturing capacities
                spread across three countries – Bangladesh, Sri Lanka and India,
                where we have as many as 130 production lines. Our customized
                services, quality-focused approach and compliance has earned us
                customer trust and loyalty.
            </p>
        </div>

        <div class="w-full flex flex-wrap gap-6 py-5">
            <div
                class="w-full lg:w-[31%] relative p-5 bg-white rounded-xl group overflow-hidden"
                v-for="(service, index) in services"
                :key="index">
                <!-- <figure>
                                <img
                                    :src="service.image"
                                    :alt="service.title" 
                                    />
                            </figure> -->

                <figure
                    v-if="service.image"
                    class="image-figure before:content-[''] before:block relative w-full before:pt-[100%] overflow-hidden">
                    <img
                        :src="service.image"
                        :alt="service.title"
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
                                {{ service.title }}
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
    defineProps({ services: { type: [Array, undefined], required: true } });
</script>
