<template>
    <div class="container pb-5 lg:py-10 px-2 sm:px-0">
        <center-breadcrumb
            :name="intro.name"
            :title="intro.title"
            :summery="intro.summery" />

        <div class="flex flex-wrap w-full gap-6 py-10 justify-center">
            <div
                v-for="service in services"
                :key="service.id"
                class="w-full lg:w-[48%] xl:w-[31%] p-6 border border-solid border-slate-300 bg-white relative rounded-xl">
                <div>
                    <h2 class="text-xl font-medium">{{ service.name }}</h2>
                    <p class="text-justify leading-6 py-6">
                        {{ service.summery }}
                    </p>
                    <a :href="service.btn_url" class="mt-5 block rounded-md">
                        <button
                            class="flex gap-3 bg-primary text-white px-5 py-2 font-bold capitalize tracking-wide duration-300 hover:tracking-wider rounded hover:bg-black">
                            <span>{{ service.btn_title }}</span>
                            <span v-html="service.btn_icon"></span>
                        </button>
                    </a>
                </div>
                <div
                    class="absolute bottom-0 text-7xl pr-6 pb-6 text-slate-300 right-0">
                    <span v-html="service.icon"></span>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    defineProps({
        services: { type: [Array, undefined], required: true },
        intro: { type: Object, default: { name: '', title: '', summery: '' } },
    });
</script>

<style scoped></style>
