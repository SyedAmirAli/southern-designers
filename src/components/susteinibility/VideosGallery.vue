<template>
    <div
        class="w-full flex items-center justify-center py-10 mb-6 px-2 sm:px-0">
        <div class="container mt-6">
            <!-- <div class="flex flex-col md:flex-row items-center justify-between">
                <div class="mb-4 md:mb-0">
                    <h2 class="font-bold text-xl text-primary">
                        <span class="tracking-[-4px] pr-4">----</span>
                        <span> Media </span>
                    </h2>
                    <h1 class="text-2xl md:text-4xl font-bold mt-4">
                        Our Memories
                    </h1>
                </div>
            </div> -->

            <div class="w-full pt-10">
                <div class="flex flex-wrap gap-6 justify-center">
                    <div
                        v-for="(item, index) in videos"
                        :key="index"
                        class="w-full lg:w-[32%] 2xl:w-[23%] sm:w-[48%] rounded-2xl overflow-hidden bg-white shadow-[0px_2px_4px_0px_rgba(0,0,0,0.1)]">
                        <div v-html="item?.embed_code"></div>

                        <p
                            class="p-3 min-h-20 leading-6 text-lg font-semibold hover:text-primary duration-300 text-start">
                            {{ item?.title }}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script setup>
    defineProps({
        // intro: {
        //     type: Object,
        //     default: { memories_title: '', memories_heading: '' },
        // },
        videos: {
            type: Array,
            default: [],
        },
    });
</script>
