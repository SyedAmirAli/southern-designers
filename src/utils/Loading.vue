<script setup>
    const { value } = defineProps({
        value: {
            type: Boolean,
            default: true,
        },
    });
</script>

<template>
    <div
        v-if="value"
        class="spinner-box fixed top-0 left-0 bottom-0 right-0 w-full h-screen flex items-center justify-center z-40 bg-opacity-60 backdrop-blur-sm">
        <div class="pulse-container relative z-50">
            <div class="pulse-bubble pulse-bubble-1 bg-primary"></div>
            <div class="pulse-bubble pulse-bubble-2 bg-primary"></div>
            <div class="pulse-bubble pulse-bubble-3 bg-primary"></div>
        </div>
    </div>
</template>

<style scoped>
    /* PULSE BUBBLES */

    .pulse-container {
        /* width: 120px; */
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 20px;
    }

    .pulse-bubble {
        width: 40px !important;
        height: 40px !important;
        border-radius: 50%;
    }

    .pulse-bubble-1 {
        animation: pulse 0.4s ease 0s infinite alternate;
    }
    .pulse-bubble-2 {
        animation: pulse 0.4s ease 0.2s infinite alternate;
    }
    .pulse-bubble-3 {
        animation: pulse 0.4s ease 0.4s infinite alternate;
    }

    @keyframes pulse {
        from {
            opacity: 1;
            transform: scale(1);
        }
        to {
            opacity: 0.25;
            transform: scale(0.75);
        }
    }
</style>
