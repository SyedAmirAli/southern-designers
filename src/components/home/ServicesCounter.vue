<template>
    <div
        class="w-full flex items-center justify-center -mt-28 lg:-mt-40 px-4 lg:px-0 pb-4">
        <div class="container flex flex-wrap w-full gap-8">
            <div
                class="w-full lg:w-[calc(25%_-_32px)]"
                v-for="(service, index) in services"
                :key="index">
                <div class="w-full">
                    <div
                        class="p-10 bg-primary w-full flex flex-col items-center justify-center rounded-xl">
                        <span
                            class="text-7xl text-slate-100 p-2 mb-3"
                            v-html="service.icon">
                        </span>
                        <div class="relative py-3">
                            <h1
                                class="text-5xl font-extrabold font-comfortaa text-slate-50 relative">
                                <span>{{ service.count }}</span>
                                <span
                                    class="absolute block text-slate-100 -top-8 -right-7 text-4xl font-bold">
                                    +
                                </span>
                            </h1>
                        </div>
                        <p class="text-slate-300 font-semibold text-xl">
                            {{ service.name }}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    // defineProps({ services: { type: [Array, undefined], required: true } });
    const services = [
        {
            id: 1,
            name: 'Happy Clients',
            icon: '<i class="fa-regular fa-gem"></i>',
            count: 231,
        },
        {
            id: 2,
            name: 'Order Completed',
            icon: '<i class="fa-solid fa-pen-ruler"></i>',
            count: '9,170,894',
        },
        {
            id: 3,
            name: 'Hours Of Support',
            icon: '<i class="fa-solid fa-hand-sparkles"></i>',
            count: '1,462',
        },
        {
            id: 4,
            name: 'Employee',
            icon: '<i class="fa-solid fa-trophy"></i>',
            count: '3,499',
        },
    ];
</script>
