<template>
    <div class="container pb-5">
        <div class="flex flex-col items-center justify-center">
            <h1 class="text-4xl font-semibold py-4">
                Contact With <span class="px-2 text-primary">US</span>
            </h1>
            <p class="max-w-[75%] w-full text-slate-600 leading-6 text-center">
                We provide integrated and customized solutions to global
                retailers and brands. We are an ethical and entrepreneurial
                company with a strong sustainability focus. With our keen design
                sense, extensive industry experience and adoption of the latest
                techniques and technologies, we are enabling the fashion
                industry around the world catering to the fast-evolving tastes
                and preferences of consumers Sourcing.
            </p>
        </div>

        <!-- Form -->
        <div class="w-full">
            <form
                class="w-full bg-white mb-0 mt-10 lg:my-10 p-8 rounded-3xl shadow-[0px_2px_4px_0px_rgba(0,0,0,0.1)]">
                <div class="w-full flex flex-col gap-3 sm:flex-row">
                    <Input v-model="form.name" name="name" title="Your Name" />
                    <Input v-model="form.name" name="email" title="E-mail" />
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

    const form = reactive({
        name: '',
        email: '',
        phone: '',
        address: '',
        message: '',
    });
</script>
