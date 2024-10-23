<template>
    <div
        class="mt-10 lg:mt-16 flex bg-white border border-solid border-slate-200 rounded-md shadow-[0px_2px_4px_0px_rgba(0,0,0,0.1)]"
        :class="{
            'flex-col-reverse lg:flex-row-reverse': reverse,
            'flex-col lg:flex-row': !reverse,
        }">
        <figure
            class="before:content-[''] before:pt-[100%] lg:before:pt-[70%] before:block relative w-full">
            <img
                :src="asset(image)"
                alt="Sponsor A Child"
                class="w-full rounded-md absolute inset-0 h-full" />
        </figure>

        <div class="w-full flex flex-col p-6 lg:p-10">
            <div class="w-full flex gap-4 items-center justify-start">
                <figure
                    class="text-3xl text-primary px-4"
                    v-html="icon"></figure>
                <div>
                    <h2 class="font-semibold text-3xl text-primary">
                        {{ heading }}
                    </h2>
                    <p class="text-lg font-medium">
                        {{ title }}
                    </p>
                </div>
            </div>
            <p class="text-lg border-t mt-3 pt-5 border-solid border-slate-300">
                {{ description }}
            </p>
        </div>
    </div>
</template>

<script setup>
    // Defining the props directly for each value
    const props = defineProps({
        image: { type: [String, undefined], default: '' },
        icon: { type: [String, undefined], default: '' },
        heading: { type: [String, undefined], default: '' },
        title: { type: [String, undefined], default: '' },
        description: { type: [String, undefined], default: '' },
        reverse: { type: Boolean, required: false },
    });
</script>

<style scoped>
    /* Add custom styles if needed */
</style>
