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

        <MemoriesGallery />
        <VideosGallery />
    </div>
</template>

<script setup>
    import MemoriesGallery from '@/components/susteinibility/MemoriesGallery.vue';
    import VideosGallery from '@/components/susteinibility/VideosGallery.vue';
</script>
