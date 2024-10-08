<template>
    <loading v-if="about.state?.isLoading" />

    <div class="w-full flex flex-col items-center justify-center" v-else>
        <PageIntro :data="about.state.data?.utilities" />

        <!-- Sustainability Contents -->
        <div
            class="bg-white w-full flex flex-col items-center justify-center mb-6">
            <div class="container pt-6" v-if="about">
                <div
                    class="flex flex-col md:flex-row items-center justify-between">
                    <div class="mb-4 md:mb-0">
                        <h2 class="font-bold text-xl text-primary">
                            <span class="tracking-[-4px] pr-4">----</span>
                            <span>{{
                                about.state.data?.utilities?.primary_heading
                            }}</span>
                        </h2>
                        <h1 class="text-2xl md:text-4xl font-bold mt-4">
                            {{ about.state.data?.utilities?.primary_title }}
                        </h1>
                    </div>
                </div>

                <!-- Mission Container -->
                <Mission
                    :image="about.state.data?.utilities?.mission?.image"
                    :icon="about.state.data?.utilities?.mission?.icon"
                    :heading="about.state.data?.utilities?.mission?.heading"
                    :title="about.state.data?.utilities?.mission?.title"
                    :description="
                        about.state.data?.utilities?.mission?.description
                    " />

                <!-- Vision Container -->
                <Mission
                    :reverse="true"
                    :image="about.state.data?.utilities?.vision?.image"
                    :icon="about.state.data?.utilities?.vision?.icon"
                    :heading="about.state.data?.utilities?.vision?.heading"
                    :title="about.state.data?.utilities?.vision?.title"
                    :description="
                        about.state.data?.utilities?.vision?.description
                    " />
            </div>
        </div>

        <!-- About Members Part -->
        <MemberList
            :about="about.state.data?.members"
            :heading="about?.utilities?.attributes?.member_heading"
            :title="about?.utilities?.attributes?.member_title" />

        <!-- Youtube Iframe Videos -->
        <div class="py-10"></div>
    </div>
</template>

<script setup>
    import MemberList from '@/components/about/MemberList.vue';
    import Mission from '@/components/commons/Mission.vue';
    import PageIntro from '@/components/commons/PageIntro.vue';
    import useVueAxiosQuery from '@/utils/useVueAxiosQuery';
    import { onMounted, ref } from 'vue';

    const about = useVueAxiosQuery({ endpoint: '/about-items' });

    onMounted(async function () {
        const data = await about.fetchWithAxios();
        info({ members: data?.members });
    });
</script>
