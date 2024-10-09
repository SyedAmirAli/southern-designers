<template>
    <div class="w-full flex flex-col items-center justify-center">
        <div
            class="bg-[url('/images/client-review-2.jpg')] h-[65vh] w-full bg-cover bg-center flex items-center justify-center">
            <div class="text-center text-white">
                <h1 class="text-4xl md:text-6xl font-bold">
                    Welcome to Southern Designer
                </h1>
                <p class="text-lg md:text-2xl mt-4">
                    Your tagline or call to action here
                </p>
                <button
                    class="mt-6 px-6 py-3 bg-primary text-white rounded-md hover:bg-green-500 font-semibold tracking-wide duration-500 hover:tracking-wider">
                    Learn More
                </button>
            </div>
        </div>

        <!-- Product Contents -->
        <div
            class="container flex gap-5 lg:gap-20 items-center justify-between">
            <div
                class="w-full flex flex-col gap-10 items-center justify-center pb-10 pt-5">
                <div class="container mt-6">
                    <div
                        class="flex flex-col lg:flex-row gap-y-6 items-start lg:items-center justify-between">
                        <div>
                            <h2 class="font-bold text-xl text-primary">
                                <span class="tracking-[-4px] pr-4">----</span>
                                <span class="capitalize">
                                    {{
                                        // product?.utilities?.attributes?.heading
                                        (route.params?.slug || 'All') +
                                        ' Products'
                                    }}
                                </span>
                            </h2>
                            <h1
                                class="text-3xl text-nowrap lg:text-4xl font-bold mt-2">
                                {{ product?.utilities?.attributes?.title }}
                            </h1>
                        </div>
                    </div>

                    <hr
                        class="h-px w-full border-t border-dashed border-primary/40 mt-3" />

                    <!-- Category Navigation -->
                    <div
                        v-if="Array.isArray(product?.products?.data)"
                        class="w-full flex flex-wrap gap-4 justify-center mt-10">
                        <div
                            class="w-full md:w-[46%] lg:w-[32.5%] xl:w-[23%] gap-3 bg-slate-50 flex flex-col items-center justify-center relative group rounded-xl border border-solid border-slate-200"
                            v-for="(
                                item, index
                            ) in product.products.data.filter(
                                (p) =>
                                    selectedCategory === 0 ||
                                    p.category_id === selectedCategory
                            )"
                            :key="index"
                            :class="[index === 1 ? 'active' : '']">
                            <!-- Image Figure -->
                            <figure
                                v-if="item?.image"
                                class="image-figure before:content-[''] before:pt-[100%] before:block relative w-full">
                                <img
                                    :src="item?.image"
                                    :alt="item?.image"
                                    class="w-full rounded-md absolute inset-0 h-full object-cover" />
                            </figure>

                            <div class="w-full py-3 px-5">
                                <h2
                                    class="text-2xl font-semibold text-slate-900 duration-300">
                                    {{ item.title }}
                                </h2>
                                <p class="text-slate-600 mb-3 duration-300">
                                    {{ item.summery.slice(0, 70) + '...' }}
                                </p>

                                <div class="flex gap-3 w-full">
                                    <button
                                        @click="setActiveProduct(item)"
                                        class="font-bold bg-primary/70 p-2 uppercase rounded duration-500 hover:bg-primary text-slate-100 hover:tracking-[0.01em] w-full">
                                        <span>view details</span>
                                        <i
                                            class="fa-solid fa-arrow-right pl-3"></i>
                                    </button>
                                    <button
                                        class="font-bold bg-rose-500 px-6 py-2 uppercase rounded duration-500 hover:bg-rose-700 text-slate-100 hover:tracking-[0.01em]">
                                        <i class="fa-solid fa-heart"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Single Product View -->
                <SingleProduct :activeProduct="activeProduct" :close="close" />

                <!-- Pagination -->
                <div
                    class="container"
                    v-if="product?.products?.links?.length > 3">
                    <div class="flex justify-end items-end mt-4">
                        <nav aria-label="Page navigation">
                            <ul
                                class="inline-flex items-center -space-x-px flex-wrap">
                                <li
                                    v-for="page in product?.products?.links"
                                    :key="page">
                                    <button
                                        @click="paginateProduct(page)"
                                        :class="[
                                            'px-3 py-2 leading-tight font-comfortaa font-bold hover:text-primary text-gray-500 border border-gray-300 hover:bg-gray-100',
                                            page?.active
                                                ? 'bg-primary text-white'
                                                : 'bg-white text-gray-500',
                                        ]"
                                        v-html="page?.label"></button>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    import SingleProduct from '@/components/products/SingleProduct.vue';
    import { onMounted, ref } from 'vue';
    import { useRoute } from 'vue-router';
    const route = useRoute();

    info(route);

    const product = ref({});
    const selectedCategory = ref(0);
    const activeProduct = ref({ status: false, data: {} });

    function selectCategory(categoryId) {
        selectedCategory.value = categoryId;
    }

    function setActiveProduct(data) {
        activeProduct.value.status = true;
        activeProduct.value.data = data;
    }

    function close() {
        activeProduct.value.status = false;
    }

    async function paginateProduct(page) {
        if (page && 'url' in page) {
            const newUrl = new URL(page?.url);
            const pageNumber = newUrl.searchParams.get('page');
            await getData('/product-page-items?page=' + pageNumber);
        }
    }

    async function getData(endpoint = '/product-page-items') {
        const data = {
            utilities: {
                id: 11,
                key: 'PRODUCT_PAGE_UTILITIES_ITEMS',
                attributes: {
                    heading: 'our latest Products',
                    title: 'Our Latest Case Studies',
                },
                created_at: '2024-09-11T15:40:16.000000Z',
                updated_at: '2024-09-11T15:40:16.000000Z',
            },
            products: {
                current_page: 1,
                data: [
                    {
                        id: 9,
                        title: 'Knit #',
                        summery: 'Knit One, Two, Three, Four, Five.',
                        description: '<p>Knit One, Two, Three, Four, Five.</p>',
                        image: '/images/knit-6.jpg',
                        photos: '["/images/knit-6.jpg","/images/knit-7.jpg","/images/knit-12.jpg","/images/women-10.jpg"]',
                        featured: 0,
                        status: 1,
                        created_at: '2024-10-02T19:54:17.000000Z',
                        updated_at: '2024-10-02T19:54:17.000000Z',
                        category_id: 1,
                    },
                    {
                        id: 8,
                        title: 'Mens Knit',
                        summery:
                            'Our New Colleaction.. Our New Colleaction.Our New Colleaction.',
                        description:
                            '<table><tbody><tr><td data-row="1">Our New Colleaction.. Our New Colleaction.Our New Colleaction.</td></tr></tbody></table><p><br></p><table><tbody><tr><td data-row="1">Our New Colleaction.. Our New Colleaction.Our New Colleaction.</td></tr></tbody></table><p><br></p><table><tbody><tr><td data-row="1">Our New Colleaction.. Our New Colleaction.Our New Colleaction.</td></tr></tbody></table><p><br></p><table><tbody><tr><td data-row="1">Our New Colleaction.. Our New Colleaction.Our New Colleaction.</td></tr></tbody></table><p><br></p>',
                        image: '/images/knit-7.jpg',
                        photos: '["/images/knit-6.jpg","/images/knit-7.jpg","/images/knit-12.jpg","/images/women-10.jpg"]',
                        featured: 0,
                        status: 1,
                        created_at: '2024-09-12T12:09:18.000000Z',
                        updated_at: '2024-10-02T19:29:03.000000Z',
                        category_id: 1,
                    },
                    {
                        id: 5,
                        title: 'Knit',
                        summery:
                            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odio obcaecati illo possimus vitae dolorum minima, sequi qui autem inventore,',
                        description:
                            '<p><span class="ql-size-huge">Hello</span></p>',
                        image: '/images/knit-12.jpg',
                        photos: '["/images/knit-6.jpg","/images/knit-7.jpg","/images/knit-12.jpg","/images/women-10.jpg"]',
                        featured: 1,
                        status: 1,
                        created_at: '2024-09-11T10:16:29.000000Z',
                        updated_at: '2024-10-02T19:29:19.000000Z',
                        category_id: 1,
                    },
                    {
                        id: 4,
                        title: 'Knit',
                        summery:
                            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odio obcaecati illo possimus vitae dolorum minima, sequi qui autem inventore,',
                        description:
                            '<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odio obcaecati illo possimus vitae dolorum minima, sequi qui autem inventore,</p>',
                        image: '/images/knit-16.jpg',
                        photos: '["/images/knit-6.jpg","/images/knit-7.jpg","/images/knit-12.jpg","/images/women-10.jpg"]',
                        featured: 0,
                        status: 1,
                        created_at: '2024-09-11T10:16:22.000000Z',
                        updated_at: '2024-10-02T11:24:10.000000Z',
                        category_id: null,
                    },
                    {
                        id: 3,
                        title: 'Knit',
                        summery:
                            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odio obcaecati illo possimus vitae dolorum minima, sequi qui autem inventore,',
                        description:
                            '<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odio obcaecati illo possimus vitae dolorum minima, sequi qui autem inventore,</p>',
                        image: '/images/woven-10.jpg',
                        photos: '["/images/knit-6.jpg","/images/knit-7.jpg","/images/knit-12.jpg","/images/women-10.jpg"]',
                        featured: 1,
                        status: 1,
                        created_at: '2024-09-11T10:16:10.000000Z',
                        updated_at: '2024-10-02T11:30:18.000000Z',
                        category_id: null,
                    },
                    {
                        id: 2,
                        title: 'Wonen Knits',
                        summery:
                            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odio obcaecati illo possimus vitae dolorum minima, sequi qui autem inventore,',
                        description:
                            '<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odio obcaecati illo possimus vitae dolorum minima, sequi qui autem inventore,Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odio obcaecati illo possimus vitae dolorum minima, sequi qui autem inventore,</p>',
                        image: '/images/woven-14.jpg',
                        photos: '["/images/knit-6.jpg","/images/knit-7.jpg","/images/knit-12.jpg","/images/women-10.jpg"]',
                        featured: 0,
                        status: 1,
                        created_at: '2024-09-11T10:15:33.000000Z',
                        updated_at: '2024-10-02T19:29:28.000000Z',
                        category_id: 2,
                    },
                    {
                        id: 1,
                        title: 'Women Dress',
                        summery:
                            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odio obcaecati illo possimus vitae dolorum minima, sequi qui autem inventore,',
                        description:
                            '<p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odio obcaecati illo possimus vitae dolorum minima, sequi qui autem inventore,</p>',
                        image: '/images/knit-6.jpg',
                        photos: '["/images/knit-6.jpg","/images/knit-7.jpg","/images/knit-12.jpg","/images/women-10.jpg"]',
                        featured: 1,
                        status: 1,
                        created_at: '2024-09-11T10:14:29.000000Z',
                        updated_at: '2024-10-02T19:29:36.000000Z',
                        category_id: 2,
                    },
                ],
                first_page_url:
                    'http://localhost:8000/api/v1/product-page-items?page=1',
                from: 1,
                last_page: 1,
                last_page_url:
                    'http://localhost:8000/api/v1/product-page-items?page=1',
                links: [
                    {
                        url: null,
                        label: '&laquo; Previous',
                        active: false,
                    },
                    {
                        url: 'http://localhost:8000/api/v1/product-page-items?page=1',
                        label: '1',
                        active: true,
                    },
                    {
                        url: null,
                        label: 'Next &raquo;',
                        active: false,
                    },
                ],
                next_page_url: null,
                path: 'http://localhost:8000/api/v1/product-page-items',
                per_page: 500,
                prev_page_url: null,
                to: 7,
                total: 7,
            },
            categories: [
                {
                    id: 2,
                    title: 'Women',
                    image: 'uploads/1727896023-rand-862025-----woven-39.jpg',
                    status: 1,
                    created_at: '2024-10-02T19:07:03.000000Z',
                    updated_at: '2024-10-02T19:07:03.000000Z',
                },
                {
                    id: 1,
                    title: 'Knit',
                    image: 'uploads/1727896008-rand-702343-----knit-6.jpg',
                    status: 1,
                    created_at: '2024-10-02T19:06:48.000000Z',
                    updated_at: '2024-10-02T19:06:48.000000Z',
                },
            ],
        };

        if (data && 'products' in data) {
            product.value = data;
            activeProduct.value.data = data?.products?.data[0];
        }
    }

    onMounted(function () {
        getData();
    });
</script>
