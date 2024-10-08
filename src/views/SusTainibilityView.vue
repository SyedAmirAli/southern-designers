<template>
    <loading v-if="sustainability.state?.isLoading" />
    <div class="w-full flex flex-col items-center justify-center" v-else>
        <PageIntro :data="sustainability.state.data?.utilities" />

        <!-- <div
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
        </div> -->

        <!-- Sustainability Contents -->

        <div
            class="bg-white w-full flex flex-col items-center justify-center mb-6">
            <div class="container pt-6" v-if="sustainability">
                <Mission
                    :image="
                        sustainability.state.data?.utilities?.mission?.image
                    "
                    :icon="sustainability.state.data?.utilities?.mission?.icon"
                    :heading="
                        sustainability.state.data?.utilities?.mission?.heading
                    "
                    :title="
                        sustainability.state.data?.utilities?.mission?.title
                    "
                    :description="
                        sustainability.state.data?.utilities?.mission
                            ?.description
                    " />

                <!-- Vision Container -->
                <Mission
                    :reverse="true"
                    :image="sustainability.state.data?.utilities?.vision?.image"
                    :icon="sustainability.state.data?.utilities?.vision?.icon"
                    :heading="
                        sustainability.state.data?.utilities?.vision?.heading
                    "
                    :title="sustainability.state.data?.utilities?.vision?.title"
                    :description="
                        sustainability.state.data?.utilities?.vision
                            ?.description
                    " />
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
                                sustainability.state.data?.utilities
                                    ?.video_heading
                            }}</span>
                        </h2>
                        <h1 class="text-2xl md:text-4xl font-bold mt-4">
                            {{
                                sustainability.state.data?.utilities
                                    ?.video_title
                            }}
                        </h1>
                    </div>
                </div>

                <div class="w-full pt-10">
                    <div
                        class="flex flex-wrap gap-3 items-center justify-center">
                        <div
                            v-for="(item, index) in sustainability.state.data
                                ?.videos"
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
    import Mission from '@/components/commons/Mission.vue';
    import PageIntro from '@/components/commons/PageIntro.vue';
    import useVueAxiosQuery from '@/utils/useVueAxiosQuery';
    import { onMounted, ref } from 'vue';

    const sustainability = useVueAxiosQuery({
        endpoint: '/sustainability-items',
    });

    onMounted(async function () {
        const data = await sustainability.fetchWithAxios();
        info('sustainability', data);
    });
</script>
