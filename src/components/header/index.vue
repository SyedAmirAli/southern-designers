<template>
    <div
        class="fixed top-0 left-0 w-full z-10 flex items-center justify-center border-solid border-transparent bg-light border text-slate-100 bg-white/10 shadow-[0_0_50px_50px_rgba(255,255,255,0.1)]"
        :class="{ '!bg-white text-slate-900': scrolled }">
        <header class="container flex justify-between items-center bg-light">
            <div class="logo py-2">
                <img
                    src="https://greenlifebd.ctpse.info/uploads/1727955467-rand-387318-----1725991337-----logo-removebg-preview.png"
                    class="h-20" />
            </div>
            <nav class="">
                <ul
                    class="flex lg:flex gap-0 lg:gap-10 lg:items-center lg:justify-center text-lg font-semibold absolute lg:static top-24 lg:bg-light !bg-slate-100 lg:!bg-transparent z-20 p-6 lg:p-0 flex-col lg:flex-row -left-0 sm:w-full lg:w-auto border-b border-solid border-slate-300 lg:border-none w-[93%] bg-transparent"
                    :class="{ flex: isMobileMenu, hidden: !isMobileMenu }">
                    <li
                        v-for="nav in navItem"
                        :key="nav.id"
                        :class="{ active: nav.active }"
                        class="group relative py-0 lg:py-8 bg-light bg-transparent">
                        <RouterLink
                            :to="nav.href"
                            @click="isMobileMenu = false"
                            class="duration-300 lg:hover:text-primary group-hover:text-primary p-4 lg:p-0 rounded block lg:group-[.active]:text-primary group-[.active]:text-slate-100 group-[.active]:bg-primary lg:hover:bg-transparent lg:group-[.active]:bg-light lg:pb-1 lg:group-[.active]:bg-transparent">
                            <span
                                class="lg:group-hover:text-primary lg:group-[.active]:text-primary text-black lg:text-white"
                                :class="{ 'lg:text-black': scrolled }"
                                >{{ nav.name }}</span
                            >
                            <span
                                class="pl-3 text-sm mb-1 lg:group-hover:text-primary lg:group-[.active]:text-primary text-black lg:text-white"
                                v-if="nav.children.length">
                                <i
                                    class="fa-solid fa-chevron-down group-hover:rotate-180 duration-500"></i>
                            </span>
                        </RouterLink>
                        <p
                            className="duration-500 group-hover:w-full w-0 h-0.5 bg-primary group-[.active]:w-full"></p>

                        <ul
                            v-if="nav.children"
                            class="lg:absolute bg-slate-100 text-slate-900 rounded-lg lg:py-2 lg:bg-light border border-solid border-slate-200 top-[92px] shadow-[0px_2px_4px_0px_rgba(0,0,0,0.1)] hidden group-hover:block">
                            <li
                                v-for="category in nav.children"
                                :key="category.id"
                                class="group children px-6 py-2 min-w-52">
                                <router-link
                                    :to="`/product/${category.slug}`"
                                    class="block text-nowrap group-[.children:hover]:text-primary">
                                    <span> {{ category.name }}</span>

                                    <p
                                        className="duration-500 group-[.children:hover]:w-full w-0 h-0.5 bg-primary group-[.children.active]:w-full"></p>
                                </router-link>
                            </li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <div class="min-w-60 flex items-center justify-end gap-4">
                <a
                    target="_blank"
                    class="font-semibold bg-primary/80 text-slate-100 px-4 py-2 text-sm sm:text-[17px] sm:px-7 sm:py-4 uppercase rounded duration-500 hover:bg-primary hover:tracking-[0.01em] flex gap-2 items-center justify-center"
                    href="null">
                    <span class="flex gap-2">Quote Now</span>
                    <span class="pl-3">
                        <i
                            class="fa-solid fa-arrow-right-long"
                            aria-hidden="true"></i>
                    </span>
                </a>
                <div class="block lg:hidden pr-3">
                    <button
                        @click="toggleButton"
                        :class="[
                            isMobileMenu
                                ? 'bg-red-500 hover:bg-red-600'
                                : 'bg-primary/80 hover:bg-primary',
                        ]"
                        class="block font-semibold text-slate-100 px-3 py-1 text-lg sm:text-[17px] sm:px-5 sm:py-2.5 sm:text-2xl uppercase rounded duration-500 hover:tracking-[0.01em]">
                        <i
                            v-if="isMobileMenu"
                            class="fa-solid fa-xmark"
                            aria-hidden="true"></i>
                        <i
                            v-else
                            class="fa-solid fa-bars"
                            aria-hidden="true"></i>
                    </button>
                </div>
            </div>
        </header>
    </div>
</template>

