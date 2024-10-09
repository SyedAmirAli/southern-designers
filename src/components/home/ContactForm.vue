<template>
    <loading v-if="contact.state?.isLoading" />
    <div class="container pb-5 px-2 sm:px-0">
        <center-breadcrumb
            :name="intro.name"
            :title="intro.title"
            :summery="intro.summery" />

        <!-- Form -->
        <div class="w-full">
            <form
                @submit.prevent="formHandler"
                class="w-full bg-white mb-0 mt-10 lg:my-10 p-8 rounded-3xl shadow-[0px_2px_4px_0px_rgba(0,0,0,0.1)]">
                <div class="w-full flex flex-col gap-3 sm:flex-row">
                    <Input v-model="form.name" name="name" title="Your Name" />
                    <Input v-model="form.email" name="email" title="E-mail" />
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
                    <label for="description" class="font-bold font-comfortaa">
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
</template>

<script setup>
    import { reactive } from 'vue';
    import Input from './Input.vue';
    import useVueAxiosQuery from '@/utils/useVueAxiosQuery';

    const form = reactive({
        name: '',
        email: '',
        phone: '',
        address: '',
        message: '',
    });

    defineProps({
        intro: { type: Object, default: { name: '', title: '', summery: '' } },
    });

    const contact = useVueAxiosQuery({ endpoint: '/send-contact-message' });

    async function formHandler() {
        const res = await contact.fetchWithAxios({
            // endpoint: '/send-contact-message',
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
