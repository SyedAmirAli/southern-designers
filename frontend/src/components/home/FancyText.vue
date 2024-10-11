<template>
    <div class="">
        <h1 class="text-5xl sm:text-7xl font-bold duration-300 text-white">
            <span
                v-for="(char, index) in currentWord"
                :key="index"
                class="inline-block animate-slide">
                {{ char }}
            </span>
        </h1>
    </div>
</template>

<script setup>
    import { ref, onMounted, onUnmounted } from 'vue';

    // Array of words to animate
    const { words } = defineProps({ words: Array });

    const currentWord = ref('');
    let wordIndex = 0;
    let charIndex = 0;

    const changeWord = () => {
        currentWord.value = words[wordIndex].slice(0, charIndex + 1);
        charIndex++;

        // If we finish one word, move to the next word
        if (charIndex > words[wordIndex].length) {
            wordIndex = (wordIndex + 1) % words.length; // Cycle through the array
            charIndex = 0;
        }
    };

    // Start animation on mount
    let interval;
    onMounted(() => {
        interval = setInterval(changeWord, 200); // Adjust speed of character display
    });

    // Clear interval when component is destroyed
    onUnmounted(() => {
        clearInterval(interval);
    });
</script>

<style scoped>
    /* Tailwind Animations */
    @keyframes slide {
        from {
            transform: translateY(100%);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    .animate-slide {
        animation: slide 0.5s ease-in-out;
    }
</style>
