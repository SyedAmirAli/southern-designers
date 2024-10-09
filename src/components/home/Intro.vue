<template>
    <div class="w-full relative">
        <video
            :src="asset(utility.video)"
            autoplay
            loop
            muted
            playsinline
            class="w-full h-auto object-cover min-h-[60vh] max-h-[100vh]"></video>
        <div
            class="absolute left-0 top-0 w-full h-full flex flex-col items-center justify-center bg-black/10 px-2">
            <div
                class="container flex sm:block flex-col items-center justify-center">
                <div class="text-white">
                    <h2
                        class="text-3xl sm:text-6xl drop-shadow-2xl font-medium">
                        {{ utility.heading }}
                    </h2>
                    <h1 class="text-4xl sm:text-7xl font-bold py-3">
                        <FancyText :words="utility.texts" />
                    </h1>
                    <h3 class="text-2xl sm:text-3xl pt-4">
                        {{ utility.title }}
                    </h3>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    import FancyText from './FancyText.vue';
    const props = defineProps({ utility: { type: Object, default: {} } });

    info('Intro.vue', props.utility);
</script>
