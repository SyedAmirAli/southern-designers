<template>
    <div class="w-full flex flex-col items-center justify-center">
        <div
            class="bg-[url('/images/client-review-3.jpg')] h-[50vh] w-full bg-cover bg-center flex items-center justify-center">
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

        <!-- Sustainability Contents -->

        <div
            class="bg-white w-full flex flex-col items-center justify-center mb-6">
            <div class="container pt-6">
                <Mission
                    :image="about?.mission?.attributes?.image"
                    :icon="about?.mission?.attributes?.icon"
                    :heading="about?.mission?.attributes?.heading"
                    :title="about?.mission?.attributes?.title"
                    :description="about?.mission?.attributes?.description" />

                <!-- Vision Container -->
                <Mission
                    :reverse="true"
                    :image="about?.vision?.attributes?.image"
                    :icon="about?.vision?.attributes?.icon"
                    :heading="about?.vision?.attributes?.heading"
                    :title="about?.vision?.attributes?.title"
                    :description="about?.vision?.attributes?.description" />
            </div>
        </div>

        <!-- Youtube Iframe Videos -->
        <div class="w-full flex items-center justify-center py-10 lg:py-20">
            <div class="container mt-6">
                <div
                    class="flex flex-col md:flex-row items-center justify-between">
                    <div class="mb-4 md:mb-0">
                        <h2 class="font-bold text-xl text-primary">
                            <span class="tracking-[-4px] pr-4">----</span>
                            <span>{{
                                about?.utilities?.attributes?.info_heading
                            }}</span>
                        </h2>
                        <h1 class="text-2xl md:text-4xl font-bold mt-4">
                            {{ about?.utilities?.attributes?.info_title }}
                        </h1>
                    </div>
                </div>

                <div class="w-full pt-10">
                    <div
                        class="flex flex-wrap gap-3 items-center justify-center">
                        <div
                            v-for="(item, index) in about?.videos"
                            :key="index"
                            class="w-full lg:w-[32%] sm:w-[48%] rounded-2xl overflow-hidden bg-white shadow-[0px_2px_4px_0px_rgba(0,0,0,0.1)]">
                            <div v-html="item?.embed_code"></div>

                            <p
                                class="p-3 min-h-20 leading-6 text-lg font-semibold hover:text-primary duration-300">
                                {{ item?.title }}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    import { sustainability } from '@/assets/data';
    import Mission from '@/components/commons/Mission.vue';
    import { onMounted, ref } from 'vue';

    const isLoading = ref(false);

    const about = ref({});

    async function getData() {
        const data = sustainability; // await fetchWithAxios({ endpoint: "/about-page-items" });

        if (data && 'about' in data) {
            about.value = data;
        }
    }

    onMounted(async function () {
        try {
            isLoading.value = true;
            await getData();
        } catch (error) {
        } finally {
            isLoading.value = false;
        }
    });
</script>
