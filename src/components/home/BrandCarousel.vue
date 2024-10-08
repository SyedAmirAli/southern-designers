<template>
    <div class="container py-5">
        <center-breadcrumb
            :name="intro.name"
            :title="intro.title"
            :summery="intro.summery" />

        <div class="card pt-4" v-if="Array.isArray(brands)">
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
                                    :src="asset(slotProps.data?.image)"
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

    const props = defineProps({
        brands: { type: [Array], default: [] },
        intro: { type: Object, default: { name: '', title: '', summery: '' } },
    });

    info('Brands', props.brands, 'ignore');

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
