<template>
    <div class="container py-5">
        <center-breadcrumb
            :name="intro.name"
            :title="intro.title"
            :summery="intro.summery" />
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
                    <div class="w-full px-2">
                        <div
                            class="w-full gap-3 bg-slate-50 flex flex-col items-center justify-center relative group rounded-xl border border-solid border-slate-200">
                            <div class="pr-2 pt-4 bg-white w-full h-full">
                                <figure
                                    v-if="slotProps.data?.image"
                                    class="image-figure before:content-[''] before:pt-[100%] before:block relative w-full">
                                    <img
                                        :src="asset(slotProps.data?.image)"
                                        :alt="slotProps.data?.name"
                                        class="w-full rounded-md absolute inset-0 h-full object-cover" />
                                </figure>
                            </div>

                            <div class="w-full py-3 px-5">
                                <h2
                                    class="text-2xl font-semibold text-slate-900 duration-300">
                                    {{ slotProps.data?.name }}
                                </h2>
                                <p
                                    class="text-pretty text-slate-600 mb-3 lg:leading-6 py-1 hidden sm:block text-sm lg:text-lg duration-300">
                                    {{
                                        slotProps.data?.title?.slice(0, 60) +
                                        '...'
                                    }}
                                </p>

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

    defineProps({
        products: { type: Array, default: [] },
        intro: { type: Object, default: { name: '', title: '', summery: '' } },
    });

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
