<template>
    <div class="h-full min-h-40">
        <figure
            v-if="src"
            class="image-figure h-40 before:content-[''] before:block relative w-full"
            :style="{ '--before-top': pt + '%', width, maxWidth }">
            <img
                :src="src"
                :alt="alt"
                class="w-full rounded-md absolute inset-0 h-full object-cover" />
        </figure>
    </div>
</template>

<script>
    import { defineComponent } from 'vue';

    export default defineComponent({
        name: 'ImageFigure',
        props: {
            src: {
                type: [String, undefined, null],
                required: true,
            },
            alt: {
                type: String,
                default: 'Image',
            },
            width: {
                type: String,
                default: '200px',
            },
            maxWidth: {
                type: String,
                default: '24rem',
            },
            pt: {
                type: String,
                default: '100',
            },
        },
        setup() {
            return { assetUrl };
        },
    });
</script>

<style scoped>
    figure.image-figure:before {
        padding-top: var(--before-top);
    }
</style>

<!-- <figure
                    class="before:content-[''] before:pt-[100%] before:block relative max-w-sm w-full"
                >
                    <img
                        :src="assetUrl('assets/images/man1.jpg')"
                        alt="Sponsor A Child"
                        class="w-full rounded-md absolute inset-0 h-full object-cover"
                    />
                </figure> -->
