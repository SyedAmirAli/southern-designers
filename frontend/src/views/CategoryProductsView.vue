<template>
    <loading v-if="category.state?.isLoading" />
    <div class="w-full flex flex-col items-center justify-center" v-else>
        <div
            :style="{
                backgroundImage: `url('${asset(
                    category.state.data?.category?.image
                )}')`,
            }"
            class="h-[65vh] w-full bg-cover bg-center flex items-center justify-center">
            <div class="text-center text-white">
                <h1 class="text-4xl md:text-6xl font-bold">
                    {{ category.state.data?.category?.name }}
                </h1>
            </div>
        </div>

        <!-- Product Contents -->
        <div
            class="container flex gap-5 lg:gap-20 items-center justify-between px-2 sm:px-0">
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

                    <div
                        v-if="
                            category.state.data?.paginateProducts &&
                            'data' in category.state.data?.paginateProducts
                        "
                        class="w-full flex flex-wrap gap-4 justify-center mt-10">
                        <div
                            class="w-full md:w-[46%] lg:w-[32.5%] xl:w-[23%] gap-3 bg-slate-50 flex flex-col items-center justify-center relative group rounded-xl border border-solid border-slate-200"
                            v-for="(item, index) in category.state.data
                                ?.paginateProducts?.data"
                            :key="index"
                            :class="[index === 1 ? 'active' : '']">
                            <!-- Image Figure -->
                            <figure
                                v-if="item?.image"
                                class="image-figure before:content-[''] before:pt-[100%] before:block relative w-full">
                                <img
                                    :src="asset(item?.image)"
                                    :alt="item?.image"
                                    class="w-full rounded-md absolute inset-0 h-full object-cover" />
                            </figure>

                            <div class="w-full py-3 px-5">
                                <h2
                                    class="text-2xl font-semibold text-slate-900 duration-300">
                                    {{ item.name }}
                                </h2>
                                <p class="text-slate-600 mb-3 duration-300">
                                    {{ item?.title?.slice(0, 70) + '...' }}
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
    import useVueAxiosQuery from '@/utils/useVueAxiosQuery';
    import { onMounted, ref, watch } from 'vue';
    import { useRoute } from 'vue-router';
    const route = useRoute();

    const product = ref({});
    const activeProduct = ref({ status: false, data: {} });

    // const selectedCategory = ref(0);
    // function selectCategory(categoryId) {
    //     selectedCategory.value = categoryId;
    // }

    function setActiveProduct(data) {
        activeProduct.value.status = true;
        activeProduct.value.data = data;
    }

    function close() {
        activeProduct.value.status = false;
    }

    // async function paginateProduct(page) {
    //     if (page && 'url' in page) {
    //         const newUrl = new URL(page?.url);
    //         const pageNumber = newUrl.searchParams.get('page');
    //         await getData('/product-page-items?page=' + pageNumber);
    //     }
    // }

    // async function getData(endpoint = '/product-page-items') {}

    const category = useVueAxiosQuery({
        endpoint: '/category-with-products/' + route.params.slug,
    });

    watch(
        () => route.params,
        function (params) {
            category.fetchWithAxios({
                update: true,
                endpoint: '/category-with-products/' + params.slug,
            });
        }
    );

    onMounted(async function () {
        const data = await category.fetchWithAxios({ update: true });

        info('CategoryWithProducts.vue', data, route.params.slug);
    });
</script>
