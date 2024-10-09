<template>
    <loading v-if="media.state?.isLoading" />
    <div class="w-full flex flex-col items-center justify-center" v-else>
        <PageIntro :data="media.state.data?.utilities" />

        <MemoriesGallery
            :intro="media.state.data?.utilities"
            :medias="media.state.data?.medias" />
        <VideosGallery :videos="media.state.data?.videos" />
    </div>
</template>

<script setup>
    import PageIntro from '@/components/commons/PageIntro.vue';
    import MemoriesGallery from '@/components/susteinibility/MemoriesGallery.vue';
    import VideosGallery from '@/components/susteinibility/VideosGallery.vue';
    import useVueAxiosQuery from '@/utils/useVueAxiosQuery';
    import { onMounted } from 'vue';

    const media = useVueAxiosQuery({ endpoint: '/media-items' });

    onMounted(async function () {
        const data = await media.fetchWithAxios();
        info('MediaView.vue', data);
    });
</script>
