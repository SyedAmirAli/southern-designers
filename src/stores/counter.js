import { ref, computed } from 'vue';
import { defineStore } from 'pinia';
import { useRoute } from 'vue-router';

export const useCounterStore = defineStore('counter', () => {
    const route = useRoute();
    info('header', route.path);

    const count = ref(0);
    const currentPath = ref('/');

    const doubleCount = computed(() => count.value * 2);
    function increment() {
        count.value++;
    }

    function setCurrentPath() {
        currentPath.value = route.path;
    }

    return { count, doubleCount, increment, currentPath, setCurrentPath };
});
