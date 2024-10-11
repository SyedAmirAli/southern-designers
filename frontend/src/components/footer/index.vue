<template>
    <footer class="bg-secondary text-slate-300 px-2">
        <hr
            class="h-px w-full border-t border-solid border-slate-300/70 mb-6" />
        <FooterBody />
        <FooterEnd />
    </footer>
</template>

<script setup>
    import FooterBody from './FooterBody.vue';
    import FooterEnd from './FooterEnd.vue';
</script>
