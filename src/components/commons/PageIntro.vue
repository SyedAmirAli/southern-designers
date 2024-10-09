<template>
    <div
        class="h-[65vh] w-full bg-cover bg-center flex items-center justify-center"
        :style="{ backgroundImage: `url(${asset(data.image)})` }">
        <div class="text-center text-white">
            <h1 class="text-4xl md:text-6xl font-bold">
                {{ data.heading }}
            </h1>
            <p class="text-lg md:text-2xl mt-4">
                {{ data.name }}
            </p>
            <a :href="data.btn_url" :target="data.btn_target">
                <button
                    class="mt-6 px-6 py-3 bg-primary text-white rounded-md hover:bg-green-500 font-semibold tracking-wide duration-500 hover:tracking-wider">
                    {{ data.btn_title }}
                </button>
            </a>
        </div>
    </div>
</template>

<script setup>
    const props = defineProps({
        data: {
            type: Object,
            default: {},
        },
    });
</script>
