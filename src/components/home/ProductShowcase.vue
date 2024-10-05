<template>
    <div class="container py-5">
        <div class="flex flex-col items-center justify-center">
            <h1 class="text-4xl font-semibold py-4">
                Latest Featured <span class="px-2 text-primary">Products</span>
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

        <!-- Product Showcase -->
        <!-- class="w-full flex flex-wrap gap-4 items-center justify-center mt-10" -->
        <div class="pt-6">
            <Carousel
                :value="products"
                :numVisible="4"
                :numScroll="1"
                :responsiveOptions="responsiveOptions"
                circular
                :autoplayInterval="3000"
                showIndicators>
                <template #item="slotProps">
                    <!-- v-for="(item, index) in products" -->
                    <!-- :key="index" -->
                    <!-- :class="[index === 1 ? 'active' : '']"> -->
                    <div class="w-full px-2">
                        <div
                            class="w-full gap-3 bg-slate-50 flex flex-col items-center justify-center relative group rounded-xl border border-solid border-slate-200">
                            <div class="pr-2 pt-4 bg-white w-full h-full">
                                <figure
                                    v-if="slotProps.data?.image"
                                    class="image-figure before:content-[''] before:pt-[100%] before:block relative w-full">
                                    <img
                                        :src="slotProps.data?.image"
                                        :alt="slotProps.data?.image"
                                        class="w-full rounded-md absolute inset-0 h-full object-cover" />
                                </figure>
                            </div>

                            <div class="w-full py-3 px-5">
                                <h2
                                    class="text-2xl font-semibold text-slate-900 duration-300">
                                    {{ slotProps.data?.title }}
                                </h2>
                                <h2
                                    class="text-justify text-slate-600 mb-3 leading-6 py-1 text-lg duration-300">
                                    {{
                                        slotProps.data?.summery?.slice(0, 60) +
                                        '...'
                                    }}
                                </h2>

                                <router-link
                                    to="/product"
                                    class="font-bold text-primary/70 p-2 uppercase rounded duration-500 hover:text-primary hover:tracking-[0.01em]">
                                    <span>See More</span>
                                    <i class="fa-solid fa-arrow-right pl-3"></i>
                                </router-link>
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

    const products = ref([
        {
            title: 'Knit-1',
            image: '/images/knit-6.jpg',
            summery:
                'Beatae perferendis, ratione itaque fugiat recusandae. Praesentium rerum quam impedit molestiae ut laboriosam repellat deserunt?',
        },
        {
            title: 'Knit-2',
            image: '/images/knit-7.jpg',
            summery:
                'Beatae perferendis, ratione itaque fugiat recusandae. Praesentium rerum quam impedit molestiae ut laboriosam repellat deserunt?',
        },
        {
            title: 'Knit-3',
            image: '/images/knit-12.jpg',
            summery:
                'Beatae perferendis, ratione itaque fugiat recusandae. Praesentium rerum quam impedit molestiae ut laboriosam repellat deserunt?',
        },
        {
            title: 'Knit-4',
            image: '/images/knit-16.jpg',
            summery:
                'Beatae perferendis, ratione itaque fugiat recusandae. Praesentium rerum quam impedit molestiae ut laboriosam repellat deserunt?',
        },
        {
            title: 'Knit-4',
            image: '/images/knit-16.jpg',
            summery:
                'Beatae perferendis, ratione itaque fugiat recusandae. Praesentium rerum quam impedit molestiae ut laboriosam repellat deserunt?',
        },
        {
            title: 'Knit-4',
            image: '/images/knit-16.jpg',
            summery:
                'Beatae perferendis, ratione itaque fugiat recusandae. Praesentium rerum quam impedit molestiae ut laboriosam repellat deserunt?',
        },
        {
            title: 'Knit-4',
            image: '/images/knit-16.jpg',
            summery:
                'Beatae perferendis, ratione itaque fugiat recusandae. Praesentium rerum quam impedit molestiae ut laboriosam repellat deserunt?',
        },
    ]);

    const responsiveOptions = ref([
        {
            breakpoint: '1600px',
            numVisible: 4,
            numScroll: 1,
        },
        {
            breakpoint: '1199px',
            numVisible: 3,
            numScroll: 1,
        },
        {
            breakpoint: '767px',
            numVisible: 2,
            numScroll: 1,
        },
        {
            breakpoint: '575px',
            numVisible: 1,
            numScroll: 1,
        },
    ]);
</script>