<script setup>
    import useVueAxiosQuery from '@/utils/useVueAxiosQuery';
    import { onMounted, onUnmounted, reactive, ref, watch } from 'vue';
    import { useRoute } from 'vue-router';

    // Reactive state
    const route = useRoute();
    const isMobileMenu = ref(false);

    const path = ref(route.path); // Initialize path with the current route's path

    // Toggle button functionality
    const toggleButton = () => {
        isMobileMenu.value = !isMobileMenu.value;
    };

    const categories = ref([]);

    const category = useVueAxiosQuery({ endpoint: '/categories' });

    // Navigation items with active state
    const navItem = reactive([
        {
            id: 1,
            name: 'Home',
            href: '/',
            active: false,
            children: [],
        },
        {
            id: 6,
            name: 'About',
            href: '/about',
            active: false,
            children: [],
        },
        {
            id: 2,
            name: 'Product',
            href: '#',
            active: false,
            children: categories,
        },
        {
            id: 3,
            name: 'Sustainability',
            href: '/sustainability',
            active: false,
            children: [],
        },
        {
            id: 4,
            name: 'Media',
            href: '/media',
            active: false,
            children: [],
        },
        {
            id: 7,
            name: 'Contact',
            href: '/contact',
            active: false,
            children: [],
        },
    ]);

    // Function to update the `active` state of nav items based on the current path
    function updateActiveState(currentPath) {
        navItem.forEach((item) => {
            if (item.href === currentPath) {
                item.active = true;
            } else if (
                item.href === '/product' &&
                currentPath.includes('/product')
            ) {
                item.active = true; // For `/product` path or any dynamic product route
            } else {
                item.active = false;
            }
        });
    }

    // Run on mount to set the initial active state
    updateActiveState(path.value);

    // Scroll functionality
    const scrolled = ref(false);

    function throttle(fn, wait) {
        let lastCall = 0;
        return function (...args) {
            const now = new Date().getTime();
            if (now - lastCall < wait) return;
            lastCall = now;
            return fn(...args);
        };
    }

    const handleScroll = () => {
        scrolled.value = window.scrollY > 50;
    };

    const throttledScroll = throttle(handleScroll, 100); // Throttle to run once every 100ms

    // Watch for route changes and update the path and active state
    watch(
        () => route.path,
        (newPath) => {
            path.value = newPath;
            updateActiveState(newPath);
        },
        { immediate: true } // To run the watcher immediately on mount
    );

    onMounted(async () => {
        const data = await category.fetchWithAxios();
        categories.value = data;
        info(data);
        window.addEventListener('scroll', throttledScroll);
    });

    onUnmounted(() => {
        window.removeEventListener('scroll', throttledScroll);
    });
</script>

<!-- <script setup>
    import { useCounterStore } from '@/stores/counter';
    import { onMounted, onUnmounted, reactive, ref, watch } from 'vue';
    import { useRoute } from 'vue-router';

    // Reactive state
    const route = useRoute();
    const isMobileMenu = ref(false);

    const path = ref('/');

    // Toggle button functionality
    const toggleButton = () => {
        isMobileMenu.value = !isMobileMenu.value;
    };

    // const counter = useCounterStore();
    info('header', path.value);

    watch(
        () => route.path, // Watch the path specifically
        (newPath) => {
            path.value = newPath;
            info('New path:', newPath); // Log the current path on change
            info('header', path.value);
        }
    );

    // Navigation items with active state
    const navItem = reactive([
        {
            id: 1,
            name: 'Home',
            href: '/',
            active: '/' === path.value,
            children: [],
        },
        {
            id: 6,
            name: 'About',
            href: '/about',
            active: '/about' === path.value,
            children: [],
        },
        {
            id: 2,
            name: 'Product',
            href: '/product',
            active: path.value.includes('/product'),
            children: [
                { id: 1, name: 'Clothing', slug: 'Clothing' },
                { id: 2, name: 'Footwear', slug: 'Footwear' },
                { id: 3, name: 'Accessories', slug: 'Accessories' },
                { id: 4, name: 'Jewelry', slug: 'Jewelry' },
                { id: 5, name: 'Bags', slug: 'Bags' },
            ],
        },
        {
            id: 3,
            name: 'Sustainability',
            href: '/sustainability',
            active: '/sustainability' === path.value,
            children: [],
        },
        {
            id: 4,
            name: 'Media',
            href: '/media',
            active: '/media' === path.value,
            children: [],
        },
        {
            id: 7,
            name: 'Contact',
            href: '/contact',
            active: '/contact' === path.value,
            children: [],
        },
    ]);

    function throttle(fn, wait) {
        let lastCall = 0;
        return function (...args) {
            const now = new Date().getTime();
            if (now - lastCall < wait) return;
            lastCall = now;
            return fn(...args);
        };
    }

    const scrolled = ref(false);

    const handleScroll = () => {
        scrolled.value = window.scrollY > 50;
    };

    const throttledScroll = throttle(handleScroll, 100); // Throttle to run once every 100ms

    onMounted(() => {
        window.addEventListener('scroll', throttledScroll);
    });

    onUnmounted(() => {
        window.removeEventListener('scroll', throttledScroll);
    });
</script> -->

<style scoped></style>
