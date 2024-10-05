<template>
    <div
        v-if="activeProduct?.status"
        class="fixed top-0 left-0 w-full flex items-center justify-center h-full z-10 p-2">
        <div
            class="container max-w-5xl bg-white p-4 rounded-3xl relative border max-h-[100vh] overflow-hidden pb-2">
            <div class="relative">
                <figure class="flex items-center justify-center">
                    <!-- :src="assetUrl(activeProduct?.data?.image)" -->
                    <img
                        :src="activeImage"
                        :alt="activeProduct?.data?.title"
                        class="h-[40vh] md:h-[55vh] lg:h-[70vh] rounded-xl" />
                </figure>

                <div
                    class="absolute left-0 bottom-0 w-full flex items-center justify-center gap-4 flex-wrap p-4">
                    <figure>
                        <img
                            @click="setActiveImage(activeProduct?.data?.image)"
                            :src="activeProduct?.data?.image"
                            :alt="activeProduct?.data?.title"
                            class="size-12 lg:size-24 rounded-lg lg:rounded-2xl ring-2 lg:ring-4 ring-slate-100 hover:ring-primary cursor-pointer"
                            :class="{
                                'ring-primary':
                                    activeProduct?.data?.image === activeImage,
                            }" />
                    </figure>
                    <figure
                        v-for="(image, index) in parser(
                            activeProduct?.data?.photos
                        )"
                        :key="index">
                        <img
                            @click="setActiveImage(image)"
                            :src="image"
                            :alt="activeProduct?.data?.title"
                            class="size-12 lg:size-24 rounded-lg lg:rounded-2xl ring-2 lg:ring-4 ring-slate-100 hover:ring-primary cursor-pointer"
                            :class="{
                                'ring-primary': image === activeImage,
                            }" />
                    </figure>
                </div>
            </div>

            <div class="p-2 w-full border-t border-solid border-slate-300">
                <h1 class="text-xl font-semibold text-primary">
                    {{ activeProduct?.data?.title }}
                </h1>
                <div>
                    <span class="font-bold text-sm text-slate-400"
                        >Summery:</span
                    >
                    {{ activeProduct?.data?.summery }}
                </div>
                <div>
                    <span class="font-bold text-sm text-slate-400"
                        >Description:</span
                    >
                    <div
                        class="mt-2 ql-editor w-full max-h-40 overflow-hidden overflow-y-visible has-scrollbar"
                        v-html="activeProduct?.data?.description"></div>
                </div>
            </div>

            <button
                @click="close"
                class="absolute top-0 right-0 m-6 duration-500 hover:bg-red-500 bg-primary rounded-full py-2 px-4 text-slate-100 text-xl">
                <i class="fa-solid fa-xmark"></i>
            </button>
        </div>
    </div>
</template>

<script>
    import { defineComponent, ref, watch } from 'vue';

    export default defineComponent({
        props: {
            activeProduct: { type: Object, required: true },
            close: { type: Function, required: true },
        },
        setup(props) {
            // Initialize reactive state
            const activeImage = ref(props.activeProduct?.data?.image);

            // Function to set the active image
            function setActiveImage(image) {
                activeImage.value = image;
            }

            // Watch for changes in props to update activeImage accordingly
            watch(
                () => props.activeProduct?.data?.image,
                (newImage) => {
                    activeImage.value = newImage;
                }
            );

            return { activeImage, setActiveImage, close: props.close };
        },
    });
</script>
