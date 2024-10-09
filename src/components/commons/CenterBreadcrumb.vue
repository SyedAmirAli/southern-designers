<template>
    <div
        class="w-full flex flex-col items-center justify-center px-3 sm:pt-10 pb-4">
        <h1 class="text-4xl font-semibold pb-4 text-center">
            {{ title }}<span class="px-2 text-primary">{{ name }}</span>
        </h1>
        <p
            @click="isActive = !isActive"
            class="max-w-5xl w-full text-slate-600 leading-6 text-center md:hidden block">
            {{
                !isActive && summery.length > 200
                    ? summery.slice(0, 140) + '...'
                    : summery
            }}
        </p>
        <p
            class="max-w-5xl w-full text-slate-600 leading-6 text-center md:block hidden">
            {{ summery }}
        </p>
    </div>
</template>

<script setup>
    import { ref } from 'vue';
    const isActive = ref(false);

    defineProps({
        name: { type: [String, undefined], default: '' },
        title: { type: [String, undefined], default: '' },
        summery: {
            type: [String, undefined],
            default:
                'We provide integrated and customized solutions to global retailers and brands. We are an ethical and entrepreneurial company with a strong sustainability focus. With our keen design sense, extensive industry experience and adoption of the latest techniques and technologies, we are enabling the fashion industry around the world catering to the fast-evolving tastes and preferences of consumers Sourcing.',
        },
    });
</script>
