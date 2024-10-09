<script setup>
    import BrandCarousel from '@/components/home/BrandCarousel.vue';
    import ContactForm from '@/components/home/ContactForm.vue';
    import ExtraServices from '@/components/home/ExtraServices.vue';
    import Intro from '@/components/home/Intro.vue';
    import MainServices from '@/components/home/MainServices.vue';
    import OurValues from '@/components/home/OurValues.vue';
    import PopularServices from '@/components/home/PopularServices.vue';
    import ProductShowcase from '@/components/home/ProductShowcase.vue';
    import ServicesCounter from '@/components/home/ServicesCounter.vue';
    import useVueAxiosQuery from '@/utils/useVueAxiosQuery';
    import { onMounted, ref, watch } from 'vue';

    const home = useVueAxiosQuery({ endpoint: '/homepage-items' });
    const brands = ref([]);
    const reviews = ref([]);
    const extraServices = ref([]);
    const featuredProducts = ref([]);
    const servicesCounters = ref([]);
    const popularServices = ref([]);
    const mainServices = ref([]);
    const utilities = ref({});
    const introUtility = ref({ heading: '', title: '', texts: [], video: '' });

    onMounted(async function () {
        const data = await home.fetchWithAxios();
        info(data?.utilities);
    });

    watch(
        () => home.state.data,
        (data) => {
            if (data) {
                brands.value = data?.brands;
                reviews.value = data?.reviews;
                extraServices.value = data?.othersServices;
                featuredProducts.value = data?.featuredProducts;
                servicesCounters.value = data?.servicesCounters;
                popularServices.value = data?.primaryServices;
                mainServices.value = data?.servicesProducts;
                utilities.value = data?.utilities;

                introUtility.value.heading =
                    data?.utilities?.primary_video_title;
                introUtility.value.title =
                    data?.utilities?.secondary_video_title;
                introUtility.value.texts =
                    data?.utilities?.fancy_texts?.split(',');
                introUtility.value.video = data?.utilities?.video;
            }

            info({ utilities: data?.utilities });
        },
        { immediate: true }
    );
</script>

<template>
    <loading v-if="home.state?.isLoading" />
    <main
        v-else
        class="w-full bg-white bg-gradient-to-tr from-primary/10 to-purple-300/10 via-pink-300/10">
        <Intro :utility="introUtility" />

        <article class="flex flex-col items-center justify-center py-10">
            <!-- Main Services -->
            <MainServices
                :services="mainServices"
                :intro="utilities?.main_services" />

            <!-- Popular Services -->
            <PopularServices
                :services="popularServices"
                :intro="utilities?.primary_services" />

            <!-- Services Counter -->
            <ServicesCounter
                :services="servicesCounters"
                :intro="utilities?.counter_services" />

            <!-- Extra Services -->
            <ExtraServices
                :services="extraServices"
                :intro="utilities?.counter_services" />

            <!-- Client Reviews / Our Values -->
            <OurValues :services="reviews" :intro="utilities?.reviews" />

            <!-- Showcase Products -->
            <ProductShowcase
                :products="featuredProducts"
                :intro="utilities?.featured_products" />

            <!-- Brands Carousel  -->
            <BrandCarousel :brands="brands" :intro="utilities?.brands" />

            <!-- Contact Form -->
            <ContactForm :intro="utilities?.contact" />
        </article>
    </main>
</template>
