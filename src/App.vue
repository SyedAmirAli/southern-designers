<script setup>
    import { RouterView } from 'vue-router';
    import Header from '@/components/header/index.vue';
    import Footer from '@/components/footer/index.vue';
</script>

<template>
    <Header />
    <RouterView />
    <Footer />
</template>

<style scoped></style>
