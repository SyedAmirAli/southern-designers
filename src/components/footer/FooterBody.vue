<template>
    <div class="w-full flex items-center justify-center pt-6">
        <div class="container pb-10">
            <div class="w-full flex flex-col 2xl:flex-row gap-y-4 sm:gap-y-10">
                <div
                    class="w-full flex flex-col md:flex-row gap-y-4 sm:gap-y-10">
                    <div class="w-full">
                        <figure class="w-full">
                            <img
                                src="https://greenlifebd.ctpse.info/uploads/1727955467-rand-387318-----1725991337-----logo-removebg-preview.png"
                                alt="Logo"
                                class="w-32" />
                        </figure>
                        <p class="py-3 px-1 text-justify text-lg font-medium">
                            Green Life Group - a 100% garment export group of
                            company who believes in the art of producing honest
                            and approving garments.
                        </p>
                        <!-- <div class="relative">
                            <input
                                type="text"
                                placeholder="e.g. example@gmail.com"
                                class="bg-slate-100 w-full border border-primary border-solid rounded-lg py-2 px-4" /><button
                                class="absolute right-0 top-0 bg-primary text-slate-100 text-xl px-3 py-[7px] rounded-md hover:bg-slate-900 duration-500">
                                <i
                                    class="fa-solid fa-paper-plane"
                                    aria-hidden="true"></i>
                            </button>
                        </div> -->
                    </div>
                    <div class="w-full md:px-12">
                        <h1 class="text-xl font-bold">Company</h1>
                        <ul class="p-2 mt-2">
                            <li
                                v-for="(item, index) in menuItems"
                                :key="index"
                                class="flex gap-3 items-center justify-start my-2">
                                <i
                                    class="fa-solid fa-angles-right text-primary"
                                    aria-hidden="true"></i>
                                <RouterLink
                                    :to="item.url"
                                    :target="item.target"
                                    class="duration-500 hover:ml-3 hover:text-primary font-medium hover:underline text-lg">
                                    {{ item.title }}
                                </RouterLink>
                            </li>
                        </ul>
                    </div>
                </div>
                <div
                    class="w-full flex flex-col md:flex-row gap-y-4 sm:gap-y-10">
                    <div class="w-full md:px-12">
                        <h1 class="text-xl font-bold">Factory Address</h1>
                        <div
                            v-for="(factory, index) in factories"
                            :key="index"
                            class="p-3 mt-2">
                            <p>
                                <i v-html="factory.icon" aria-hidden="true"></i>
                                <span
                                    class="font-bold text-sm text-slate-400 px-2"
                                    >{{ factory.name }}</span
                                >
                            </p>
                            <p class="pl-2">
                                <a
                                    :href="factory.url"
                                    class="font-medium text-lg mt-1 leading-6 duration-300 hover:text-primary hover:underline block">
                                    {{ factory.address }}
                                </a>
                                <a
                                    :href="factory.email"
                                    class="font-mono text-lg mt-1 leading-6 duration-300 hover:text-primary hover:underline block">
                                    {{ factory.email }}
                                </a>
                                <a
                                    :href="factory.hotline"
                                    class="font-mono text-lg mt-1 leading-6 duration-300 hover:text-primary hover:underline block">
                                    {{ factory.hotline }}
                                </a>
                            </p>
                        </div>
                    </div>
                    <div class="w-full">
                        <h1 class="text-xl font-bold">Contact Us</h1>
                        <div class="px-3 py-1">
                            <div class="flex gap-4">
                                <figure class="text-primary text-2xl">
                                    <i
                                        class="fa-solid fa-location-dot"
                                        aria-hidden="true"></i>
                                </figure>
                                <span class="font-bold text-lg text-slate-400"
                                    >House# 16, Road# 19, Sector# 4, Uttara,
                                    Dhaka - 1230 Bangladesh.</span
                                >
                            </div>
                        </div>
                        <div class="px-3 py-1">
                            <div class="flex gap-4">
                                <figure class="text-primary text-2xl">
                                    <i
                                        class="fa-solid fa-envelope-open-text"
                                        aria-hidden="true"></i>
                                </figure>
                                <span class="font-bold text-lg text-slate-400"
                                    >info@greenlifebd.com</span
                                >
                            </div>
                        </div>
                        <div class="px-3 py-1">
                            <div class="flex gap-4">
                                <figure class="text-primary text-2xl">
                                    <i
                                        class="fa-solid fa-phone-volume"
                                        aria-hidden="true"></i>
                                </figure>
                                <span class="font-bold text-lg text-slate-400"
                                    >+8809611651500</span
                                >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    const menuItems = [
        {
            id: 1,
            title: 'Home',
            url: '/',
            target: '_self',
        },
        {
            id: 7,
            title: 'About Us',
            url: '/about',
            target: '_self',
        },
        {
            id: 3,
            title: 'Products',
            url: '#',
            target: '_self',
        },
        {
            id: 2,
            title: 'Sustainability',
            url: '/sustainability',
            target: '_self',
        },
        {
            id: 6,
            title: 'Our Memories',
            url: '/media',
            target: '_self',
        },
        {
            id: 5,
            title: 'Contact Us',
            url: '/contact',
            target: '_self',
        },
    ];

    const factories = [
        {
            name: 'Southern Designers Ltd.',
            icon: '<i class="fa-solid fa-calendar-days"></i>',
            url: 'tel:+8809611651500',
            address: 'Zirabo, Savar, Dhaka',
            email: 'info@sdlbd.net',
            hotline: '+880 178087739',
        },
        {
            name: 'Green Life Knit Composite Ltd.',
            icon: '<i class="fa-solid fa-calendar-days"></i>',
            url: 'tel:+8809611651500',
            address: 'Tongabari, Ashulia, Savar',
            email: 'info@greenlifebd.com',
            hotline: '+880 178087739',
        },
    ];
</script>
