import { ref } from 'vue';
import { defineStore } from 'pinia';

export const useHomeStore = defineStore('home', () => {
    const brands = ref([]);
    function setBrands(getBrands) {
        brands.value = getBrands;
    }

    return { brands, setBrands };
});

export default useHomeStore;
