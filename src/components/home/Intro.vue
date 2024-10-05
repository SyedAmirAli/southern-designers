<template>
    <div class="w-full relative">
        <video
            src="\videos\home-page-video-1.mp4"
            autoplay
            loop
            muted
            playsinline
            class="w-full h-auto object-cover max-h-[100vh]"></video>
        <div
            class="absolute left-0 top-0 w-full h-full flex flex-col items-center justify-center bg-black/10">
            <div class="container">
                <div class="text-white">
                    <h2 class="text-6xl drop-shadow-2xl font-medium">
                        We believe in
                    </h2>
                    <h1 class="text-7xl font-bold py-3">
                        <FancyText />
                    </h1>
                    <h3 class="text-3xl pt-4">Not at the cost of our world.</h3>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    import FancyText from './FancyText.vue';
</script>
