<script setup>
    import FancyText from '@/components/home/FancyText.vue';
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
</script>

<template>
    <main
        class="w-full bg-white bg-gradient-to-tr from-primary/10 to-purple-300/10 via-pink-300/10">
        <div class="w-full relative">
            <video
                src="\videos\home-page-video-1.mp4"
                autoplay
                loop
                muted
                playsinline
                class="w-full h-auto object-cover max-h-[100vh]"></video>
            <div
                class="absolute left-0 top-0 w-full h-full flex flex-col items-center justify-center bg-black/10">
                <div class="container">
                    <div class="text-white">
                        <h2 class="text-6xl drop-shadow-2xl font-medium">
                            We believe in
                        </h2>
                        <h1 class="text-7xl font-bold py-3">
                            <FancyText />
                        </h1>
                        <h3 class="text-3xl pt-4">
                            Not at the cost of our world.
                        </h3>
                    </div>
                </div>
            </div>
        </div>

        <article class="flex flex-col items-center justify-center py-10">
            <!-- Main Services -->
            <div class="container">
                <div class="flex flex-col items-center justify-center py-6">
                    <h1 class="text-4xl font-semibold pb-4">
                        Your platform to the world
                    </h1>
                    <p
                        class="max-w-[75%] w-full text-slate-600 leading-6 text-center">
                        We provide integrated and customized solutions to global
                        retailers and brands. We are an ethical and
                        entrepreneurial company with a strong sustainability
                        focus. With our keen design sense, extensive industry
                        experience and adoption of the latest techniques and
                        technologies, we are enabling the fashion industry
                        around the world catering to the fast-evolving tastes
                        and preferences of consumers Sourcing We enable our
                        esteemed customers to source multiple across all
                        products and categories through our partners in key
                        markets. We provide them our market know-how, in- house
                        design-led capabilities while we are able to manage the
                        entire supply chain execution for our customers.
                        Manufacturing We have a created our own manufacturing
                        capacities spread across three countries – Bangladesh,
                        Sri Lanka and India, where we have as many as 130
                        production lines. Our customized services,
                        quality-focused approach and compliance has earned us
                        customer trust and loyalty.
                    </p>
                </div>

                <div class="w-full flex flex-wrap gap-6 py-5">
                    <div
                        class="w-full lg:w-[31%] relative p-5 bg-white rounded-xl group overflow-hidden"
                        v-for="(service, index) in mainServices"
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
                                    <h1
                                        class="text-4xl font-semibold text-white pt-2">
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

            <!-- Popular Services -->
            <div
                class="bg-[#211e3b] bg-gradient-to-tr from-blue-300/10 to-pink-300/10 via-purple-300/10 w-full flex items-center justify-center pb-20 my-6">
                <div class="container py-10 lg:py-16">
                    <h3
                        class="font-bold text-lg text-primary text-center uppercase">
                        Popular services
                    </h3>
                    <h1
                        class="text-center text-3xl capitalize text-slate-200 font-medium mt-3">
                        Our Professional Solutions For Business
                    </h1>
                    <div
                        class="w-full flex flex-wrap justify-between items-center mt-10 lg:my-16 gap-y-10">
                        <div
                            v-for="service in popularServices"
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
                            <p
                                class="py-3 leading-5 text-center text-slate-300">
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

            <!-- Services Counter -->
            <div
                class="w-full flex items-center justify-center -mt-28 lg:-mt-40 px-4 lg:px-0">
                <div
                    class="container p-16 bg-primary flex flex-wrap items-center justify-between rounded-xl gap-y-10">
                    <div
                        class="w-full xl:w-[23%] sm:w-[46%] flex flex-col items-center justify-start">
                        <figure class="text-4xl text-slate-100 p-2 mb-3">
                            <i class="fa-regular fa-gem" aria-hidden="true"></i>
                        </figure>
                        <div class="relative py-3">
                            <h1
                                class="text-5xl font-extrabold font-comfortaa text-slate-50 relative">
                                <span>231</span
                                ><span
                                    class="absolute block text-slate-100 -top-8 -right-7 text-4xl font-bold"
                                    >+</span
                                >
                            </h1>
                        </div>
                        <p class="text-slate-300 font-semibold text-xl">
                            Happy Clients
                        </p>
                    </div>
                    <div
                        class="w-full xl:w-[23%] sm:w-[46%] flex flex-col items-center justify-start">
                        <figure class="text-4xl text-slate-100 p-2 mb-3">
                            <i
                                class="fa-solid fa-pen-ruler"
                                aria-hidden="true"></i>
                        </figure>
                        <div class="relative py-3">
                            <h1
                                class="text-5xl font-extrabold font-comfortaa text-slate-50 relative">
                                <span>91,70,894</span
                                ><span
                                    class="absolute block text-slate-100 -top-8 -right-7 text-4xl font-bold"
                                    >+</span
                                >
                            </h1>
                        </div>
                        <p class="text-slate-300 font-semibold text-xl">
                            Order Completed
                        </p>
                    </div>
                    <div
                        class="w-full xl:w-[23%] sm:w-[46%] flex flex-col items-center justify-start">
                        <figure class="text-4xl text-slate-100 p-2 mb-3">
                            <i
                                class="fa-solid fa-hand-sparkles"
                                aria-hidden="true"></i>
                        </figure>
                        <div class="relative py-3">
                            <h1
                                class="text-5xl font-extrabold font-comfortaa text-slate-50 relative">
                                <span>1,462</span
                                ><span
                                    class="absolute block text-slate-100 -top-8 -right-7 text-4xl font-bold"
                                    >+</span
                                >
                            </h1>
                        </div>
                        <p class="text-slate-300 font-semibold text-xl">
                            Hours Of Support
                        </p>
                    </div>
                    <div
                        class="w-full xl:w-[23%] sm:w-[46%] flex flex-col items-center justify-start">
                        <figure class="text-4xl text-slate-100 p-2 mb-3">
                            <i
                                class="fa-solid fa-trophy"
                                aria-hidden="true"></i>
                        </figure>
                        <div class="relative py-3">
                            <h1
                                class="text-5xl font-extrabold font-comfortaa text-slate-50 relative">
                                <span>3499</span
                                ><span
                                    class="absolute block text-slate-100 -top-8 -right-7 text-4xl font-bold"
                                    >+</span
                                >
                            </h1>
                        </div>
                        <p class="text-slate-300 font-semibold text-xl">
                            Employee
                        </p>
                    </div>
                </div>
            </div>
        </article>
    </main>
</template>
