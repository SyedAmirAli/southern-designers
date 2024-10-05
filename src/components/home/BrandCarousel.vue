<template>
    <div class="container py-5">
        <div class="flex flex-col items-center justify-center">
            <h1 class="text-4xl font-semibold py-4">
                Our Values <span class="px-2 text-primary">Brands</span>
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

        <div class="card pt-4">
            <Carousel
                :value="brands"
                :numVisible="5"
                :numScroll="1"
                :responsiveOptions="responsiveOptions"
                circular
                :autoplayInterval="3000"
                showIndicators>
                <template #item="slotProps">
                    <div
                        class="border-surface-200 dark:border-surface-700 rounded m-2 p-4">
                        <div class="mb-4">
                            <div class="relative mx-auto">
                                <img
                                    :src="slotProps.data?.image"
                                    :alt="slotProps.data?.title"
                                    class="w-full rounded" />
                            </div>
                        </div>
                    </div>
                </template>
            </Carousel>
        </div>
    </div>
</template>

<script setup>
    import { ref } from 'vue';
    import Carousel from 'primevue/carousel';

    const brands = ref([
        { title: '', image: '/images/client-1.png' },
        { title: '', image: '/images/client-2.png' },
        { title: '', image: '/images/client-3.png' },
        { title: '', image: '/images/client-4.png' },
        { title: '', image: '/images/client-5.png' },
        { title: '', image: '/images/client-6.png' },
        { title: '', image: '/images/client-9.png' },
    ]);

    const responsiveOptions = ref([
        {
            breakpoint: '1600px',
            numVisible: 5,
            numScroll: 1,
        },
        {
            breakpoint: '1199px',
            numVisible: 5,
            numScroll: 1,
        },
        {
            breakpoint: '767px',
            numVisible: 3,
            numScroll: 1,
        },
        {
            breakpoint: '575px',
            numVisible: 2,
            numScroll: 1,
        },
    ]);
</script>
