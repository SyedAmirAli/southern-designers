<template>
    <loading v-if="contact.state?.isLoading" />
    <div class="w-full flex flex-col items-center justify-center">
        <PageIntro :data="contact.state.data?.utilities" />

        <!-- <div
            class="bg-[url('/images/client-review-1.jpg')] h-[65vh] w-full bg-cover bg-center flex items-center justify-center">
            <div class="text-center text-white">
                <h1 class="text-4xl md:text-6xl font-bold">
                    Welcome to Southern Designer
                </h1>
                <p class="text-lg md:text-2xl mt-4">
                    Your tagline or call to action here
                </p>
                <button
                    class="mt-6 px-6 py-3 bg-primary text-white rounded-md hover:bg-green-500 font-semibold tracking-wide duration-500 hover:tracking-wider">
                    Learn More
                </button>
            </div>
        </div> -->

        <!-- Contact Contents -->
        <div
            class="container flex flex-col lg:flex-row gap-5 lg:gap-20 items-center justify-between mt-10 px-2 sm:px-0">
            <div class="w-full">
                <h1
                    class="text-4xl font-semibold mb-5 pb-2 text-slate-600 border-b border-solid border-slate-300">
                    {{ contact.state.data?.utilities?.contact_title }}
                </h1>
                <div
                    v-html="
                        contact.state.data?.utilities?.contact_description
                    "></div>
            </div>
            <div class="w-full">
                <form
                    @submit.prevent="formHandler"
                    class="w-full bg-slate-50 border border-solid border-slate-300 mb-0 mt-10 lg:my-10 px-8 pb-8 pt-6 rounded-3xl shadow-[0px_2px_4px_0px_rgba(0,0,0,0.1)]">
                    <h1
                        class="text-center text-3xl font-bold pb-4 border-b border-solid border-slate-300 mb-4">
                        Contact
                        <span class="px-2 text-primary">Information</span>
                    </h1>

                    <div class="w-full flex flex-col gap-3 sm:flex-row">
                        <Input
                            v-model="form.name"
                            name="name"
                            title="Your Name" />
                        <Input
                            v-model="form.email"
                            name="email"
                            title="E-mail" />
                    </div>
                    <div class="w-full flex flex-col gap-3 sm:flex-row mt-2">
                        <Input
                            v-model="form.phone"
                            name="phone"
                            title="Phone Number" />
                        <Input
                            v-model="form.address"
                            name="address"
                            title="Address" />
                    </div>
                    <div class="flex flex-col w-full gap-0.5 mt-4">
                        <label
                            for="description"
                            class="font-bold font-comfortaa">
                            Message
                        </label>
                        <textarea
                            rows="4"
                            name="message"
                            id="message"
                            v-model="form.message"
                            placeholder="Write here what's on your mind say..."
                            class="border border-solid font-comfortaa px-3 py-2 border-slate-300 rounded-md focus:outline-primary-main text-slate-900"></textarea>
                    </div>

                    <div class="w-full mt-4">
                        <button
                            class="w-full py-2 bg-slate-900 duration-500 hover:tracking-wide hover:bg-black text-white rounded-md pb-2.5 font-bold font-comfortaa">
                            Contact Us
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>
<script setup>
    import PageIntro from '@/components/commons/PageIntro.vue';
    import Input from '@/components/home/Input.vue';
    import useVueAxiosQuery from '@/utils/useVueAxiosQuery';
    import { onMounted, reactive } from 'vue';

    const form = reactive({
        name: '',
        email: '',
        phone: '',
        address: '',
        message: '',
    });

    const contact = useVueAxiosQuery({ endpoint: '/contact-items' });

    onMounted(async function () {
        const data = await contact.fetchWithAxios();
        info({ contact: data?.utilities });
    });

    async function formHandler() {
        const res = await contact.fetchWithAxios({
            endpoint: '/send-contact-message',
            method: 'POST',
            body: form,
            update: false,
        });

        if (res?.status === 'success') {
            alert('Your contact information has been recorded!');

            form.name = '';
            form.email = '';
            form.phone = '';
            form.address = '';
            form.message = '';
        }
    }
</script>
