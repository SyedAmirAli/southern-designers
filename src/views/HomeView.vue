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
    import { reactive } from 'vue';

    const mainServices = reactive([
        {
            id: 1,
            image: '/images/knit-6.jpg',
            icon: '<i class="fa-brands fa-slack"></i>',
            title: 'Sourcing',
            summery:
                'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.',
        },
        {
            id: 2,
            image: '/images/knit-7.jpg',
            icon: '<i class="fa-solid fa-city"></i>',
            title: 'Manufacturing',
            summery:
                'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.',
        },
        {
            id: 3,
            image: '/images/knit-12.jpg',
            icon: '<i class="fa-brands fa-dropbox"></i>',
            title: 'SD Venture',
            summery:
                'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.',
        },
    ]);

    const popularServices = reactive([
        {
            id: 1,
            name: 'Garments',
            title: 'Sed perspicias unde omnis natus error volute',
            btn_title: 'learn more',
            btn_icon: '<i class="fa-solid fa-arrow-right pl-3"></i>',
            btn_url: '#',
            btn_target: '_blank',
            image: 'https://greenlifebd.ctpse.info/uploads/1727931892-rand-843473-----1.jpg',
        },
        {
            id: 2,
            name: 'Kniting',
            title: 'Sed perspicias unde omnis natus error volute',
            btn_title: 'learn more',
            btn_icon: '<i class="fa-solid fa-arrow-right pl-3"></i>',
            btn_url: '#',
            btn_target: '_blank',
            image: 'https://greenlifebd.ctpse.info/uploads/1727931892-rand-10377-----3.jpg',
        },
        {
            id: 3,
            name: 'Dyeing',
            title: 'Sed perspicias unde omnis natus error volute',
            btn_title: 'learn more',
            btn_icon: '<i class="fa-solid fa-arrow-right pl-3"></i>',
            btn_url: '#',
            btn_target: '_blank',
            image: 'https://greenlifebd.ctpse.info/uploads/1727931892-rand-406621-----2.jpg',
        },
        {
            id: 4,
            name: 'Embroidery',
            title: 'Sed perspicias unde omnis natus error volute',
            btn_title: 'learn more',
            btn_icon: '<i class="fa-solid fa-arrow-right pl-3"></i>',
            btn_url: '#',
            btn_target: '_blank',
            image: 'https://greenlifebd.ctpse.info/uploads/1727931892-rand-122938-----4.jpg',
        },
    ]);

    const extraServices = reactive([
        {
            id: 1,
            title: 'Sign & Paint VIP Program',
            description:
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores dignissimos, iste ipsum fugit nulla soluta eveniet magni, repudiandae.',
            icon: "<i class='fa-solid fa-heart-circle-bolt'></i>",
            btn_title: 'learn more',
            btn_icon: "<i class='fa-solid fa-arrow-right'></i>",
            btn_url: '#',
        },
        {
            id: 2,
            title: 'Quick & Super fast delivery',
            description:
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores dignissimos, iste ipsum fugit nulla soluta eveniet magni, repudiandae.',
            btn_icon: "<i class='fa-brands fa-canadian-maple-leaf'></i>",
            btn_title: 'Explore now',
            icon: "<i class='fa-solid fa-truck-moving'></i>",
            btn_url: '#',
        },
        {
            id: 3,
            title: 'Awareness & Support',
            description:
                'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores dignissimos, iste ipsum fugit nulla soluta eveniet magni, repudiandae.',
            btn_icon: "<i class='fa-solid fa-hand'></i>",
            btn_title: 'support for help',
            icon: "<i class='fa-solid fa-hand-holding-hand'></i>",
            btn_url: '#',
        },
    ]);

    const reviews = reactive([
        {
            id: 1,
            rating: 5,
            image: '/images/client-review-1.jpg',
            icon: '<i class="fa-brands fa-slack"></i>',
            title: 'Sourcing',
            summery:
                'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.',
        },
        {
            id: 2,
            rating: 4.5,
            image: '/images/client-review-2.jpg',
            icon: '<i class="fa-solid fa-city"></i>',
            title: 'Manufacturing',
            summery:
                'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.',
        },
        {
            id: 3,
            rating: 3,
            image: '/images/client-review-3.jpg',
            icon: '<i class="fa-brands fa-dropbox"></i>',
            title: 'SD Venture',
            summery:
                'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.',
        },
        {
            id: 1,
            rating: 2.9,
            image: '/images/client-review-4.jpg',
            icon: '<i class="fa-brands fa-slack"></i>',
            title: 'Sourcing',
            summery:
                'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.',
        },
        {
            id: 2,
            rating: 4,
            image: '/images/client-review-5.jpg',
            icon: '<i class="fa-solid fa-city"></i>',
            title: 'Manufacturing',
            summery:
                'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.',
        },
        {
            id: 3,
            rating: 3.1,
            image: '/images/client-review-6.jpg',
            icon: '<i class="fa-brands fa-dropbox"></i>',
            title: 'SD Venture',
            summery:
                'We have a created our own manufacturing capacities spread across three countries – Bangladesh, Sri Lanka and India, where we have as many as 130 production lines. Our customized services, quality-focused approach and compliance has earned us customer trust and loyalty.',
        },
    ]);
</script>

<template>
    <main
        class="w-full bg-white bg-gradient-to-tr from-primary/10 to-purple-300/10 via-pink-300/10">
        <Intro />

        <article class="flex flex-col items-center justify-center py-10">
            <!-- Main Services -->
            <MainServices :services="mainServices" />

            <!-- Popular Services -->
            <PopularServices :services="popularServices" />

            <!-- Services Counter -->
            <ServicesCounter />

            <!-- Extra Services -->
            <ExtraServices :services="extraServices" />

            <!-- Client Reviews / Our Values -->
            <OurValues :services="reviews" />

            <!-- Showcase Products -->
            <ProductShowcase />

            <!-- Brands Carousel -->
            <BrandCarousel />

            <!-- Contact Form -->
            <ContactForm />
        </article>
    </main>
</template>
